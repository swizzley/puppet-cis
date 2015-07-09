# class cis::params
# roles and profiles dictate core services configuration
# rsyslog handled by rsyslog module
# ntp handled by ntp module
# firewall handled by firewall module
# auditd handled by auditd module
# ntp handled by ntp module
# [TODO]: introduce IPA and re-configure exceptions
class cis::params {
  $accept_all_src_routes = undef
  $accept_redirects = undef
  $validate_route = false
  $ban_exceptions = undef
  $nat_box = undef
  $disable_simple_firewall = true
  $secure_grub = false
  $aide = true
  $lock_stale_users = false
  $sender_hostname = 'sender.example.org'
  $masquerade_domains = 'example.org'
  $relayhost = 'receiver.example.org'

  case $::operatingsystem {
    'RedHat', 'CentOS', 'Fedora' : {
      class { selinux: mode => 'enforcing' }
      $umask_daemon = '027'
      $umask_user = '077'
      $ssh_daemon = 'sshd'
      $http_daemon = 'httpd'
      $firewall_ui = ['firewalld']
      $service_base = ['crond', $ssh_daemon, 'iptables']
      $packages = ['cronie-anacron', 'tcp_wrappers', 'iptables-services']
      $disabled = [
        'rhnsd',
        'chargen-dgram',
        'chargen-stream',
        'daytime-stream',
        'daytime-dgram',
        'echo-dgram',
        'echo-stream',
        'tcpmux-server',
        'avahi-daemon',
        'cups',
        'autofs',
        'rpcsvgssd',
        'rpcgssd',
        'rpcbind',
        'rpcidmapd',
        'nfslock',
        ]
      $ban_all = [
        'dovecot',
        'squid',
        'setroubleshoot',
        'mctrans',
        'telnet-server',
        'telnet',
        'rsh-server',
        'rsh',
        'net-snmp',
        'ypserv',
        'ypbind',
        'tftp',
        'tftp-server',
        'talk',
        'talk-server',
        'xinetd',
        'xorg-x11-server-common',
        'dhcp',
        'openldap-servers',
        'openldap-clients',
        'bind',
        'vsftpd',
        'httpd',
        'samba',
        ]
    }
    'Debian', 'Ubuntu'           : {
      $umask_inactive = '035'
      $umask_user = '077'
      $ssh_daemon = 'ssh'
      $firewall_ui = ['ufw']
      $http_daemon = 'apache2'
      $service_base = ['cron', $ssh_daemon, 'apparmor']
      $packages = ['tcpd', 'apparmor-utils', 'apparmor-profiles']
      $disabled = ['rsync',]
      $ban_all = [
        'apport',
        'vsftpd',
        'discard',
        'bind9',
        'xinetd',
        'smbd',
        'apache2',
        'tftp',
        'avahi-daemon',
        'daytime',
        'echo',
        'whoopsie',
        'time',
        'telnet',
        'rpc',
        'nfs-kernel-server',
        'autofs',
        'prelink',
        'isc-dhcp-server',
        'isc-dhcp-server6',
        'xserver-xorg-core*',
        'slapd',
        'dovecot',
        'biosdevname',
        'snmpd',
        'nis',
        'chargen',
        'rsh-client',
        'atftp',
        'rsh-reload-client',
        'talk',
        'ntalk',
        'nfs',
        'squid3',
        'cups',
        'telnet-server',
        ]
    }
    default : {
    }
  }

  if ($ban_exceptions != undef and $disable_simple_firewall == true) {
    $banned = difference($ban_all, $ban_exceptions)
    $services = $service_base
  } elsif $ban_exceptions != undef and $disable_simple_firewall == false {
    $tmp = difference($ban_all, $ban_exceptions)
    $banned = concat($tmp, $firewall_ui)
    $services = concat($service_base, $firewall_ui)
  } elsif $ban_exceptions != true and $disable_simple_firewall == false {
    $banned = concat($ban_all, $firewall_ui)
    $services = concat($service_base, $firewall_ui)
  } elsif $ban_exceptions != true and $disable_simple_firewall == true {
    $banned = $ban_all
    $services = $service_base
  }
}
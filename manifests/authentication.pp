class cis::authentication (
  $lock_stale_users = $cis::params::lock_stale_users,
  $umask_user       = $cis::params::umask_user,
  $ssh_daemon       = $cis::params::ssh_daemon) inherits cis::params {
  file { ['/etc/passwd', '/etc/group']:
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  file { '/etc/shadow':
    owner => 'root',
    group => 'root',
    mode  => '0640',
  }

  file { ['/etc/issue', '/etc/motd']:
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/cis/banner',
  }

  file { '/etc/ssh/sshd_config':
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('cis/sshd_config.erb'),
    notify  => Service["${ssh_daemon}"],
  }

  file { '/etc/login.defs':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('cis/login.defs.erb'),
  # notify  => Service['auditd'], [TODO] debug auditd module
  }

  if ($::osfamily == 'Redhat') {
    file { '/etc/pam.d/system-auth-ac':
      mode   => '0644',
      owner  => 'root',
      group  => 'root',
      source => 'puppet:///modules/cis/system-auth',
    } ->
    file { '/etc/pam.d/system-auth':
      ensure => link,
      target => '/etc/pam.d/system-auth-ac',
    }

    file { '/etc/security/pwquality.conf':
      mode   => '0644',
      owner  => 'root',
      group  => 'root',
      source => 'puppet:///modules/cis/pwquality.conf',
    }
  }

  if ($::osfamily == 'Debian') {
    file { '/etc/pam.d/common-password':
      mode   => '0644',
      owner  => 'root',
      group  => 'root',
      source => 'puppet:///modules/cis/common-password',
    }

    file { '/etc/pam.d/su':
      mode   => '0644',
      owner  => 'root',
      group  => 'root',
      source => 'puppet:///modules/cis/su',
    }
  }
}

# class cis::auditd_rules
class cis::auditd_rules {
  # global x64 rules
  include auditd
  require auditd

  file { '/etc/audit/audit.rules':
    ensure => present,
    mode   => '0640',
    owner  => 'root',
    source => 'puppet:///modules/cis/audit.rules'
  }

}
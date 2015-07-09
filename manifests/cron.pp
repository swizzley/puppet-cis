# class cis::cron
class cis::cron {
  require cis::services

  file { ['/etc/cron.hourly', '/etc/cron.daily', '/etc/cron.weekly', '/etc/cron.monthly', '/etc/cron.d']:
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0770',
    recurse => true,
  }

  file { ['/etc/crontab', '/etc/cron.allow', '/etc/at.allow']:
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0770',
    content => "",
  }

  file { ['/etc/cron.deny', '/etc/at.deny']: ensure => 'absent', }

}
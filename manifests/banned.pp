class cis::banned ($banned = $cis::params::banned, $disabled = $cis::params::disabled) inherits cis::params {
  require cis::services

  service { $disabled:
    ensure => 'stopped',
    enable => false,
  }

  package { $banned: ensure => 'absent', }

}

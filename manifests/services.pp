# class cis::services
class cis::services ($services = $cis::params::services) inherits cis::params {
  require cis::packages

  service { $services:
    ensure => 'running',
    enable => true,
  }
}
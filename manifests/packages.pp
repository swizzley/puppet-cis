# class cis::packages
class cis::packages ($packages = $cis::params::packages) inherits cis::params {
  package { $packages: ensure => 'installed', }
}
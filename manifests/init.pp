# Class: cis
#
# This module manages cis parameters
#
# Parameters: see params and exceptions
#
#
# Requires: sysctl, firewall, stdlib
#
# Sample Usage: include cis
#
# Scope:
#   Services:
#      audit, sshd, iptables, crond, syslog, grub
#   Configuration:
#      system-auth, shell, profile, tty, useradd, pam, banner
#
class cis ($secure_grub = $cis::params::secure_grub, $aide = $cis::params::aide, $nat_box = $cis::params::nat_box) inherits 
cis::params {
  if $secure_grub {
    include cis::grub
  }

  if $nat_box != true {
    include cis::kernel
  }

  if $aide {
    package { 'aide': ensure => 'installed', } ->
    cron { 'aide_watch':
      command => '/usr/sbin/aide --check',
      user    => root,
      hour    => 5,
      minute  => 0
    }
  }
  include cis::packages
  include cis::services
  include cis::banned
  include cis::authentication
  include cis::cron
  include cis::auditd_rules
  include cis::mail
  include cis::inspect
  

}

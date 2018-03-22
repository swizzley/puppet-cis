class cis::kernel (
  $accept_all_src_routes = $cis::params::accept_all_src_routes,
  $accept_redirects      = $cis::params::accept_redirects,
  $ssh                   = $cis::params::ssh) inherits cis::params {

  if $ssh {
    require cis::authentication
  }

  # Disable
  sysctl { 'fs.suid_dumpable':
    ensure    => 'present',
    permanent => 'yes',
    value     => '0',
  }

  sysctl { 'net.ipv4.ip_forward':
    ensure    => 'present',
    permanent => 'yes',
    value     => '0',
  }

  sysctl { 'net.ipv6.conf.all.accept_ra':
    ensure    => 'present',
    permanent => 'yes',
    value     => '0',
  }

  # Enable
  sysctl { 'net.ipv4.conf.all.send_redirects':
    ensure    => 'present',
    permanent => 'yes',
    value     => '0',
  }

  sysctl { 'net.ipv4.conf.all.log_martians':
    ensure    => 'present',
    permanent => 'yes',
    value     => '1',
  }

  sysctl { 'net.ipv4.conf.default.log_martians':
    ensure    => 'present',
    permanent => 'yes',
    value     => '1',
  }

  # [TODO] find valid value for this
  #  sysctl { 'net.ipv4.route.flush':
  #    ensure    => 'present',
  #    permanent => 'yes',
  #    value     => '1',
  #  }

  sysctl { 'net.ipv4.icmp_echo_ignore_broadcasts':
    ensure    => 'present',
    permanent => 'yes',
    value     => '1',
  }

  sysctl { 'net.ipv4.icmp_ignore_bogus_error_responses':
    ensure    => 'present',
    permanent => 'yes',
    value     => '1',
  }

  sysctl { 'net.ipv4.tcp_syncookies':
    ensure    => 'present',
    permanent => 'yes',
    value     => '1',
  }

  # Conditional based on roles
  if $accept_all_src_routes == true {
    sysctl { 'net.ipv4.conf.all.accept_source_route':
      ensure    => 'present',
      permanent => 'yes',
      value     => '1',
    }
  } else {
    sysctl { 'net.ipv4.conf.all.accept_source_route':
      ensure    => 'present',
      permanent => 'yes',
      value     => '0',
    }
  }

  if $accept_redirects == true {
    sysctl { 'net.ipv4.conf.all.secure_redirects':
      ensure    => 'present',
      permanent => 'yes',
      value     => '1',
    }
  } else {
    sysctl { 'net.ipv4.conf.all.secure_redirects':
      ensure    => 'present',
      permanent => 'yes',
      value     => '0',
    }
  }

  if $validate_route == true {
    sysctl { 'net.ipv4.conf.all.rp_filter':
      ensure    => 'present',
      permanent => 'yes',
      value     => '1',
    }
  } else {
    sysctl { 'net.ipv4.conf.all.rp_filter':
      ensure    => 'present',
      permanent => 'yes',
      value     => '0',
    }
  }
}

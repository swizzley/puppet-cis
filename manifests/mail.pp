class cis::mail (
  $sender_hostname    = $cis::params::sender_hostname,
  $masquerade_domains = $cis::params::masquerade_domains,
  $relayhost          = $cis::params::relayhost) inherits cis::params {
  include postfix

  class { 'postfix::relay':
    sender_hostname    => $sender_hostname,
    masquerade_domains => $masquerade_domains,
    relayhost          => $relayhost
  }
}

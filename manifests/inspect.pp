class cis::inspect {
  # [TODO] debug and add to inspection
  #  exec { 'sudo cmd usage':
  #    command  => 'find PART -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk \'{print "-a always,exit -F path=" $1 " -F
  #   perm=x -F auid>=500 -F auid!=4294967295 -k privileged" }\'',
  #    provider => 'shell',
  #    path     => '/usr/bin'
  #  }
}
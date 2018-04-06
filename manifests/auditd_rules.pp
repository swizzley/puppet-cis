# class cis::auditd_rules
class cis::auditd_rules {
  # global x64 rules
  include auditd

  auditd::rule { '-w /etc/gshadow -p wa -k identity':
    order   => 1,
  }
  auditd::rule { '-w /etc/shadow -p wa -k identity':
    order   => 2,
  }
  auditd::rule { '-w /etc/security/opasswd -p wa -k identity':
    order   => 3,
  }
  auditd::rule { '-a exit,always -F arch=b64 -S sethostname -S setdomainname -k system-locale':
    order   => 4,
  }
  auditd::rule { '-a exit,always -F arch=b32 -S sethostname -S setdomainname -k system-locale':
    order   => 5,
  }
  auditd::rule { '-w /etc/issue -p wa -k system-locale':
    order   => 6,
  }
  auditd::rule { '-w /etc/hosts -p wa -k system-locale':
    order   => 7,
  }
  auditd::rule { '-w /etc/issue.net -p wa -k system-locale':
    order   => 8,
  }
  auditd::rule { '-w /etc/network -p wa -k system-locale':
    order   => 9,
  }
  auditd::rule { '-w /etc/selinux/ -p wa -k MAC-policy':
    order   => 10,
  }
  auditd::rule { '-w /var/log/faillog -p wa -k logins':
    order   => 11,
  }
  auditd::rule { '-w /var/log/lastlog -p wa -k logins':
    order   => 12,
  }
  auditd::rule { '-w /var/log/tallylog -p wa -k logins':
    order   => 13,
  }
  auditd::rule { '-w /var/run/utmp -p wa -k session':
    order   => 14,
  }
  auditd::rule { '-w /var/log/wtmp -p wa -k session':
    order   => 15,
  }
  auditd::rule { '-w /var/log/btmp -p wa -k session':
    order   => 16,
  }
  auditd::rule { '-a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=500 -F auid!=4294967295 -k perm_mod':
    order   => 17,
  }
  auditd::rule { '-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=500 -F auid!=4294967295 -k perm_mod':
    order   => 18,
  }
  auditd::rule { '-a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F auid>=500 -F auid!=4294967295 -k perm_mod':
    order   => 19,
  }
  auditd::rule { '-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=500 -F auid!=4294967295 -k perm_mod':
    order   => 20,
  }
  auditd::rule { '-a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=500 -F auid!=4294967295 -k perm_mod':
    order   => 21,
  }
  auditd::rule { '-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=500 -F auid!=4294967295 -k perm_mod':
    order   => 22,
  }
  auditd::rule { '-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=500 -F auid!=4294967295 -k access':
    order   => 23,
  }
  auditd::rule { '-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=500 -F auid!=4294967295 -k access':
    order   => 24,
  }
  auditd::rule { '-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=500 -Fauid!=4294967295 -k access':
    order   => 25,
  }
  auditd::rule { '-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=500 -F auid!=4294967295 -k access':
    order   => 26,
  }
  auditd::rule { '-a always,exit -F arch=b64 -S mount -F auid>=500 -F auid!=4294967295 -k mounts':
    order   => 27,
  }
  auditd::rule { '-a always,exit -F arch=b32 -S mount -F auid>=500 -F auid!=4294967295 -k mounts':
    order   => 28,
  }
  auditd::rule { '-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=500 -F auid!=4294967295 -k delete':
    order   => 29,
  }
  auditd::rule { '-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=500 -F auid!=4294967295 -k delete':
    order   => 30,
  }
  auditd::rule { '-w /etc/sudoers -p wa -k scope':
    order   => 31,
  }
  auditd::rule { '-w /var/log/sudo.log -p wa -k actions':
    order   => 32,
  }
  auditd::rule { '-w /sbin/rmmod -p x -k modules':
    order   => 33,
  }
  auditd::rule { '-w /sbin/modprobe -p x -k modules':
    order   => 34,
  }
  auditd::rule { '-a always,exit -F arch=b64 -S init_module -S delete_module -k modules':
    order   => 35,
  }
  auditd::rule { '-e 2':
    order   => 36,
  }

}

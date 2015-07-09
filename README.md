# timecapsule #

[![Puppet Forge](https://img.shields.io/badge/puppetforge-v0.1.0-blue.svg)](https://forge.puppetlabs.com/swizzley88/cis)

**Table of Contents**

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
4. [Usage](#usage)
5. [Requirements](#requirements)
6. [Compatibility](#compatibility)
7. [Limitations](#limitations)
8. [Development](#development)
    * [TODO](#todo)
    
## Overview ##

This is the CIS module for RHEL and Ubuntu based systems for server hardenining. 


## Module Description ##

This is a fully parametarized module for hardening servers to the CIS benchmark. The parameters let you easily specify to which degree you want to harden and easily allow for exceptions. This module includes everything scored in the latest CIS benchmarks which can be found in my CIS github repo.


## Setup ##

You may need to setup a mail relay, or if your in AWS and using SES, replace the cis::mail stuff with your SES credentials and include the SES module from the forge. Other than that just see the params for all your settings. 

## Usage ##

```
include ::cis
```

## Requirements ##

puppetlabs/stdlib >=4.6.0

puppetlabs/firewall >=1.1.3

kemra102/auditd >=1.0.2

fiddyspence/sysctl >=1.1.0

mjhas/postfix >=1.0.0

jfryman/selinux >=0.2.3

## Compatibility ##

  * RHEL 6,7
  * CentOS 6,7
  * Fedora 20,20,21
  * Ubuntu 12.04,14.04
  * Debian 6,7

## Limitations ##

This module has been tested on:

  - RHEL 6,7
  - Ubuntu 14.04 

## Development ##

Any updates or contibutions are welcome.

Report any issues with current release, as any input will be considered valuable.


#### TODO ####

  * add option for postfix or ses in params
 
###### Contact ######

Email:  morgan@aspendenver.org

WWW:    www.aspendenver.org

Github: https://github.com/swizzley


# Class: yumcheckupdates
# ===========================
#
# Full description of class yumcheckupdates here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'yumcheckupdates':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class yumcheckupdates {
	file {
		"yum_check_updates":
			ensure => 'file',
			content => "#!/bin/bash
PATH='/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/opt/puppetlabs/bin:/root/bin'
LANG=C

yum check-update -q | cut -d ' ' -f 1 | grep -e [a-zA-Z] | tr '\\n' ' ' > /tmp/yumcheckupdates
if [ \$(wc -c /tmp/yumcheckupdates | sed 's/ //g' | cut -d '/' -f 1) -eq 0 ]; then
	printf empty > /tmp/yumcheckupdateslist
	printf no > /tmp/yumcheckupdates
else
	cat /tmp/yumcheckupdates > /tmp/yumcheckupdateslist
	printf yes > /tmp/yumcheckupdates
fi

yum check-update --security -q | cut -d ' ' -f 1 | grep -e [a-zA-Z] | tr '\\n' ' ' > /tmp/yumcheckupdatessecurity
if [ \$(wc -c /tmp/yumcheckupdatessecurity | sed 's/ //g' | cut -d '/' -f 1) -eq 0 ]; then
	printf empty > /tmp/yumcheckupdateslistsecurity
	printf no > /tmp/yumcheckupdatessecurity
else
	cat /tmp/yumcheckupdatessecurity > /tmp/yumcheckupdateslistsecurity
	printf yes > /tmp/yumcheckupdatessecurity
fi

yum -q versionlock list | cut -d ':' -f 2- | tr '\\n' ' ' > /tmp/yumholdlist
if [ \$(wc -c /tmp/yumholdlist | sed 's/ //g') -eq 0 ]; then
	printf empty > /tmp/yumcheckholdlist
	printf no > /tmp/yumcheckhold
else
	cat /tmp/yumholdlist > /tmp/yumcheckholdlist
	printf yes > /tmp/yumcheckhold
fi

if needs-restarting -r; then
	printf no > /tmp/yumneedsreboot
else
	printf yes > /tmp/yumneedsreboot
fi

exit 0
",
			path => '/usr/local/bin/yum_check_updates.sh',
			owner => 'root',
			group => 'root',
			mode => '0755',
	}

	exec {
		"yum-update":
			command => '/usr/local/bin/yum_check_updates.sh',
			timeout => 60,
	}
}

#!/bin/sh
/usr/local/sbin/puppet-update.sh 2>/dev/null
/usr/local/sbin/puppet-apply.sh $1

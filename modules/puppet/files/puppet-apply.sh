#!/bin/sh
if [ "$TERM" = "dumb" ] || [ "$PS1" = "# " ] ; then
    NOCOLOR="--color false"
fi

/usr/bin/puppet apply --logdest console --logdest syslog $NOCOLOR /etc/puppet/manifests/mainrun.pp

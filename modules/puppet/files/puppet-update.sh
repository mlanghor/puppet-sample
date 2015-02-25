#!/bin/sh
BUCKET="puppet-sample2"

/usr/local/bin/s3cmd sync --no-progress --delete-removed s3://$BUCKET/puppet/ /etc/puppet/

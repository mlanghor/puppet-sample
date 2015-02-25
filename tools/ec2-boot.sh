#!/bin/sh
BUCKET_PUPPET="puppet-sample2"

apt-get update
apt-get --yes --force-yes install puppet python-pip
pip install boto
pip install s3cmd

tags () {
    if ! [ -f /etc/ec2-tags ] ; then
        python /etc/puppet/tools/get-tags.py
    fi
}

until \
    s3cmd sync --no-progress --delete-removed \
    s3://$BUCKET_PUPPET/puppet/ /etc/puppet/ && \
    tags && \
    /usr/bin/puppet apply /etc/puppet/manifests/mainrun.pp ; \
do sleep 5 ; done

# install puppet files
class puppet {
    file { '/etc/puppet':
        owner => 'root',
        mode => '0750',
    }

    file { '/usr/local/sbin/puppet-run.sh':
        source => 'puppet:///modules/puppet/puppet-run.sh',
        mode => '0555',
    }

    file { '/usr/local/sbin/puppet-apply.sh':
        source => 'puppet:///modules/puppet/puppet-apply.sh',
        mode => '0555',
    }

    file { '/usr/local/sbin/puppet-update.sh':
        source => 'puppet:///modules/puppet/puppet-update.sh',
        mode => '0555',
    }
}

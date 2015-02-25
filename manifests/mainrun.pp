File {
    owner => 'root',
    group => 'root',
}

include ntp
include puppet

case $::ec2_env {
    'live': {
        # put things specific to the live environment here
    }

    default: { }
}

# last stage used for things that must be applied AFTER all other
# modules have been applied
stage { 'last': require => Stage['main'] }

class {
    'puppet::cron': stage => last;
}

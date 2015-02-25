# puppet cron
class puppet::cron {
    cron { 'twice-hourly puppet run':
        ensure => 'present',
        command => 'sleep $(($RANDOM \% 300)) && /usr/local/sbin/puppet-run.sh > /dev/null',
        minute => ['0', '30'],
        hour => '*',
        user => 'root',
        require => File['/usr/local/sbin/puppet-run.sh'],
    }
}

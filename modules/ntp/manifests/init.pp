# Basic NTP class
class ntp {
    package { [
        'ntp',
    ]:
        ensure => 'installed',
    }

    package { [
        'tzdata',
    ]:
        ensure => 'latest',
    }

    file { '/etc/timezone':
        content => "America/Los_Angeles\n",
    }

    file { '/etc/localtime':
        ensure => 'symlink',
        target => '/usr/share/zoneinfo/America/Los_Angeles',
        require => [
            Package['tzdata'],
            File['/etc/timezone'],
        ],
    }

    file { '/etc/ntp.conf':
        source => 'puppet:///modules/ntp/ntp.conf',
        require => Package['ntp'],
        notify => Service['ntp'],
        mode => '0444',
    }

    service { 'ntp':
        ensure => 'running',
        enable => true,
        require => File['/etc/ntp.conf'],
    }
}

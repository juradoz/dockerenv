exec { "apt-autoremove":
        command => "/usr/bin/apt-get -y autoremove"
}

exec { "apt-update":
        command => "/usr/bin/apt-get update",
		require => Exec["apt-autoremove"]
}

package { "docker.io":
	ensure => installed,
	require => Exec["apt-update"]
}

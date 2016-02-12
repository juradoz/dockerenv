exec { "apt-autoremove":
        command => "/usr/bin/apt-get -y autoremove"
}

exec { "apt-update":
        command => "/usr/bin/apt-get update",
		require => Exec["apt-autoremove"]
}

package { "curl":
	ensure => installed,
	require => Exec["apt-update"]
}

exec { "docker_install":
	command => "curl -fsSL https://get.docker.com/ | sh",
	path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin"],
	creates => "/usr/bin/docker",
	require => Package["curl"]
}

user { "vagrant":
    ensure => present,
	groups => "docker"
}
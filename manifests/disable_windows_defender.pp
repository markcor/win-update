class win_defend::disable_windows_defender {

	service { wuauserv :
		ensure => 'stopped',
		enable => 'false',
	}

	registry_value { 'hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching\SearchOrderConfig' :
		ensure  => present,
		type    => dword,
		data    => "0",
	}
	registry_value { 'hklm\SOFTWARE\Microsoft\Windows\Windows\AU\NoAutoUpdate'  :
		ensure => present,
		type   => dword,
		data   => "1",
	}
	registry_value { 'hklm\SOFTWARE\Microsoft\Windows\Windows\AU\AUOptions' :
		ensure => present,
		type   => dword,
		data   => "2",
	}
}

class win_update::disable_windows_update {

	service { wuauserv :
		ensure => 'stopped',
		enable => 'false',
	}

	registry::value { 'SearchOrderConfig':
		key  => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching',
		type => dword,
		data => '0',
	}
	registry::value { 'NoAutoUpdate':
		key  => 'HKLM\SOFTWARE\Microsoft\Windows\Windows\AU',
		type => dword,
		data => '1',
	}
	registry::value { 'AUOptions':
		key  => 'HKLM\SOFTWARE\Microsoft\Windows\Windows\AU',
		type => dword,
		data => '2'
	}
}

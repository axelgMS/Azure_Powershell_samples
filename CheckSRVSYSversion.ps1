﻿$stdout = (Get-Item C:\Windows\System32\drivers\srv.sys).VersionInfo.FileVersion
return $stdout


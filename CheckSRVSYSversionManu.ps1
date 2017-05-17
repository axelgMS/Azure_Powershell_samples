$os = Get-WmiObject -class Win32_OperatingSystem
$osName = $os.Caption
$s = "%systemroot%\system32\drivers\srv.sys"
$v = [System.Environment]::ExpandEnvironmentVariables($s)
$version = (Get-Item $v).VersionInfo.FileVersionRaw.ToString().Split('.')
if ($version.Length -ne 4)
{
"Version number not recognised."
return
}
if ($osName.Contains("Vista") -or ($osName.Contains("2008") -and -not $osName.Contains("R2")))
{
if (([string]($version[3]))[0] -eq "1")
{
"OS is " + $osName + " GDR"
"Patch version is 6.0.6002.19743"
$patchVer = 6,0,6002,19743
} 
elseif (([string]($version[3]))[0] -eq "2")
{
"OS is " + $osName + " LDR"
"Patch version is 6.0.6002.24067"
$patchVer = 6,0,6002,24067
}
else
{
"OS is " + $osName
"Patch version is UNKNOWN"
$patchVer = 99999,99999,99999,99999
}
}
elseif ($osName.Contains("Windows 7") -or ($osName.Contains("2008 R2")))
{
"OS is " + $osName + " LDR"
"Patch version is 6.1.7601.23689"
$patchVer = 6,1,7601,23689
}
elseif ($osName.Contains("Windows 8.1") -or $osName.Contains("2012 R2"))
{
"OS is " + $osName + " LDR"
"Patch version is 6.3.9600.18604"
$patchVer = 6,3,9600,18604 
}
elseif ($osName.Contains("Windows 8") -or $osName.Contains("2012"))
{
"OS is " + $osName + " LDR"
"Patch version is 6.2.9200.22099"
$patchVer = 6,2,9200,22099
}
elseif ($osName.Contains("Windows 10"))
{
if ($os.BuildNumber -eq "10240")
{
"OS is " + $osName + " TH1"
"Patch version is 10.0.10240.17319"
$patchVer = 10,0,10240,17319 
}
elseif ($os.BuildNumber -eq "10586")
{
"OS is " + $osName + " TH2"
"Patch version is 10.0.10586.839"
$patchVer = 10,0,10586,839 
}
elseif ($os.BuildNumber -eq "14393")
{
"OS is " + $osName + " RS1"
"Patch version is 10.0.14393.953"
$patchVer = 10,0,14393,953 
}
elseif ($os.BuildNumber -eq "15063")
{
"OS is " + $osName + " RS2"
"No need to Patch. RS2 is released as patched. "
return
}
}
elseif ($osName.Contains("2016"))
{
"OS is " + $osName
"Patch version is 10.0.14393.953"
$patchVer = 10,0,14393,953
}
else
{
"OS is " + $osName
"Patch version is UNKNOWN"
$patchVer = 99999,99999,99999,99999 
}
if ($version[0] -gt $patchVer[0]) 
{
"Patch already applied"
return
}
if ($version[0] -lt $patchVer[0])
{
"Patch NOT applied yet"
return
}
if ($version[1] -gt $patchVer[1]) 
{
"Patch already applied"
return
}
if ($version[1] -lt $patchVer[1])
{
"Patch NOT applied yet"
return
}
if ($version[2] -gt $patchVer[2]) 
{
"Patch already applied"
return
}
if ($version[2] -lt $patchVer[2])
{
"Patch NOT applied yet"
return
}
if ($version[3] -ge $patchVer[3]) 
{
"Patch already applied"
return
}
if ($version[3] -lt $patchVer[3])
{
"Patch NOT applied yet"
return
} 

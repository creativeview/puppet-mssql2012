# Class: mssql2012
#
# This module manages mssql2012
#
# $media - location of installation files.
#
# Requires: see Modulefile
#
class mssql2012 (
# See http://msdn.microsoft.com/en-us/library/ms144259.aspx
  # Media is required to install
  $media = 'D:\\',
  $instancename   = $mssql2012::params::instancename,
  $features       = $mssql2012::params::features,
  $sapwd  = $mssql2012::params::sapwd,
  $agtsvcaccount  = $mssql2012::params::agtsvcaccount,
  $agtsvcpassword = $mssql2012::params::agtsvcpassword,
  $assvcaccount   = $mssql2012::params::assvcaccount,
  $assvcpassword  = $mssql2012::params::assvcpassword,
  $rssvcaccount   = $mssql2012::params::rssvcaccount,
  $rssvcpassword  = $mssql2012::params::rssvcpassword,
  $sqlsvcaccount  = $mssql2012::params::sqlsvcaccount,
  $sqlsvcpassword = $mssql2012::params::sqlsvcpassword,
  $instancedir    = $mssql2012::params::instancedir,
  $ascollation    = $mssql2012::params::ascollation,
  $sqlcollation   = $mssql2012::params::sqlcollation,
  $admin          = $mssql2012::params::admin,
) inherits mssql2012::params {

  # validation
  validate_string($media)
  validate_string($instancename)
  validate_string($features)
  validate_string($sapwd)
  validate_string($agtsvcaccount)
  validate_string($agtsvcpassword)
  validate_string($assvcaccount)
  validate_string($assvcpassword)
  validate_string($rssvcaccount)
  validate_string($rssvcpassword)
  validate_string($sqlsvcaccount)
  validate_string($sqlsvcpassword)
  validate_string($instancedir)
  validate_string($ascollation)
  validate_string($sqlcollation)
  validate_string($admin)

  User {
    ensure   => present,
    before => Exec['install_mssql2012'],
  }

  user { 'SQLAGTSVC':
    comment  => 'SQL 2012 Agent Service.',
    password => $agtsvcpassword,
  }
  user { 'SQLASSVC':
    comment  => 'SQL 2012 Analysis Service.',
    password => $assvcpassword,
  }
  user { 'SQLRSSVC':
    comment  => 'SQL 2012 Report Service.',
    password => $rssvcpassword,
  }
  user { 'SQLSVC':
    comment  => 'SQL 2012 Service.',
    groups   => 'Administrators',
    password => $sqlsvcpassword,
  }

  file { 'C:\sql2012install.ini':
    content => template('mssql2012/config.ini.erb'),
  }

  dism { 'NetFx3':
    ensure => present,
  }

  exec { 'install_mssql2012':
    command   => "${media}\\setup.exe /Action=Install /IACCEPTSQLSERVERLICENSETERMS /Q /HIDECONSOLE /CONFIGURATIONFILE=C:\\sql2012install.ini /SAPWD=\"${sapwd}\" /SQLSVCPASSWORD=\"${sqlsvcpassword}\" /AGTSVCPASSWORD=\"${agtsvcpassword}\" /ASSVCPASSWORD=\"${assvcpassword}\" /RSSVCPASSWORD=\"${rssvcpassword}\"",
    cwd       => $media,
    path      => $media,
    logoutput => true,
    timeout   => 1200,
    require   => [ File['C:\sql2012install.ini'],
                   Dism['NetFx3'] ],
  }
}

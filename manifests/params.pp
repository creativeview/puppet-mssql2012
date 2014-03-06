# == class: mssql2012::params
#
# This class manages MSSQL paraameters
#
# == Paramaters
#
# $instancename
# $features
# $sapwd
# $agtsvcaccount
# $agtsvcpassword
# $assvcaccount
# $assvcpassword
# $rssvcaccount
# $rssvcpassword
# $sqlsvcaccount
# $sqlsvcpassword
# $instancedir
# $ascollation
# $sqlcollation
# $admin
#
class mssql2012::params {
  $instancename   = 'MSSQLSERVER'
  $features       = 'SQLENGINE,CONN,SSMS,ADV_SSMS'
  $sapwd          = 'Sql!@as#2012demo' 
  $agtsvcaccount  = 'SQLAGTSVC'
  $agtsvcpassword = 'Sql!@gt#2012demo'
  $assvcaccount   = 'SQLASSVC'
  $assvcpassword  = 'Sql!@s#2012demo'
  $rssvcaccount   = 'SQLRSSVC'
  $rssvcpassword  = 'Sql!Rs#2012demo'
  $sqlsvcaccount  = 'SQLSVC'
  $sqlsvcpassword = 'Sql!#2012demo'
  $instancedir    = 'C:\Program Files\Microsoft SQL Server\\'
  $ascollation    = 'Latin1_General_CI_AS'
  $sqlcollation   = 'SQL_Latin1_General_CP1_CI_AS'
  $admin          = 'Administrator'
}
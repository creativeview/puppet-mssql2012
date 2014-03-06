# Microsoft SQL Server 2012 puppet module #

This module installs Microsoft SQL Server 2012. It is based on the [Puppetlabs MSSQL module](https://forge.puppetlabs.com/puppetlabs/mssql)

## Installation

```bash
puppet module install puppetlabs-mssql
```
This module depends on DISM module to enable .net 3.5 on Windows Server:

* [dism module] (http://forge.puppetlabs.com/puppetlabs/dism)

## Usage

Example:

```puppet
class {'mssql2012':
        media          => 'D:\\',
        instancename   => 'MSSQLSERVER',
        features       => 'SQLENGINE,CONN,SSMS,ADV_SSMS',
        sapwd		   => 'saAccounPassdemo!',
        agtsvcaccount  => 'SQLAGTSVC',
        agtsvcpassword => 'Agtsvc2012demo!',
        assvcaccount   => 'SQLASSVC',
        assvcpassword  => 'Assvc2012demo!',
        rssvcaccount   => 'SQLRSSVC',
        rssvcpassword  => 'Rssvc2012demo!',
        sqlsvcaccount  => 'SQLSVC',
        sqlsvcpassword => 'Svc2012demo!',
        instancedir    => "C:\\Program Files\\Microsoft SQL Server",
        ascollation    => 'Latin1_General_CI_AS',
        sqlcollation   => 'SQL_Latin1_General_CP1_CI_AS',
        admin          => 'Administrator'
    }
```

See http://msdn.microsoft.com/en-us/library/ms144259.aspx for more information about intalling SQL Server 2012 from the Command Prompt.
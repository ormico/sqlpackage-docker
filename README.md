# SqlPackage in a Docker image

[SqlPackage](https://docs.microsoft.com/en-us/sql/tools/sqlpackage?view=sql-server-ver15) is a Microsoft tool for importing and exporting bacpac and dacpac files from SQL Server.

This Docker image contains sqlpackage and is designed for when you want to run SqlPackage without installing it locally.

This image also contains `sqlcmd`. This makes this image very useful for running basic SQL Server tasks.

# Docker Hub

[ormico/sqlpackage](https://hub.docker.com/r/ormico/sqlpackage)

This image is updated regularly on Docker Hub to contain the latest changes from SqlPackage and the base image.

# GitHub 

[https://github.com/ormico/sqlpackage-docker](https://github.com/ormico/sqlpackage-docker)

# How to use

Examples are in Powershell but can be easily converted to bash.

## SqlPackage
The following example downloads a bacpac of database exampledb1 to a folder named download.

Start by creating a `$path` variable which is an absolute path to a folder named `download`.

Then execute `sqlpackage` by running the docker container and specifying sqlpackage and the parameters. Progress will be printed to the console and the file will be saved to the `download` subfolder.
```
$path = join-path (pwd) '/download'
docker container run -ti --rm -v ${path}:/download ormico/sqlpackage sqlpackage /a:export /scs:"Server=my-example-azure-server.database.windows.net;Database=exampledb1;User Id=myadmin;Password=Password1@;" /tf:/download/exampledb1.bacpac
```

# Known Issues

* Base image is the MS SQL Server 2019 image. I don't use SQL Server but it was the only base image I could find that would successfully run SqlPackage. This does cause a message to print with SQL Server information when the container starts. A future version may remove SQL Server by changing the base image again.

# Additional Resources
* [https://github.com/microsoft/mssql-docker](https://github.com/microsoft/mssql-docker)
* [Linux Microsoft ODBC Driver for SQL Server](https://docs.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver15#ubuntu17)

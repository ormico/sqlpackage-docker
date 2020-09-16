# SqlPackage in a Docker image

[SqlPackage](https://docs.microsoft.com/en-us/sql/tools/sqlpackage?view=sql-server-ver15) is a Microsoft tool for importing and exporting bacpac and dacpac files from SQL Server.

This Docker image contains sqlpackage and is designed for when you want to run SqlPackage without installing it locally.

# Not Working
This is not working. I've worked through a lot of issues but I'm currently stuck. I cannot get SqlPackage to run in any linux environment. I will push up my latest changes and notes.

# Docker Hub

[ormico/sqlpackage](https://hub.docker.com/r/ormico/sqlpackage)

This image is updated regularly on Docker Hub to contain the latest changes from SqlPackage and the base image.

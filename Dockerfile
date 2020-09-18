FROM mcr.microsoft.com/mssql/server:2019-latest
LABEL maintainer="Zack Moore https://github.com/ormico/"
USER root
VOLUME download
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        unzip \
        msodbcsql17 \
        mssql-tools
RUN wget -O sqlpackage.zip https://go.microsoft.com/fwlink/?linkid=2134311 \
    && unzip sqlpackage.zip -d /opt/sqlpackage \
    && chmod +x /opt/sqlpackage/sqlpackage \
    && rm /sqlpackage.zip
USER mssql
ENV PATH=$PATH:/opt/mssql-tools/bin:/opt/sqlpackage

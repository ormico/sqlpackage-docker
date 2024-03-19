FROM mcr.microsoft.com/mssql/server:2022-latest
LABEL maintainer="Zack Moore https://github.com/ormico/"
USER root
VOLUME download
ENV ACCEPT_EULA=Y
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        unzip \
        msodbcsql18 \
        mssql-tools
RUN wget -O sqlpackage.zip https://aka.ms/sqlpackage-linux \
    && unzip sqlpackage.zip -d /opt/sqlpackage \
    && chmod +x /opt/sqlpackage/sqlpackage \
    && rm /sqlpackage.zip
RUN wget "http://ftp.us.debian.org/debian/pool/main/o/openssl/libssl3_3.1.5-1_amd64.deb" \
    && dpkg -i libssl3_3.1.4-2_amd64.deb \
    && rm libssl3_3.1.4-2_amd64.deb
#USER mssql
ENV PATH=$PATH:/opt/mssql-tools/bin:/opt/sqlpackage

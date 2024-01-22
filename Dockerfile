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
RUN wget "http://ftp.de.debian.org/debian/pool/main/o/openssl/libssl1.1_1.1.1w-0+deb11u1_amd64.deb" \
    && dpkg -i libssl1.1_1.1.1w-0+deb11u1_amd64.deb
#USER mssql
ENV PATH=$PATH:/opt/mssql-tools/bin:/opt/sqlpackage

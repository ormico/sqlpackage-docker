FROM mcr.microsoft.com/mssql/server:2019-latest
LABEL maintainer="Zack Moore https://github.com/ormico/"
USER root
VOLUME download
RUN apt-get update \
    && apt-get upgrade -y \
    && ACCEPT_EULA=Y apt-get install -y \
        unzip \
        msodbcsql17 \
        mssql-tools
RUN wget -O sqlpackage.zip https://aka.ms/sqlpackage-linux \
    && unzip sqlpackage.zip -d /opt/sqlpackage \
    && chmod +x /opt/sqlpackage/sqlpackage \
    && rm /sqlpackage.zip
RUN wget "http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.10_amd64.deb" \
    && dpkg -i libssl1.0.0_1.0.2n-1ubuntu5.10_amd64.deb
#USER mssql
ENV PATH=$PATH:/opt/mssql-tools/bin:/opt/sqlpackage

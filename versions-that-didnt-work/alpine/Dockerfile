# SQL Server Command Line Tools
FROM alpine
LABEL maintainer="Zack Moore https://github.com/ormico/"

# apt-get and system utilities
RUN apk update && apk upgrade && apk add \
	curl gnupg \
    && rm -rf /var/lib/apt/lists/*
# apt-transport-https debconf-utils libunwind8 
# INSTALL SQLPACKAGE
RUN apk add unzip
RUN curl -Lq https://go.microsoft.com/fwlink/?linkid=2134311 -o sqlpackage-linux-x64-latest.zip
RUN unzip sqlpackage-linux-x64-latest.zip -d /sqlpackage
RUN chmod a+x /sqlpackage/sqlpackage
RUN echo 'export PATH="$PATH:/sqlpackage"' >> ~/.bashrc

COPY ./sqlpackage.runtimeconfig.json /sqlpackage/
CMD /sqlpackage/sqlpackage

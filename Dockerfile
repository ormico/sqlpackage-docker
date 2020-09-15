FROM ubuntu:20.04
USER root

RUN apt-get update \
    && apt-get upgrade \
    && apt-get install -y \
        curl \
        unzip \
        libunwind8 \
        libicu55 \
#        libssl10 \
        software-properties-common \
    && add-apt-repository 'deb http://security.ubuntu.com/ubuntu xenial-security main' \
    && apt-get install -y libssl.so.1.0.0 \
#    && add-apt-repository universe \
    && curl -Lq https://go.microsoft.com/fwlink/?linkid=2134311 -o sqlpackage-linux-x64-latest.zip \    
    && unzip sqlpackage-linux-x64-latest.zip -d /opt/sqlpackage \
    && chmod a+x /opt/sqlpackage/sqlpackage
#     \
#    && /bin/bash -c "source /root/.bashrc"
RUN echo 'export PATH="$PATH:/opt/sqlpackage"' >> ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"

#ENV PATH="$PATH:/opt/sqlpackage"

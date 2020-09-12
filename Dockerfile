FROM mcr.microsoft.com/dotnet/core/runtime
USER root

RUN apt-get update && \
    apt-get install -y \
        curl \
        unzip \
        libunwind8 \
        software-properties-common \
#    && add-apt-repository universe \
    && curl -Lq https://go.microsoft.com/fwlink/?linkid=873926 -o sqlpackage-linux-x64-latest.zip \
    && unzip sqlpackage-linux-x64-latest.zip -d /opt/sqlpackage \
    && chmod a+x /opt/sqlpackage/sqlpackage \
#    && apt-get install -y libicu60 \
    && /bin/bash -c "source /root/.bashrc"
ENV PATH="$PATH:/opt/sqlpackage"

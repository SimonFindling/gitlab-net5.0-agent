FROM mcr.microsoft.com/dotnet/sdk:5.0

ENV DEBIAN_FRONTEND=noninteractive

# add dotnet global tools to path
ENV PATH="$PATH:/root/.dotnet/tools"

# install requirements
RUN mkdir -p /usr/share/man/man1 /usr/share/man/man2
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        openjdk-11-jre zip

# install SonarScanner
RUN dotnet tool install --global dotnet-sonarscanner

# install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

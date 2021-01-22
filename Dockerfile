FROM mmcr.microsoft.com/dotnet/sdk:5.0

# add dotnet global tools to path
ENV PATH="$PATH:/root/.dotnet/tools"

# install requirements
RUN apt-get update \
    && apt-get install -y openjdk-11-jre zip

# install SonarScanner
RUN dotnet tool install --global dotnet-sonarscanner

# install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
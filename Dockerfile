FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine

# add dotnet global tools to path
ENV PATH="$PATH:/root/.dotnet/tools"

# install SonarScanner
RUN apk add --update openjdk11-jre \
    && dotnet tool install --global dotnet-sonarscanner

# install Azure CLI
RUN apk add --update py-pip \
    && apk add --update --virtual build-dependencies libffi-dev openssl-dev gcc python3-dev musl-dev make \
    && pip install azure-cli \
    && apk del build-dependencies
    
# install zip
RUN apk add zip

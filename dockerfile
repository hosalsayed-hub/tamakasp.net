FROM mcr.microsoft.com/dotnet/aspnet:5.0

ARG WEBAPP_VERSION=0.0.1
LABEL maintainer=anymail@email_server.com \
    Name=webapp \
    Version=${WEBAPP_VERSION}
ARG URL_PORT
WORKDIR /app
ENV NUGET_XMLDOC_MODE skip
ENV ASPNETCORE_URLS http://*:${URL_PORT}
ENTRYPOINT [ "dotnet", "FreeCourse.dll" ]
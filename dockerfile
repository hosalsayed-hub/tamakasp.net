FROM mcr.microsoft.com/dotnet/sdk:5.0-buster-slim as base
WORKDIR /app
EXPOSE 80
#copy /app /app

FROM mcr.microsoft.com/dotnet/sdk:5.0-buster-slim as build
WORKDIR /app
COPY ["Frontends/FreeCourse.Web/*.csproj","FreeCourse.Web/"]
COPY . .
#COPY ["/Frontends/FreeCourse.Web/*.csproj","Frontends/FreeCourse.Web/"]
RUN dotnet restore "Frontends/FreeCourse.Web/*.csproj"
WORKDIR "/app/FreeCourse.Web/"
RUN dotnet build "Frontends/FreeCourse.Web/*.csproj" -c Release -o /app/build

FROM build as publish
RUN dotnet publish "FreeCourse.Web.csproj" -c Release -o /app/publish
#FROM mcr.microsoft.com/dotnet/aspnet:5.0-buster-slim as runtime
#WORKDIR /app
#COPY --from=build /app/out 

FROM base as final
WORKDIR /app
COPY --from=publish /app/out .
ENTRYPOINT [ "dotnet","FreeCourse.Web.dll" ]
FROM mcr.microsoft.com/dotnet/sdk:5.0-buster-slim as baseins
WORKDIR /app
EXPOSE 80
copy /app /app
#FROM mcr.microsoft.com/dotnet/sdk:5.0-buster-slim as build
#WORKDIR /scr
#COPY ["/Shared/Course.Shared/*.csproj","Shared/Course.Shared/"]
#COPY ["/Frontends/FreeCourse.Web/*.csproj","Frontends/FreeCourse.Web/"]
#RUN dotnet restore "Frontends/FreeCourse.Web/*.csproj"
#rcd un dotnet publish "Frontends/FreeCourse.Web/*.csproj" -c Release -o out
#FROM mcr.microsoft.com/dotnet/aspnet:5.0-buster-slim as runtime
#WORKDIR /app
#COPY --from=build /app/out 
ENTRYPOINT [ "dotnet","FreeCourse.Web.dll" ]

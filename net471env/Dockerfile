FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY ./sample/*.sln .
COPY ./sample/*.csproj ././sample/
COPY ./sample/*.config ././sample/
RUN nuget restore

# copy everything else and build app
COPY ./sample/. ././sample/
WORKDIR /app/./sample/
RUN msbuild /p:Configuration=Release -r:False


FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8 AS runtime
WORKDIR /inetpub/wwwroot
COPY --from=build /app/./sample/. ./
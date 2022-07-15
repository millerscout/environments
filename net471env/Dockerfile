FROM mcr.microsoft.com/dotnet/framework/sdk:4.7.2 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY ./sample/*.sln .
COPY ./sample/sample ./sample
RUN nuget restore

# copy everything else and build app

# WORKDIR /app/sample
RUN msbuild /p:Configuration=Release -r:False


FROM nanoserver/iis
WORKDIR /inetpub/wwwroot
COPY --from=build /app/sample/. ./


# WORKDIR /app

# # copy csproj and restore as distinct layers
# COPY ./sample/*.sln .
# COPY ./sample/sample/*.csproj ././sample/
# COPY ./sample/sample/*.config ././sample/
# WORKDIR ../
# COPY ./setup.ps1 ./
# COPY ./file.exe ./

# CMD ["powershell"]

# #RUN nuget restore

# # copy everything else and build app
# #COPY ./sample/. ././sample/
# #WORKDIR /app/./sample/
# #RUN msbuild /p:Configuration=Release -r:False


# #FROM nanoserver/iis
# #WORKDIR /inetpub/wwwroot
# #COPY --from=build /app/./sample/. ./
# #ENTRYPOINT ["cmd"]
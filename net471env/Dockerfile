FROM nanoserver/iis
WORKDIR /app

# copy csproj and restore as distinct layers
COPY ./sample/*.sln .
COPY ./sample/sample/*.csproj ././sample/
COPY ./sample/sample/*.config ././sample/

RUN Invoke-WebRequest -Uri "https://go.microsoft.com/fwlink/?linkid=2099382" -OutFile "C:\path\file.exe" \
&& c:\path\file.exe  /q /norestart
RUN nuget restore

# copy everything else and build app
COPY ./sample/. ././sample/
WORKDIR /app/./sample/
RUN msbuild /p:Configuration=Release -r:False


FROM nanoserver/iis
WORKDIR /inetpub/wwwroot
COPY --from=build /app/./sample/. ./
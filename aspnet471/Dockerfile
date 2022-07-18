# FROM mcr.microsoft.com/dotnet/framework/sdk:4.7.2 AS build
# WORKDIR /app
# # ./shared /inetpub/wwwroot

# # copy csproj and restore as distinct layers
# COPY ./sample/*.sln .
# COPY ./sample/sample ./sample
# RUN nuget restore

# # copy everything else and build app

# # WORKDIR /app/sample
# RUN msbuild /p:Configuration=Release -r:False

FROM mcr.microsoft.com/dotnet/framework/aspnet:4.7.1
# RUN ["powershell", "Install-WindowsFeature", "-name Web-Server -IncludeManagementTools"]
# WORKDIR /lib
# COPY ./DotNet472.zip ./
# RUN ["powershell", "Expand-Archive -Path C:\\lib\\DotNet472.zip -DestinationPath C:\\lib"]
# RUN "powershell -noexit goPowerranger.ps1 -DeploymentType ""Install"" -DeployMode ""Silent"""

# RUN ["powershell", "-ExecutionPolicy Bypass .\Deploy-DotNet472.ps1 -DeploymentType ""Install"" -DeployMode ""NonInteractive"""]
# RUN ["powershell", "Set-ItemProperty ""HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\"" -Name ""fDenyTSConnections"" -Value 0"]
# RUN ["powershell", "Enable-NetFirewallRule -DisplayGroup ""Remote Desktop"""]
# RUN ["powershell", "Set-ItemProperty ""HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\"" -Name ""UserAuthentication"" -Value 1"]







# RUN dism /online /Enable-Feature /FeatureName:IIS-ISAPIFilter /all
# RUN dism /online /Enable-Feature /FeatureName:IIS-ISAPIExtensions /all
# RUN dism /online /Enable-Feature /FeatureName:IIS-NetFxExtensibility45 /all
# RUN dism /online /Enable-Feature /FeatureName:IIS-ASPNET45 /all

RUN ["powershell", "Remove-Item", "C:\\inetpub\\wwwroot", "-Recurse"]

# WORKDIR /inetpub/build
# COPY --from=build /app/sample/. ./



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
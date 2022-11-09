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


FROM mcr.microsoft.com/dotnet/framework/sdk:4.7.1
RUN ["powershell", "Install-WindowsFeature", "-name Web-Server -IncludeManagementTools"]
WORKDIR /lib
COPY ./DotNet472.zip ./
RUN ["powershell", "Expand-Archive -Path C:\\lib\\DotNet472.zip -DestinationPath C:\\lib"]
# RUN "powershell -noexit goPowerranger.ps1 -DeploymentType ""Install"" -DeployMode ""Silent"""

# RUN ["powershell", "-ExecutionPolicy Bypass .\Deploy-DotNet472.ps1 -DeploymentType ""Install"" -DeployMode ""NonInteractive"""]
# RUN ["powershell", "Set-ItemProperty ""HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\"" -Name ""fDenyTSConnections"" -Value 0"]
# RUN ["powershell", "Enable-NetFirewallRule -DisplayGroup ""Remote Desktop"""]
# RUN ["powershell", "Set-ItemProperty ""HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\"" -Name ""UserAuthentication"" -Value 1"]







RUN dism /online /Enable-Feature /FeatureName:IIS-ISAPIFilter /all
RUN dism /online /Enable-Feature /FeatureName:IIS-ISAPIExtensions /all
RUN dism /online /Enable-Feature /FeatureName:IIS-NetFxExtensibility45 /all
RUN dism /online /Enable-Feature /FeatureName:IIS-ASPNET45 /all

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

#start
#echo "3 frameworkps1" >> C:\asg\log.txt
#
##Install NetFramework
#Install-WindowsFeature NET-Framework-45-Features
#echo "iniciando runtime"
#Start-Process -FilePath C:\asg\framework\dotnet-hosting-2.2.6-win.exe -ArgumentList "/q /norestart" -Wait -Verb RunAs
#Start-Process -FilePath C:\asg\framework\dotnet-runtime-2.1.13-win-x64.exe -ArgumentList "/q /norestart" -Wait -Verb RunAs
#Start-Process -FilePath C:\asg\framework\dotnet-runtime-2.2.6-win-x64.exe -ArgumentList "/q /norestart" -Wait -Verb RunAs
#Start-Process -FilePath C:\asg\framework\dotnet-runtime-2.2.6-win-x86.exe -ArgumentList "/q /norestart" -Wait -Verb RunAs
#Start-Process -FilePath C:\asg\framework\dotnet-runtime-2.2.7-win-x64.exe -ArgumentList "/q /norestart" -Wait -Verb RunAs
#Start-Process -FilePath C:\asg\framework\dotnet-runtime-2.2.7-win-x86.exe -ArgumentList "/q /norestart" -Wait -Verb RunAs
#Start-Process -FilePath C:\asg\framework\dotnet-sdk-3.0.101-win-x64.exe -ArgumentList "/q /norestart" -Wait -Verb RunAs
#echo "iniciando dotnet" >> C:\asg\log.txt
#Start-Process -FilePath C:\asg\framework\NDP451-KB2858728-x86-x64-AllOS-ENU.exe -ArgumentList "/q /norestart" -Wait -Verb RunAs
#Start-Process -FilePath C:\asg\framework\NDP452-KB2901907-x86-x64-AllOS-ENU.exe -ArgumentList "/q /norestart" -Wait -Verb RunAs
#Start-Process -FilePath C:\asg\framework\NDP46-KB3045557-x86-x64-AllOS-ENU.exe -ArgumentList "/q /norestart" -Wait -Verb RunAs
#Start-Process -FilePath C:\asg\framework\NDP461-KB3102436-x86-x64-AllOS-ENU.exe -ArgumentList "/q /norestart" -Wait -Verb RunAs
#Start-Process -FilePath C:\asg\framework\NDP462-KB3151800-x86-x64-AllOS-ENU.exe -ArgumentList "/q /norestart" -Wait -Verb RunAs
#Start-Process -FilePath C:\asg\framework\NDP47-KB3186497-x86-x64-AllOS-ENU.exe -ArgumentList "/q /norestart" -Wait -Verb RunAs
#Start-Process -FilePath C:\asg\framework\NDP471-KB4033342-x86-x64-AllOS-ENU.exe -ArgumentList "/q /norestart" -Wait -Verb RunAs
#Start-Process -FilePath C:\asg\framework\NDP472-KB4054530-x86-x64-AllOS-ENU.exe -ArgumentList "/q /norestart" -Wait -Verb RunAs
#Start-Process -FilePath C:\asg\framework\Silverlight_x64.exe -ArgumentList "/q /norestart" -Wait -Verb RunAs
#Start-Process -FilePath C:\asg\framework\VC_redist.x64.exe -ArgumentList "/q /norestart" -Wait -Verb RunAs
#
#echo "invoke"  >> C:\asg\log.txt
#Invoke-Command -ScriptBlock { & cmd /c "msiexec /i C:\asg\framework\WebDeploy_amd64_en-US.msi /qn"}
#Invoke-Command -ScriptBlock { & cmd /c "msiexec /i C:\asg\framework\WebDeploy_x86_en-US.msi /quiet /qn"}
#Invoke-Command -ScriptBlock { & cmd /c "msiexec /i C:\asg\framework\WebPlatformInstaller_x64_en-US.msi /quiet /qn"}
#Invoke-Command -ScriptBlock { & cmd /c "msiexec /i C:\asg\framework\rewrite_x86_en-US.exe /quiet /qn"}
#Invoke-Command -ScriptBlock { & cmd /c "msiexec /i C:\asg\framework\rewrite_amd64_en-US.exe /quiet /qn"}
#
#echo "4 frameworkps1" >> C:\asg\log.txt
#
##Install IIS Features
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-WebServerRole
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-WebServer
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-CommonHttpFeatures
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-HttpErrors
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-HttpRedirect
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-ApplicationDevelopment
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName NetFx4Extended-ASPNET45
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-NetFxExtensibility45
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-HealthAndDiagnostics
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-HttpLogging
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-LoggingLibraries
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-RequestMonitor
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-HttpTracing
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-Security
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-RequestFiltering
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-Performance
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-WebServerManagementTools
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-IIS6ManagementCompatibility
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-Metabase
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-ManagementConsole
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-BasicAuthentication
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-WindowsAuthentication
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-StaticContent
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-DefaultDocument
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-WebSockets
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-ApplicationInit
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-ISAPIExtensions
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-ISAPIFilter
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-HttpCompressionStatic
#Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-ASPNET45
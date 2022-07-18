https://github.com/microsoft/dotnet-framework-docker

https://docs.microsoft.com/pt-br/dotnet/framework/deployment/deployment-guide-for-developers?redirectedfrom=MSDN#command_line_options


docker build . -t customimg:latest --force-rm --no-cache & docker rm env471 & docker run --name env471 -d -it -p 80:80 --mount type=bind,source="D:\projects\environments\net471env\shared\\",destination="c:\inetpub\\" customimg:latest

Dism /Online /Enable-Feature /FeatureName:NetFx4Extended-ASPNET45 /all

docker run --name env471 -d -it -p 80:80 --mount type=bind,source="D:\projects\environments\net471env\shared\",destination="c:\inetpub\" customimg:latest
docker run --name env471 -d -it -p 80:80 --mount type=volume,source=C:\\ProgramData\\Docker\\volumes\\shared\\_data,target=c:\inetpub customimg:latest

docker build . -t customimg:latest --force-rm --no-cache & docker rm env471 & docker run --name env471 -d -it -p 80:80 --mount type=bind,source="D:\projects\environments\net471env/shared",destination=c:\inetpub\wwwroot customimg:latest

--mount type=volume,source=C:\\ProgramData\\Docker\\volumes\\shared\\_data,target=c:\inetpub

[Net.ServicePointManager]::SecurityProtocol = Net.SecurityProtocolType]::Tls12
Install-PackageProvider -Name NuGet -Force
Install-Module PSWindowsUpdate -Force
Get-WindowsUpdate -Install -KBArticleID 'kb4054530'


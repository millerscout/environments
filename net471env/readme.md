https://github.com/microsoft/dotnet-framework-docker

https://docs.microsoft.com/pt-br/dotnet/framework/deployment/deployment-guide-for-developers?redirectedfrom=MSDN#command_line_options


docker build . -t customimg:latest --force-rm --no-cache & docker rm env471 & docker run --name env471 -d -it -p 80:80 customimg:latest

Dism /Online /Enable-Feature /FeatureName:NetFx4Extended-ASPNET45 /all

docker build . -t aspnetenv:latest --force-rm --no-cache & docker rm env471 & docker run --name env471 -d -it -p 801:80 --mount type=bind,source="C:\projects\environments\aspnet471\shared",destination=c:\inetpub\wwwroot aspnetenv:latest

$response = Invoke-RestMethod 'http://localhost:80' -Method 'GET' -Headers $headers; $response
docker build . -t aspnetenv:latest --force-rm & docker rm env471 & docker run --name env471 -d -it -p 15672:80 --mount type=bind,source="C:\projects\environments\aspnet471\shared",destination=c:\inetpub\wwwroot aspnetenv:latest
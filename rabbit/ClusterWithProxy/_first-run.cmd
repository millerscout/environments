start /wait cmd /k " docker build ./ -t haproxy:1.6 && exit"

start /wait cmd /k "docker-compose up -d && exit "

start /wait cmd /k "docker exec -ti rabbitmq2 bash -c "rabbitmqctl stop_app; rabbitmqctl join_cluster rabbit@rabbitmq1; rabbitmqctl start_app "&& exit" 
start /wait cmd /k "docker exec -ti rabbitmq3 bash -c "rabbitmqctl stop_app; rabbitmqctl join_cluster rabbit@rabbitmq1; rabbitmqctl start_app "&& exit" 
start /wait cmd /k "docker exec -ti rabbitmq4 bash -c "rabbitmqctl stop_app; rabbitmqctl join_cluster rabbit@rabbitmq1; rabbitmqctl start_app "&& exit" 
start /wait cmd /k "docker exec -ti rabbitmq1 bash -c "rabbitmqctl set_policy ha-all '' '{\"ha-mode\":\"all\", \"ha-sync-mode\":\"automatic\"}'" && exit" 

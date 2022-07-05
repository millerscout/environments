#!/bin/bash

declare -A T
INDEX=0

for item in ./*/readme.md ./*/*/readme.md
do 
	cur=${item///readme.md/}
	cur=${cur/.\//}
	
	T[$INDEX,0]=$cur
	T[$INDEX,1]='0'
	
	let INDEX=${INDEX}+1
	
done


for (( c=0; c<$INDEX; c++ ))
do 
	srch="${T[$c,0]}"
	# echo "./${srch}/docker-compose.yml"
	if [ -f "./${srch}/docker-compose.yml" ]; then
		T[$c,1]='1'
	fi
	
done


docker_content=""
podman_content=""

for (( c=0; c<$INDEX; c++ ))
do 
	# echo "${T[$c,1]}"
	if [ "${T[$c,1]}" == 1 ];then
		echo "${T[$c,0]} || docker"
		docker_content=("$docker_content\r\n[${T[$c,0]}](./${T[$c,0]})")
	elif [ "${T[$c,1]}" == 0 ];then
		echo "${T[$c,0]} || podman"
		podman_content=("$podman_content\r\n[${T[$c,0]}](./${T[$c,0]})")
	fi 
done

echo $docker_content
template=`cat TEMPLATE.md`

echo $template
template=${template/\#Docker_Content\#/$docker_content}
template=${template/\#Podman_Content\#/$podman_content}
echo $template


echo -e "$template" > test

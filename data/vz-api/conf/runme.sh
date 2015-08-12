#!/bin/bash
set -e

if [ "$1" = 'start-api' ]; then

	echo ' --- update the api bins'
	aws s3 sync s3://ricardovz.com/backend/ricardovz-api /ricardovz/api
	
	echo ' --- update permissions'
	chmod -R a+x /ricardovz/api

	echo ' --- stop any process running on its port'
	kill $(cat /ricardovz/api/API_PID) &

	echo ' --- run the latest version of the api'
	bash /ricardovz/api/bin/ricardovz-api &

	echo ' --- export Process id'
	echo $! > /ricardovz/api/API_PID

	sleep infinity

fi


if [ "$1" != 'start-api' ]; then
	
	exec "$@"

fi

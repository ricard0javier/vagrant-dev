#!/bin/bash
set -e

# update the api bins
aws s3 sync s3://ricardovz.com/backend/ricardovz-api /ricardovz/api

# stop any process running on its port
kill $API_PID &

# run the latest version of the api
bash /ricardovz/api/bin/ricardovz-api &
export API_PID=$!

bash

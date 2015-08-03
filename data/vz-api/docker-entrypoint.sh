#!/bin/sh

# as the continuous delivery process is not ready , it is necessary to compile
# the code in production to make it easy to deploy new versions

# ---- START: TO BE REMOVED AFTER CONTINUOS DELIVERY ---
# 
# create directory where code will be downloaded
mkdir -p /ricardovz/api/ricardovz-api
# 
# download the code
git clone https://github.com/ricard0javier/ricardovz /ricardovz/api/ricardovz-api
# 
# create Tar
cd /ricardovz/api/ricardovz-api
./gradlew distTar
# 
# mv tar to a accessible area (in the future it will be S3)
mv build/distributions/ricardovz-api.tar /ricardovz/ricardovz-api.tar
# 
# clean
rm -R /ricardovz/api
# 
#  END: hopefuly it will be removed soon and be performed as a gradle task



# 
# Start the API
# 
cd /ricardovz/api/
# download the file with the version of the api to execute
mv /ricardovz/ricardovz-api.tar /ricardovz/api/ricardovz-api.tar
# extract the files
tar -xvf ricardovz-api.tar
# remove the unnecessary file
rm ricardovz-api.tar
# execute the code
ricardovz-api/bin/ricardovz-api


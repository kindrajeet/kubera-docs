#!/bin/bash

set -eo pipefail
echo "*************************************"
echo "************Push-Images**************"
echo "*************************************"

#Image="docs"

echo "**********Logggin*******************"
docker login -u indraindrajit71 -p $pass
echo "*********taggingImages*************"
docker tag $Image:$Build_tag indraindrajit71/$Image:$Build_tag
echo "**********PushingImages************"
docker push indraindrajit71/$Image:$Build_tag



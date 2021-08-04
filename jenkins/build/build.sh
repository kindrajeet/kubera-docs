#!/bin/bash

echo -e "**********************************************"
echo -e "*****building Docker Images*******************"
echo -e "**********************************************"

#docker build -t docs:0.1 .
docker build -t indraindrajit71/docs .

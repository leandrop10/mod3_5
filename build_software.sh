#!/bin/bash
BUILD_DIRECTORY=/tmp/temporary_directory_to_build
SRC_DIRECTORY=${HOME}/mod3_5
DEPLOY_DIRECTORY=${HOME}/DEPLOY-$(date "+%Y%m%d")

echo “BUILD THE SOFTWARE”

cd ${HOME} # cd ~
rm -rf ${BUILD_DIRECTORY}
rm -rf ${DEPLOY_DIRECTORY}
mkdir ${BUILD_DIRECTORY}
mkdir ${DEPLOY_DIRECTORY}
cd ${BUILD_DIRECTORY}
cp ${SRC_DIRECTORY}/*.c .
cp ${SRC_DIRECTORY}/Makefile .
echo “BUILD SOFTWARE”
make foo.bin

echo “DEPLOY SOFTWARE”

cp *.bin ${DEPLOY_DIRECTORY}/
rm -rf ${BUILD_DIRECTORY}

#echo "DEPLOY SOFTWARE on AWS"
#scp -i ${HOME}/KEY_FOR_AWS/leandro.pem -r ${DEPLOY_DIRECTORY} ubuntu@ec2-3-136-241-142.us-east-2.compute.amazonaws.com:DEPLOY

echo “END OF DEPLOYMENT”

#/bin/bash

scriptPath=`pwd`
dirName=`dirname $0`
echo $dirName

echo "Move to the script directory $scriptPath"
cd $dirName

echo "Create a AWS S3 bucket to store the terraform state"
$scriptPath/Infrastructure/pre/create-aws-bucket.sh

echo "Deploy EKS cluster using terraform"
cd $dirName/Infrastructure/terraform
terraform apply

echo "Update Kubconfig"
$dirName/Infrastructure/post/setContext.sh

echo "Deploy k8s-spot-termination-handler"
$dirName/Apps/k8s-spot-termination-handler/install-k8s-spot-termination-handler.sh

echo "Deploy metric server"
$dirName/Apps/metric-server/install-metric-server.sh

echo "Deploy Kubernetes Dashboard"
$dirName/Apps/dashboard/install-dashboard.sh




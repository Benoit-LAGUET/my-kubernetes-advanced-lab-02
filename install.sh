#/bin/bash

dirName=`dirname $0`
echo $dirName

echo "Move to the script directory $dirName"
cd $dirName

echo "Create a AWS S3 bucket to store the terraform state"
$dirName/Infrastructure/pre/create-aws-bucket.sh

echo "Deploy EKS cluster using terraform"
terraform -chdir=$dirName/Infrastructure/terraform apply

echo "Update Kubconfig"
$dirName/Infrastructure/post/setContext.sh $dirName/Infrastructure/terraform/

echo "Deploy k8s-spot-termination-handler"
$dirName/Apps/k8s-spot-termination-handler/install-k8s-spot-termination-handler.sh

echo "Deploy metric server"
$dirName/Apps/metric-server/install-metric-server.sh

echo "Deploy Kubernetes Dashboard"
$dirName/Apps/dashboard/install-dashboard.sh




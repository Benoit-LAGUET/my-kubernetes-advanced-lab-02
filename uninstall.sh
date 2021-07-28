#/bin/bash

dirName=`dirname $0`
echo $dirName

echo "Destroy EKS cluster using terraform"
terraform -chdir=$dirName/Infrastructure/terraform destroy  



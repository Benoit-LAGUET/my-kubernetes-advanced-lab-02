#/bin/bash

aws eks --region $(terraform -chdir=$1 output -raw region) update-kubeconfig --name $(terraform -chdir=$1 output -raw cluster_name)
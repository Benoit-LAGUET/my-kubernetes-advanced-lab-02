#/bin/bash

dirName=`dirname $0`

# Deploying the Dashboard UI
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml
# Creating sample user
kubectl apply -f $dirName/kubernetes-dashboard-admin.rbac.yaml
# Getting a Bearer Token
BearerToken=`kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"`

cat << EOF
You can access 
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

Using this bearer token :

$BearerToken

EOF

# Start Proxy
kubectl proxy
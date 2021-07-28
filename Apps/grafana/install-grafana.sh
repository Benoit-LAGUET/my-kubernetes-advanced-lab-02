#/bin/bash

dirName=`dirname $0`

kubectl apply -f $dirName/grafana.yaml

kubectl -n default port-forward service/grafana 3000:3000
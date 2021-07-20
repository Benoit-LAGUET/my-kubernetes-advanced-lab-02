#/bin/bash

helm repo add stable https://charts.helm.sh/stable
helm repo update
helm install stable/k8s-spot-termination-handler --namespace kube-system --generate-name

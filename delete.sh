kubectl delete -f ./k8s/service-monitor.yaml
kubectl delete -f ./k8s/ingress.yaml
kubectl delete -f ./k8s/service.yaml
kubectl delete -f ./k8s/deployment.yaml
kubectl delete -f ./k8s/monitoring.yaml
helm delete --namespace otus-ms-hw-mn nginx
helm delete --namespace otus-ms-hw-mn prometheus
kubectl delete -f ./k8s/namespace.yaml
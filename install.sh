kubectl apply -f ./k8s/namespace.yaml
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx/
helm repo update
helm install --namespace otus-ms-hw-mn nginx ingress-nginx/ingress-nginx -f ./k8s/nginx-ingress.yaml
helm install --namespace otus-ms-hw-mn prometheus prometheus-community/kube-prometheus-stack -f ./k8s/prometheus.yaml --atomic
kubectl apply -f ./k8s/deployment.yaml
kubectl apply -f ./k8s/service.yaml
kubectl apply -f ./k8s/ingress.yaml
kubectl apply -f ./k8s/service-monitor.yaml
kubectl apply -f ./k8s/monitoring.yaml
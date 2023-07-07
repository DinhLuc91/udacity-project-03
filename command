kubectl apply -f aws-secret.yaml
kubectl apply -f env-secret.yaml
kubectl apply -f env-configmap.yaml
kubectl apply -f backend-feed-deployment.yaml
kubectl apply -f backend-user-deployment.yaml
kubectl apply -f frontend-deployment.yaml
kubectl apply -f reverseproxy-deployment.yaml
kubectl apply -f backend-feed-service.yaml
kubectl apply -f backend-user-service.yaml
kubectl apply -f frontend-service.yaml
kubectl apply -f reverseproxy-service.yaml

kubectl expose deployment frontend --type=LoadBalancer --name=publicfrontend
kubectl expose deployment reverseproxy --type=LoadBalancer --name=publicreverseproxy
kubectl get services



docker pull dinhluc91/udagram-frontend:v1
kubectl autoscale deployment backend-user --cpu-percent=70 --min=3 --max=5
kubectl autoscale deployment backend-feed --cpu-percent=70 --min=3 --max=5
aws eks update-kubeconfig --region ap-southeast-1 --name Udacity-Cluster-03
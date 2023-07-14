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
aws eks update-kubeconfig --region ap-southeast-1 --name Udacity-Cluster-03

docker push dinhluc91/udagram-frontend:v3
kubectl set image deployment frontend frontend=dinhluc91/udagram-frontend:v2

docker build -t udagram-api-feed ./udagram-api-feed
docker tag udagram-api-feed sudkul/udagram-api-feed:v1
docker push sudkul/udagram-api-feed:v1

docker build -t reverseproxy ./udagram-reverseproxy
docker tag reverseproxy dinhluc91/reverseproxy:v1
docker push dinhluc91/reverseproxy:v1

docker build -t udagram-api-user ./udagram-api-user
docker tag udagram-api-user dinhluc91/udagram-api-user:v1
docker push dinhluc91/udagram-api-user:v1

docker build -t udagram-api-feed ./udagram-api-feed
docker tag udagram-api-feed dinhluc91/udagram-api-feed:v1
docker push dinhluc91/udagram-api-feed:v1

docker build -t udagram-frontend ./udagram-frontend
docker tag udagram-frontend dinhluc91/udagram-frontend:v1
docker push dinhluc91/udagram-frontend:v1

docker build -t udagram-api-user ./udagram-api-user
docker tag udagram-api-user dinhluc91/udagram-api-user:v2
docker push dinhluc91/udagram-api-user:v2

docker build -t udagram-api-feed ./udagram-api-feed
docker tag udagram-api-feed dinhluc91/udagram-api-feed:v2
docker push dinhluc91/udagram-api-feed:v2

kubectl set image deployment backend-feed backend-feed=dinhluc91/udagram-api-feed:v2
kubectl set image deployment backend-user backend-user=dinhluc91/udagram-api-user:v2

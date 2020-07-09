docker build -t enterthematrix/multi-client:latest -t enterthematrix/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t enterthematrix/multi-server:latest -t enterthematrix/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t enterthematrix/multi-worker:latest -t enterthematrix/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push enterthematrix/multi-client:latest
docker push enterthematrix/multi-client:$SHA

docker push enterthematrix/multi-server:latest
docker push enterthematrix/multi-server:$SHA

docker push enterthematrix/multi-worker:latest
docker push enterthematrix/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployment/server-deployment server=enterthematrix/multi-server:$SHA
kubectl set image deployment/client-deployment client=enterthematrix/multi-client:$SHA
kubectl set image deployment/worker-deployment worker=enterthematrix/multi-worker:$SHA

# ElasticSearch ClusterRole 
kubectl apply -f elk-k8s/rbac.yml

# ElasticSearch StateFulSet
kubectl apply -f elk-k8s/elastic-ss.yml

# ElasticSearch Service
kubectl apply -f elk-k8s/elastic-svc.yml

# FileBeat
kubectl apply -f elk-k8s/filebeat-env.yml

# Logstash ConfigMap - Deployment - Service
kubectl apply -f elk-k8s/logstash-cm.yml
kubectl apply -f elk-k8s/logstash-dp.yml
kubectl apply -f elk-k8s/logstash-svc.yml

# Kibana Deployment and Service
kubectl apply -f elk-k8s/kibana-dp-svc.yml

# create 1 dump counter pod and 1 web-server for log
kubectl apply -f elk-k8s/elk-dump-pod.yml

# create tls.key - tls.cert and elk-tls secret for ingress
# 1. way
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.cert -subj "/CN=kibana.local.test/O=kibana.local.test"
kubectl create secret tls elk-tls --key tls.key --cert tls.cert 

# 2. way
# change ingress secret section !!!!
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.2.0/cert-manager.yaml
kubectl apply -f elk-k8s/cert-mi.yml

# apply ingress
kubectl apply -f elk-k8s/ingress.yaml


# ElasticSearch ClusterRole 
kubectl delete -f elk-k8s/rbac.yml

# ElasticSearch StateFulSet
kubectl delete -f elk-k8s/elastic-ss.yml

# ElasticSearch Service
kubectl delete -f elk-k8s/elastic-svc.yml

# FileBeat
kubectl delete -f elk-k8s/filebeat-env.yml

# Logstash ConfigMap - Deployment - Service
kubectl delete -f elk-k8s/logstash-cm.yml
kubectl delete -f elk-k8s/logstash-dp.yml
kubectl delete -f elk-k8s/logstash-svc.yml

# Kibana Deployment and Service
kubectl delete -f elk-k8s/kibana-dp-svc.yml


# create 1 dump counter pod and 1 web-server for log
kubectl delete -f elk-k8s/elk-dump-pod.yml

kubectl delete -f elk-k8s/cert-mi.yml
kubectl delete -f elk-k8s/ingress.yaml

# kubectl -n default port-forward svc/webserver 8080:80


minikube start --driver=virtualbox --cpus 4 --memory 12288
Start-Sleep -Seconds 5
kubectl apply -f .\Helm-RBAC_ServiceAccount.yml
kubectl apply -f .\Counter_Pod.yml
kubectl wait --timeout=600s --for=condition=ready pod -l app=counter
kubectl apply -f .\ElasticSearch_Service.yml
kubectl apply -f .\ElasticSearch_PV.yml
kubectl apply -f .\ElasticSearch_Deploy.yml
kubectl wait --timeout=600s --for=condition=ready pod -l app=elasticsearch
kubectl apply -f .\FileBeat_Service.yml
kubectl apply -f .\FileBeat_ClusterRole.yml
kubectl apply -f .\FileBeat_ClusterRoleBinding.yml
kubectl apply -f .\FileBeat_Config.yml
kubectl apply -f .\FileBeat_Deploy.yml
kubectl wait --timeout=600s --for=condition=ready pod -l app=filebeat
kubectl apply -f .\LogStash_Config.yml
kubectl apply -f .\LogStash_Deploy.yml
kubectl wait --timeout=600s --for=condition=ready pod -l app=logstash
kubectl apply -f .\Kibana_Deploy.yml
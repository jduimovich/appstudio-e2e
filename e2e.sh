
oc apply -f namespace.yaml 
oc project app-e2e
oc apply -f app/application.yaml 
bash install-secret.sh
sleep 10
oc apply -f app 

oc apply -f namespace.yaml 
# Figured out the namespace from the yaml
NS=$(yq e '.metadata.name' namespace.yaml)
oc project $NS
oc apply -f app/application.yaml 
bash install-secret.sh
sleep 10
oc apply -f app 
oc apply -f gitops 
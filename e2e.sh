
# This script will determine the NS and the current repo
# so that this work in forks.

APP=$1
if [ -z $APP ]
then
  APP=app 
exit
echo "running e2e app defined in the $APP directory"

oc apply -f namespace.yaml 
# Figured out the namespace from the yaml
NS=$(yq e '.metadata.name' namespace.yaml)
oc project $NS
oc apply -f app/application.yaml 
bash install-secret.sh
sleep 10
oc apply -f app 

REPO=$(git config --get remote.origin.url)
yq e '.spec.destination.namespace="'$NS'"' gitops/extras.yaml |
    yq e '.spec.source.repoURL="'$REPO'"' - | 
    oc apply -f - 

oc new-project app-e2e

bash install-secret.sh
oc apply -f application.yaml
oc apply -f component.yaml

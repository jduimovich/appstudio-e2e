NS=$(oc project --short)

oc create secret -n $NS  docker-registry redhat-appstudio-registry-pull-secret \
  --docker-server="https://quay.io" \
  --docker-username=$MY_QUAY_USER \
  --docker-password=$MY_QUAY_TOKEN 
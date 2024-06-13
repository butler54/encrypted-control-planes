oc get secrets -n ansible-automation-platform controller-admin-password -o yaml | yq '.data.password' | base64 -d

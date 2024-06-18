oc get secrets -n imperative vaultkeys -o yaml | yq '.data.vault_data_json' | base64 -d | jq '.root_token' -r

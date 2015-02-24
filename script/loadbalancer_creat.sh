#! /bin/bash

token=`curl -s https://identity.api.rackspacecloud.com/v2.0/tokens -X 'POST' -d '{"auth":{"RAX-KSKEY:apiKeyCredentials":{"username":"", "apiKey":""}}}' -H "Content-Type: application/json" |python -m json.tool |  python -c 'import json,sys;obj=json.load(sys.stdin);print obj["access"]["token"]["id"]'`
echo $token

curl -S https://dfw.loadbalancers.api.rackspacecloud.com/v1.0/584353/loadbalancers -X 'POST' -H 'Content-Type: application/json' -H 'Accept: application/json' -HX-Auth-Token:$token --data-binary '{"loadBalancer": {"name": "person-app-dr","port": 80,"protocol": "HTTP","virtualIps": [{"type": "PUBLIC"}],"nodes": [{"address": "10.181.2.48","port": 8080,"condition": "ENABLED"}]}}'

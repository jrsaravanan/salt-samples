#! /bin/bash

token=`curl -s https://identity.api.rackspacecloud.com/v2.0/tokens -X 'POST' -d '{"auth":{"RAX-KSKEY:apiKeyCredentials":{"username":"", "apiKey":""}}}' -H "Content-Type: application/json" |python -m json.tool |  python -c 'import json,sys;obj=json.load(sys.stdin);print obj["access"]["token"]["id"]'`
echo $token

curl -S https://iad.loadbalancers.api.rackspacecloud.com/v1.0/584353/loadbalancers -X 'POST' -H 'Content-Type: application/json' -H 'Accept: application/json' -HX-Auth-Token:$token --data-binary '{"loadBalancer": {"name": "a-new-loadbalancer","port": 80,"protocol": "HTTP","virtualIps": [{"type": "PUBLIC"}],"nodes": [{"address": "10.176.13.168","port": 22,"condition": "ENABLED"}]}}'

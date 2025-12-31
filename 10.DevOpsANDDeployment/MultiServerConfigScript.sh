#!/bin/bash

SERVERS=(
"root@172.18.0.2"
"root@172.18.0.3"
"root@172.18.0.4"
)

for SERVER in "${SERVERS[@]}"; do
    echo "Deploying on $SERVER"
    ssh $SERVER "cd Shell_Mini_Projects/10.DevOpsANDDeployment && bash AutoDeploymentScript.sh"
done

echo "All servers deployed"


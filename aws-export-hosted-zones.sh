#!/bin/bash

zonename=$1
hostedzoneid=$(aws route53 list-hosted-zones --output json | jq -r ".HostedZones[] | select(.Name == \"$zonename.\") | .Id" | cut -d'/' -f3)
aws route53 list-resource-record-sets --hosted-zone-id $hostedzoneid --output json

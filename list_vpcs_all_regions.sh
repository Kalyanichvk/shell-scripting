#!/bin/bash
REGIONS=$@
for REGION in $REGIONS; do
    cowsay "#----------${REGION}--------------#"
    aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId"
done

REGIONS=$*
for REGION in $REGIONS; do
    cowsay "[[----------${REGION}--------------]]"
    aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId"
done

#!/bin/bash
set +x #debugging
if [ $# -gt 0 ]; then
    for REGION in $*; do
        cowsay "[#-------${REGION}-------#]"
        aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId" -r
        echo "you have give $# parameters"
    done
else
    cowsay "You Have Given $# paramters to this script, please provide arg Eg.us-east-1."
fi

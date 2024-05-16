#!/bin/bash
Region=$1
aws ec2 describe-vpcs --region $Region | jq ".Vpcs[].VpcId"

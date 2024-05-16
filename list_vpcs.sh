#!/bin/bash
Region="us-east-1"
aws ec2 describe-vpcs --region $Region | jq ".Vpcs[].VpcId"

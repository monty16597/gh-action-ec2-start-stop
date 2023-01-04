#!/bin/bash

if [[ $AWS_REGION == "" ]]; then
    echo "environment variable AWS_REGION is not defined"
    exit 1
elif [[ $AWS_ACCESS_KEY_ID == "" ]]; then
    echo "environment variable AWS_ACCESS_KEY_ID is not defined"
    exit 1
elif [[ $AWS_SECRET_ACCESS_KEY == "" ]]; then
    echo "environment variable AWS_SECRET_ACCESS_KEY is not defined"
    exit 1
elif [[ $EC2_IDS == "" ]]; then
    echo "environment variable EC2_IDS is not defined"
    exit 1
elif [[ $AWS_EC2_ACTION == "" ]]; then
    echo "environment variable AWS_EC2_ACTION is not defined or invalid value is passed. It should be start || stop."
    exit 1
fi

echo "$EC2_IDS --> $AWS_REGION --> $AWS_EC2_ACTION"
if [[ $AWS_EC2_ACTION == "start" ]]; then
    echo "Starting $EC2_IDS ..."
        echo "start-instances api o/p"
        aws ec2 start-instances --instance-ids $EC2_IDS --profile playground --output json | jq '.'
        echo "instance-running api o/p"
        aws ec2 wait instance-running --instance-ids $EC2_IDS --profile playground --output json | jq '.'
    echo "Started $EC2_IDS"
    exit 0
elif [[ $AWS_EC2_ACTION == "stop" ]]; then
    echo "Stopping $EC2_IDS ..."
        echo "stop-instances api o/p"
        aws ec2 stop-instances --instance-ids $EC2_IDS --profile playground --output json | jq '.'
        echo "instance-stopped api o/p"
        aws ec2 wait instance-stopped --instance-ids $EC2_IDS --profile playground --output json | jq '.'
    echo "Stopped $EC2_IDS"
    exit 0
else
    echo "Unsupported action. Action should be start/stop."
    exit 1
fi

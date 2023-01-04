#!/bin/bash
set -e
echo "$INPUT_REGION"
echo "$INPUT_AWS_ACCESS_KEY"
echo "$INPUT_AWS_SECRET_KEY"
echo "$INPUT_EC2_ID"
echo "$INPUT_ACTION"

# export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY
# export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_KEY
# export AWS_DEFAULT_REGION=$REGION

# echo "$EC2_ID --> $REGION --> $ACTION"
# if [[ $ACTION == "start" ]]; then
#     echo "Starting $EC2_ID ..."
#     aws ec2 start-instances --instance-ids $EC2_ID
#     aws ec2 instance-running --instance-ids $EC2_ID
#     echo "Started $EC2_ID"
#     exit 0
# elif [[ $ACTION == "start" ]]; then
#     echo "Stopping $EC2_ID ..."
#     aws ec2 stop-instances --instance-ids $EC2_ID
#     aws ec2 instance-stopped --instance-ids $EC2_ID
#     echo "Stopped $EC2_ID"
#     exit 0
# else
#     echo "Unsupported action. Action should be start/stop."
#     exit 1
# fi

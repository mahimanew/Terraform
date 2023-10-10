#!/bin/bash
aws ec2 copy-image \
  --source-image-id "ami-01c438c8668b1136b" \
  --source-region "us-east-1" \
  --name "My Copied AMI" \
  --region "us-east-2"
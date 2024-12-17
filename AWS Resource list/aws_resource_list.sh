#!/bin/bash

#############################################################################
# This script will list all the resources in aws
# Author: Viraj Dalave
# Version: 0.0.1

# Following are the supported services
# 1. ec2
# 2. rds
# 3. s3
# 4. cloudfront
# 5. vpc
# 6. ima
# 7. route53
# 8. cloudwatch
# 9. cloudformation
# 10. lambda
# 11. sns
# 12. sqs
# 13. dynamodb
# 14. vpc
# 15. ebs

# Usage: ./aws_resource_list.sh <region> <resource>
# Example: ./aws_resource_list.sh us-east-1 ec2
#############################################################################

# Check if required numbers of arguments are passed
if [ $# -ne 2 ]; then
  echo "Usage: $0 <region> <resource>"
  exit 1
fi

# Check if awscli is installed
if ! command -v aws &> /dev/null; then
  echo "AWS CLI is not installed"
  exit 1
fi 

# Check if awscli is configured
if [ ! -d ~/.aws ]; then
  echo "AWS CLI is not configured"
  exit 1;
fi

# Execute the commands
case $2 in
  ec2)
        echo "Listing EC2 Instances in $1"
        aws ec2 describe-instances --region $1
        ;;
    rds)
        echo "Listing RDS Instances in $1"
        aws rds describe-db-instances --region $1
        ;;
    s3)
        echo "Listing S3 Buckets in $1"
        aws s3api list-buckets --region $1
        ;;
    cloudfront)
        echo "Listing CloudFront Distributions in $1"
        aws cloudfront list-distributions --region $1
        ;;
    vpc)
        echo "Listing VPCs in $1"
        aws ec2 describe-vpcs --region $1
        ;;
    iam)
        echo "Listing IAM Users in $1"
        aws iam list-users --region $1
        ;;
    route5)
        echo "Listing Route53 Hosted Zones in $1"
        aws route53 list-hosted-zones --region $1
        ;;
    cloudwatch)
        echo "Listing CloudWatch Alarms in $1"
        aws cloudwatch describe-alarms --region $1
        ;;
    cloudformation)
        echo "Listing CloudFormation Stacks in $1"
        aws cloudformation describe-stacks --region $1
        ;;
    lambda)
        echo "Listing Lambda Functions in $1"
        aws lambda list-functions --region $1
        ;;
    sns)
        echo "Listing SNS Topics in $1"
        aws sns list-topics --region $1
        ;;
    sqs)
        echo "Listing SQS Queues in $1"
        aws sqs list-queues --region $1
        ;;
    dynamodb)
        echo "Listing DynamoDB Tables in $1"
        aws dynamodb list-tables --region $1
        ;;
    ebs)
        echo "Listing EBS Volumes in $1"
        aws ec2 describe-volumes --region $1
        ;;
    *)
        echo "Invalid service. Please enter a valid service."
        exit 1
        ;;
esac
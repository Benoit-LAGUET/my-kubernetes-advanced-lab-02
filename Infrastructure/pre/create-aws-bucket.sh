#/bin/bash
BucketName=lab-terraformstate-bucket-01
Region=eu-central-1

aws s3 mb s3://$BucketName \
--region $Region

aws s3api put-bucket-versioning \
    --bucket $BucketName \
    --versioning-configuration Status=Enabled 
    --region $Region

aws s3api put-public-access-block \
    --bucket lab-terraformstate-bucket-01 \
    --public-access-block-configuration '{"BlockPublicAcls": true, "IgnorePublicAcls": true, "BlockPublicPolicy": true, "RestrictPublicBuckets": true}'
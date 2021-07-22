#/bin/bash
BucketName=lab-terraformstate-bucket-02
Region=eu-central-1

AwsAccountId=`aws sts get-caller-identity --query 'Account' --output text`
aws s3api head-bucket --bucket $BucketName  --expected-bucket-owner $AwsAccountId >/dev/null
BucketExist=$?

if [ $BucketExist -ne 0 ]
then
    aws s3 mb s3://$BucketName \
    --region $Region

    aws s3api put-bucket-versioning \
    --bucket $BucketName \
    --versioning-configuration Status=Enabled \
    --region $Region

    aws s3api put-public-access-block \
    --bucket $BucketName \
    --public-access-block-configuration '{"BlockPublicAcls": true, "IgnorePublicAcls": true, "BlockPublicPolicy": true, "RestrictPublicBuckets": true}'
else
    echo "Bucket $BucketName already exist"
fi


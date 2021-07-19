#/bin/bah
BucketName=lab-terraformstate-bucket-01
Region=eu-central-1

aws s3 mb s3://$BucketName --region $Region
aws s3api put-bucket-versioning --bucket $BucketName --versioning-configuration Status=Enabled --region $Region
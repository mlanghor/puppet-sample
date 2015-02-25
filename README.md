puppet-sample
=============

This is an example puppet setup following the SmugMug [Scaling Puppet in EC2](http://sorcery.smugmug.com/2013/01/14/scaling-puppet-in-ec2/) blog post.

This setup is designed to sync a puppet tree down from an [Amazon S3](http://aws.amazon.com/s3/) bucket.  Syncing from a repo to the bucket is an exercise left up to the reader.

Ubuntu 14.04 was used to test that everything here works.  Nothing is specific to Ubuntu, but package names, file paths, etc may be different if you are not using Ubuntu or Debian.

# IAM Role Setup
This setup depends on IAM Roles being attached to the running instance.

**Allow Reading of EC2 Tags**

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:DescribeTags"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
```

**Allow reading from Puppet's Bucket**
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::puppet-sample/*",
        "arn:aws:s3:::puppet-sample"
      ]
    }
  ]
}
```

# Launching an Instance
An instance can be launched using something like the following:
```
aws ec2 run-instances \
    --count 1 \
    --image-id ami-04d8916c \
    --instance-type m1.small \
    --key-name foo \
    --user-data file://ec2-boot.sh \
    --iam-instance-profile Name=live
```

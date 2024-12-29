import boto3

s3_target = boto3.resource('s3', 
    # set url http://minio.dataops' for connection from outside of the cluster
    endpoint_url='http://minio-standalone.minio.svc:9000',
    aws_access_key_id='PUT_ACCESS_KEY_HERE',
    aws_secret_access_key='PUT_MINIO_SECRET_HERE',
    config=boto3.session.Config(signature_version='s3v4'),
)

s3_target.Bucket('test').download_file('2024-07-01-prices.csv', '/tmp/tst.csv')

s3_target.Bucket('test').upload_file('/tmp/test1.csv','test1.csv')
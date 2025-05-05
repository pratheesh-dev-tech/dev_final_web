#!/bin/bash

BUCKET_NAME="final-project-1234"

echo "Uploading files to S3..."
aws s3 cp index.html s3://$BUCKET_NAME/ --acl public-read
aws s3 cp style.css s3://$BUCKET_NAME/ --acl public-read
aws s3 cp script.js s3://$BUCKET_NAME/ --acl public-read

echo "Deployment complete."

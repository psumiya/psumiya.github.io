export S3_BUCKET=algoclinic.com

aws s3 sync . s3://$S3_BUCKET --dryrun \
--exclude 'deploy.sh' \
--exclude '.*/*' \
--exclude './*' \
--exclude "*DS_Store" \
--exclude 'drafts/*' \
--exclude '.gitignore'
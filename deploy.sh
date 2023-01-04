export S3_BUCKET=algoclinic.com

aws s3 sync . s3://$S3_BUCKET --dryrun \
--exclude 'deploy.sh' \
--exclude '.*/*' \
--exclude './*' \
--exclude "*DS_Store" \
--exclude 'drafts/*' \
--exclude '.gitignore'

read -p "Continue with deployment? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Uploading files to S3"

  aws s3 sync . s3://$S3_BUCKET \
  --exclude 'deploy.sh' \
  --exclude '.*/*' \
  --exclude './*' \
  --exclude "*DS_Store" \
  --exclude 'drafts/*' \
  --exclude '.gitignore'
fi
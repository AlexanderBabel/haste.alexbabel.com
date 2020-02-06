#haste: data Backup
zip -qq -P $PASSWORD -r "$DATE.zip" data
aws s3 mv "$DATE.zip" "$S3_PATH/haste-data-$DATE.zip" --quiet

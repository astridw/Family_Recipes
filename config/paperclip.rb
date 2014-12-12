config.paperclip_defaults = {
  :storage => :fog,
  :fog_credentials => {
    provider: "AWS",
    aws_access_key_id: "AWS_ACCESS_KEY_ID",
    aws_secret_access_key: "AWS_SECRET_ACCESS_KEY"
  },
  :fog_directory => "BUCKET_NAME"
}

set stack = babashka-lambda-layer
set s3-bucket = my-bucket


aws cloudformation package --template-file template.yaml --s3-bucket $(s3-bucket) --s3-prefix babashka --output-template-file /tmp/template.yaml


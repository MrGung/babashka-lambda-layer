@echo off

set function_name=babashka-lambda-example
set stack=babashka-lambda-layer
set s3_bucket=babashka-lambda-layer
set output_templatefile=temp_template.yaml
set output_publishfile=publish.out
set layer-name=babashka-runtime
@echo off

call 000_env.bat


aws cloudformation package --template-file template.yaml --s3-bucket %s3_bucket% --s3-prefix babashka --output-template-file %output_templatefile%
echo.
echo.


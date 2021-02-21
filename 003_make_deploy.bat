@echo off

call 000_env.bat


aws cloudformation deploy --template-file %output_templatefile% --stack-name %stack% --capabilities CAPABILITY_IAM --no-fail-on-empty-changeset
echo.
echo.


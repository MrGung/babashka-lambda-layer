@echo off

call 000_env.bat


bb_jq < %output_publishfile% | bb -o "(:LayerVersionArn *input*)" > layer_arn.out
set /P layer_arn=<layer_arn.out

echo.
echo.
echo LayerVersionArn: %layer_arn%

echo.
aws lambda update-function-configuration --function-name %function_name% --layers %layer_arn%
echo.
echo.

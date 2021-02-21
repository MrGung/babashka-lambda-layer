@echo off

call 000_env.bat


aws lambda publish-layer-version --layer-name %layer-name% --zip-file fileb://babashka-runtime.zip > %output_publishfile%


echo.

bb_jq < %output_publishfile% | bb -o "(:Version *input*)" > layer_version.out
set /P layer_version=<layer_version.out

aws lambda add-layer-version-permission --layer-name %layer-name% --principal "*" --action lambda:GetLayerVersion --version-number %layer_version% --statement-id public --region %aws_region%
echo.

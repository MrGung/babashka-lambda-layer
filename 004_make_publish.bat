@echo off

call 000_env.bat

aws lambda publish-layer-version --layer-name %layer-name% --zip-file fileb://babashka-runtime.zip
echo.
echo.

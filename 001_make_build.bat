@echo off
set stack = babashka-lambda-layer
set s3-bucket = my-bucket

echo.
echo.
docker build --target BUILDER -t babashka-lambda-archiver .
if errorlevel 1 goto error

echo.
echo.
docker rm build
REM if errorlevel 1 goto error

echo.
echo.
docker create --name build babashka-lambda-archiver
if errorlevel 1 goto error

echo.
echo.
docker cp build:/var/task/babashka-runtime.zip babashka-runtime.zip
if errorlevel 1 goto error

goto eof

:error
echo.
echo.
echo Failure


:eof

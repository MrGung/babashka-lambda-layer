@echo off

call 001_make_build.bat
call 002_make_package.bat
call 003_make_deploy.bat
call 004_make_publish.bat
call 005_update_layer_in_function.bat
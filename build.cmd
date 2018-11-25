@echo off

setlocal enableextensions enabledelayedexpansion
set EnableNuGetPackageRestore=true
set DOTNET_CLI_TELEMETRY_OPTOUT=1
set DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true

pushd %~dp0

dotnet msbuild build.proj /nologo /v:m %*

popd

if errorlevel 1 (
	echo Something went wrong while building. Check the output above. MSBuild exited with code %ERRORLEVEL%.
	exit /b %ERRORLEVEL%
)

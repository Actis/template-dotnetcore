#!/bin/sh

export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true

dotnet msbuild build.proj /nologo /v:m $*

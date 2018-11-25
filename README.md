Build
-----

To build the project simply run [`build.cmd`](build.cmd) or [`build.sh`](build.sh).  
One can also pass additional command-line parameters (following to the MSBuild syntax) to the script.

Alternatively (or for advanced operations) open the command prompt and execute the following commands from the root of the repository:

    $> dotnet build build.proj [options]
    $> dotnet msbuild build.proj [options]

The above two commands are essentially behave the same with one exception: the former command in addition implicitly does NuGet packages restore (through the `Restore` target) first (which can be turned off with the `--no-restore` switch) while the latter is directed to do the same through [`Directory.Build.rsp`](Directory.Build.rsp).

It is also possible to use desktop MSBuild:

    $> msbuild build.proj [options]

By default a publishing (essentially packaging) process will occur while building. To skip it set the value of the `DeployOnBuild` variable to `false`.  
There are two predefined publishing profiles supplied: `FileSystem` and `Package`. The former is the default for .NET Core CLI builds (which lack [MSDeploy][] support) while the latter is the default under Windows operating systems when using desktop MSBuild.
The `Package` profile utilizes the `DesktopBuildPackageLocation` variable to determine where all package's files should be placed (defaults to `artifacts/build` by the [`build.proj`](build.proj) and also by the profile itself). For the `FileSystem` profile the published content location is determined by the `PublishUrl` variable (defaults to `artifacts/build/<ProjectName>` by the profile).  
To explicitly use one of them or any other existing profile (.NET Core SDK also supplies `MSDeploy` and `MSDeployPackage` profiles) specify its name via the `PublishProfile` variable:

    $> build.cmd /p:PublishProfile=FileSystem

Or, when using MSBuild directly:

    $> msbuild build.proj /p:PublishProfile=FileSystem

[MSDeploy]: https://technet.microsoft.com/en-us/library/dd568968(v=ws.10).aspx

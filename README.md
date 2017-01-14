# virtual-dev

Provides MSBuild to OS X through VirtualBox, thus helps make crossplatform development easier by minimizing switching between development environments.



# Usage

```bash
$ # Get it
$ git clone https://github.com/shrpnsld/virtual-dev/
$
$ # Add aliases for commands to "~/.profile".
$ Path/To/virtual-dev/stuff/add-aliases
$ # Otherwise use "Path/To/virtual-dev/<command>" instead of "vdev-<command>"
```
```bash
$ # Use it
$ cd /Project/Root/
$ vdev-init GuestMachineName Username password123 # Initialize workspace
$ vdev-msbuild Path/To/Project.vcxproj /t:Build /p:configuration=Debug # Build
$ vdev-run-vcxproj Path/To/Project.vcxproj /p:configuration=Debug # Run
```

All project-related files should be inside `Project/Root/`, so they can be accessible on guest machine.

virtual-dev workspace files are stored in `/Project/Root/.vdev/` folder.


### Requires

* Host macOS or OS X *(may also work with host Linux)*
* bash 3.2 or later
* VirtualBox 5.x
* Guest Windows 7 or later with guest additions
* Visual Studio 10 or later



# Using with Xcode


### Build

Add **External Build System** target and use following settings for it:

* Build Tool: `/Absolute/Path/To/virtual-dev/msbuild`
* Arguments: `arguments` `to` `vdev-msbuild`
* Directory: `/Absolute/Project/Root/`

![](./doc/ExternalBuildToolConfiguration.png)

### Run

Edit target scheme using following settings:

* Executable: `/Absolute/Path/To/virtual-dev/msbuild`
* **Debug executable** option should be turned off

![](./doc/SchemeRunInfo.png)

* Arguments: `arguments` `to` `vdev-run-vcxproj`

![](./doc/SchemeRunArguments.png)

* Working Directory: `/Absolute/Project/Root/`

![](./doc/SchemeRunOptions.png)

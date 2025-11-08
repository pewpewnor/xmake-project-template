setup project:

Development setup

```bash
# install required packages
xmake require -f
```

Setup your project for your IDE, example:

```bash
# generate compile commands for clangd (optional)
xmake project -k compile_commands
```

Build & run

```bash
# set build mode for debug
xmake f -m debug
# set your toolchain if needed
xmake f --toolchain=clang
# build the project
xmake
# run the project
xmake r
```

Watch for building and running

```bash
xmake watch -c 'xmake f -m debug; xmake; xmake r'
```

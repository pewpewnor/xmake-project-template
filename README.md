# Xmake Project Template

## 1. Development setup

- Install project dependencies

```bash
# install required packages
xmake require -f
```

- Setup your IDE for the project

```bash
# generate compile commands for clangd (optional)
xmake project -k compile_commands
```

## 2. Run the project

- Build and run

```bash
# set build mode for debug
xmake f -m debug
# set your toolchain and runtimes if needed
xmake f --toolchain=clang --runtimes=c++_static
# check the current build configuration
xmake f -v
# build the project
xmake
# run the project
xmake r
```

- Watch for building and running

```bash
xmake watch -c 'xmake f -m debug; xmake; xmake r'
```

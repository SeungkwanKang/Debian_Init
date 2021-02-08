# Debian_Init

## How to use

1. Update the submodule with the following code.

	```shell
	git submodule update --init --recursive
	```

2. Run the appropriate shell script

- main_X11.sh: A full shell that contains:
  - apt update and upgrade
  - dconf configurations
  - bashrc setting
  - personal scripts to `.local/bin`
- main.sh: Normal shell that contains:
  - apt update and upgrade
  - bashrc setting
  - personal scripts to `.local/bin`
- main_simple.sh: Simpler shell that is same with main.sh, but without apt update && upgrade

## `Dockerfiles` directory

The `Dockerfiles` directory contians personal Dockerfile configurations for use.
The actual docker images are not open for privacy reasons, but you may build your own using the Dockerfile settings.

### Build Debian10

```shell
  cd Dockerfiles/debian
  docker build -t kangsk/debian10:1.0 .
```

### Build SimpleSSD
The SimpleSSD docker image depends on SimpleSSD and kangsk/debian10.
Get SimpleSSD from the original repo and place it under `Dockerfiles/SimpleSSD`

```shell
  # After building kangsk/debian10
  cd Dockerfiles/SimpleSSD
  # git clone SimpleSSD
  docker build -t kangsk/simplessd-fs:1.0 .
```

### Build Nvidia

```shell
  # After building kangsk/debian10
  cd Dockerfiles/nvidia
  # git clone SimpleSSD
  docker build -t kangsk/nvidia:1.0 .
```

Warning: This image is very big, as it contains all nvidia drivers.
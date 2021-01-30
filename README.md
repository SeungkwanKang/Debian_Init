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
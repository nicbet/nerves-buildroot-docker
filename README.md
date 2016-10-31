Docker-Based Build Root for Custom Nerves Base Images
===
The following examples are based on a Raspberry Pi 3 system. Adjust accordingly.

## Prep
1. Clone the system repo `git clone https://github.com/nerves-project/nerves_system_rpi3.git`
2. Clone the build root repo `git clone https://github.com/nerves-project/nerves_system_br.git`

## Instructions
1. Build the docker image `docker build -t nerves:rpi3 .`
2. Run the docker image `docker run -it nerves:rpi3 /bin/bash`
3. Switch dirs `cd /opt/`
4. Create a build config `./nerves_buildroot/create-build.sh ./nerves_system/nerves_defconfig rpi3_out`
5. Switch dirs `cd rpi3_out`
6. Build the code `make`
7. ...wait...
8. Build the base image `make system`
9. Copy the base image `cp /opt/rpi3_out/nerves_system_rpi3.tar.gz <dest>`

## Customization
In order to customize the firmware base image, you can do after step (5.)
1. Modify the kernel `make menuconfig`
2. Save (accept suggested `.config` path)
3. Update defconf `make savedefconfig` which will updated the `nerves_defconfig` file in `$NERVES_SYSTEM` directory.

After customizing the system we have to rebuild:
1. `./nerves_buildroot/create-build.sh ./nerves_system/nerves_defconfig rpi3_out`
2. `cd /opt/rpi3_out`
3. `make`
4. `make system`
5. `cp /opt/rpi3_out/nerves_system_rpi3.tar.gz <dest>`

## Credits
Wendy Smoak at http://wsmoak.net/2016/10/17/building-using-custom-nerves-system.html

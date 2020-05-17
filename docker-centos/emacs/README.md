# docker-compass
Docker image with the Dev environment configuration.

## Building

The easiest way to build the image is to run the build.sh script, it will
  1. pull a pristine centos 7 image
  2. install all necessary packages to compile plus a few others like git, sshd, emacs and qt-creator
  3. configure a user named centos with gid and uid **passed as arguments** or **identical** to the user you are building the image with.
  4. copy the scripts/bashrc file into the centos home directory
  5. set the scripts/centos_dev.sh as entry point. It enables the devtoolset appropriatedly 
  6. sets the landing directory as /home/centos/work
  
The script accepts two arguments GID and UID to customize the container user uid and gid and if you do not provide these parameters, it will simply use your current user uid and gid.

It's suggested that you pass GID and UID containing the same values as the owner of your checkout folder so you can share the files between the owner and the container without any permission problems.

In my system, I kept getting an error message regarding the size of BSS being different to something else. The temporary fix was simply
echo 0 > /proc/sys/kernel/randomize_va_spacetex

## Running

As happened with the building process, there is a run script named run_with_x11.sh that starts the container with the following options (passed to docker run):
- Network configure as *host*
- maps $HOME/work into /home/centos/work
- DISPLAY as your currently *$DISPLAY* value
- maps /tmp/.X11-unix into /tmp/.X11-unix within the container

The last two steps represents the most recent attempt to enable graphical applications to be run from within the container.

## TODOs

Nothing at the moment
  

## Observations

[1]The problem with the OpenGL applications is, if the host is using a proprietary driver, you have to install all libs and whatnot (not the GPU drivers themselves) using the same installer. Example:

  * If your are using a nvidia GPU with the NVIDIA drivers, assuming that the your installer file name is NVIDIA_DRIVER.run, you must call (insider your container):
        /tmp/NVIDIA-DRIVER.run -a -N --ui=none --no-kernel-module
  * If a proprietary AMD GPU drivers (catalyst)
        *TBD*
  

  

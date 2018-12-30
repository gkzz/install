# Simple Shell Script to install <package> on ubuntu

## Packages' Lineup
Ansible

(
    In the near future, 
    Dcoker, 
    Python
)

## To Do Before Run This Script
Type commands bellow, and add this frase to the end,
if you have to type pasword as typing "sudo command";

<remote server, general user> $ sudo visudo
# add to the end 
<general user's name> ALL=NOPASSWD: ALL


## How To Run This Scipt
### Case 1 You have to install Ansible ASSP
bash install_<package name>_ubuntu.sh

### Case 2 You want to display logs as running this script
mkdir -p $HOME/install/log
touch $HOME/install/log/stdout.log $HOME/install/log/stderr.log
bash install_<package name>_ubuntu.sh 2>$HOME/install/log/stderr.log


### Case 3 You have to automatically install Ansible
mkdir -p $HOME/install/log
touch $HOME/install/log/stdout.log $HOME/install/log/stderr.log
bash install_<package name>_ubuntu.sh 1>$HOME/install/log/stdout.log 2>$HOME/install/log/stderr.log


## Notes
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=16.04
DISTRIB_CODENAME=xenial
DISTRIB_DESCRIPTION="Ubuntu 16.04.3 LTS" (Sakura VPS)

## If You're Faced with Some Troubles...
plz give me comments!

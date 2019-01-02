#!/bin/bash

########################################################################################
# Sources;
# Get Docker CE for Ubuntu | Docker Documentation
# https://docs.docker.com/install/linux/docker-ce/ubuntu/#upgrade-docker-ce
########################################################################################

startTime=$(date '+%d/%m/%Y %H:%M:%S');
#SECONDS=0


workingDirectory=$HOME'/install'

sudo apt-get update -y

########################################################################################
### 1. Defne Of My functions 
###### 1-1. type_tags_only() 
###### 1-2. touch_logFiles()
###### 1-3. saved_stdout_startTime()
###### 1-4. saved_stdout_endTime()
###### 1-5. main() 
### 2. Execute My functions
########################################################################################


####### 1-1. type_tags_only() 
########## Type "###############################" Only  
type_tags_only(){
    echo "###############################################################################"
}

###### 1-2. touch_logFiles(){
######### filename; 'stdout.log', 'stderr.log'
touch_logFiles(){
    if ! [ls $workingDirectory | find log]; then
        mkdir -p $workingDirectory/log
    fi
    if ! [ls $workingDirectory/log | find 'stdout.log']; then
        touch $workingDirectory/log/stdout.log
    fi
    if ! [ls $workingDirectory/log | find 'stderr.log']; then
        touch $workingDirectory/log/stderr.log
    fi
}

###### 1-3. saved_stdout_startTime()
saved_stdout_startTime(){
    echo -e "$1\n$2" | tee $workingDirectory/log/stdout.log 
}

###### 1-4. saved_stdout_endTime()
saved_stdout_endTime(){
    docker --version
    echo -e "$1\n$2\n$3" | tee $workingDirectory/log/stdout.log 
}

###### 1-5. main()
######### Install Docker
main(){
    sudo apt-get purge docker-ce -y
    sudo chmod 777 /var/lib/docker/overlay2
    sudo rm -rf /var/lib/docker
    sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88 -y
    # pub   4096R/0EBFCD88 2017-02-22
    #       Key fingerprint = 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
    # uid                  Docker Release (CE deb) <docker@docker.com>
    # sub   4096R/F273FCD8 2017-02-22
    sudo add-apt-repository -y \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
    sudo apt-get install docker-ce -y
}


########################################################################################
### 2. Execute My functions 
########################################################################################

if touch_logFiles; then
    type_tags_only
    saved_stdout_startTime "startTime: $startTime" "$workingDirectory/log, and logFiles was generated."
    type_tags_only
else
    type_tags_only
    saved_stdout_startTime "startTime: $startTime" "$workingDirectory/log, and logFiles already exists."
    type_tags_only
fi

if ! docker --version >/dev/null 2>&1; then
    main
    endTime=$(date '+%d/%m/%Y %H:%M:%S'); 
    runTime=$((end_time - start_time));
    type_tags_only 
    saved_stdout_endTime "startTime: $startTime" "endTime: $endTime" "You have finished installing docker in $runTime seconds!"
    type_tags_only
else
    endTime=$(date '+%d/%m/%Y %H:%M:%S');
    type_tags_only 
    saved_stdout_endTime "startTime: $startTime" " endTime: $endTime" "You already have instaled docker."
fi



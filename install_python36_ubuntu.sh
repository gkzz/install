#!/bin/bash

########################################################################################
# Sources;
# WSLの初期化からSSH設定、Gitのインストール、Githubとの連携、ターミナルの色の変更など
# https://note.mu/gkz74/n/n1b716db7c8a9
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
###### 1-6. install_python36_venv()
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
    python3.6 --version
    echo -e "$1\n$2\n$3" | tee $workingDirectory/log/stdout.log 
}

###### 1-5. main()
######### Install python3.6
main(){
    cd ~
    cd /usr/bin
    sudo apt install python3-pip python3-dev -y
    sudo apt install python-pip python-dev -y
    sudo add-apt-repository ppa:jonathonf/python-3.6 -y
    sudo apt update -y
    sudo apt install python3.6 python3.6-dev -y
    sudo wget https://bootstrap.pypa.io/get-pip.py -y
    sudo python3.6 get-pip.py 
}

###### 1-6. install_python36_venv()
######### Install python3.6-venv
install_python36_venv(){
    # Soruces;
    # python - How to use virtualenv with python3.6 on ubuntu 16.04? - Stack Overflow
    # https://stackoverflow.com/questions/47822740/how-to-use-virtualenv-with-python3-6-on-ubuntu-16-04
    sudo apt-get install python3-venv -y
    sudo apt-get install python-virtualenv -y
    virtualenv --python=python3.6 myvenv
    sudo apt install python3.6-venv -y
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

if ! python3.6 --version >/dev/null 2>&1; then
    main
else
    endTime=$(date '+%d/%m/%Y %H:%M:%S');
    type_tags_only 
    saved_stdout_endTime "startTime: $startTime" " endTime: $endTime" "You already have instaled python3.6."
fi

cd ~
mkdir python36-test
cd python36-test

if ! python3.6 -m venv 36 >/dev/null 2>&1; then
    cd ~
    cd ~/usr/bin
    install_python36_venv
    cd ~
    cd python36-test
fi

if    python3.6 -m venv 36 ; then
    source 36/bin/activate
    deactivate
    cd ~
    rm -r python36-test
    endTime=$(date '+%d/%m/%Y %H:%M:%S'); 
    runTime=$((end_time - start_time));
    type_tags_only 
    saved_stdout_endTime "startTime: $startTime" "endTime: $endTime" "You have finished installing python3.6 in $runTime seconds!"
    type_tags_only
else
    cd ~
    rm -r python36-test
    endTime=$(date '+%d/%m/%Y %H:%M:%S'); 
    runTime=$((end_time - start_time));
    type_tags_only 
    saved_stdout_endTime "startTime: $startTime" "endTime: $endTime" "You couldn't install python3.6..."
fi

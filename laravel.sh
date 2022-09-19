#!/bin/bash

# Change this is you stored your Homestead folder somewhere else
HOMESTEAD_PATH="$HOME/vagrant/Homestead";
cd $HOMESTEAD_PATH;

function home {
    clear;
    echo "Select a task:";
    echo "==============";
    echo;
    echo " 1 : vagrant up               (Homestead.yaml hasn't been changed)";
    echo " 2 : vagrant up --provision   (Homestead.yaml has changed)";
    echo " 3 : vagrant halt             (shut down Homestead)";
    echo " 4 : vagrant port             (list of guest ports mapped to the host machine ports)";
    echo " 5 : vagrant destroy          (destroy Homestead and remove it from VirtualBox)";
    echo " 6 : vagrant box update       (Update Homestead to the latest version)";
    echo " 7 : vagrant ssh              (Type 'exit' or Ctrl+d to exit, default password: vagrant)";
    echo;
    echo "-----------------------------------------"
    echo " php   : Show current running PHP version";
    echo " php81 : Switch to PHP 8.1.xx";
    echo " php74 : Switch to PHP 7.4.xx";
    echo "-----------------------------------------"
    echo;
    echo " 0 : Exit";
    echo;
    echo -n "Type option: ";

    # Running a forever loop using while statement
    # This loop will run until select the exit option.  
    # User will be asked to select option again and again
    while : 
    do  

    # reading choice   
    read choice

    # case statement is used to compare one value with the multiple cases.
    case $choice in 
        # List the choises and echo the message
        1)  echo "vagrant up               (Homestead.yaml hasn't been changed)"
            vagrant up;;
        2)  echo "vagrant up --provision   (Homestead.yaml has changed)"
            vagrant reload --provision;;
        3)  echo "vagrant halt             (shut down Homestead)"
            vagrant halt;;
        4)  echo "vagrant port             (list of guest ports mapped to the host machine ports)"
            vagrant port;;
        5)  echo "vagrant destroy          (destroy Homestead and remove it from VirtualBox)"
            confirmDestroy;;
        6)  echo "vagrant box update       (Update Homestead to the latest version)"
             confirmUpdate;;
        7)  echo "vagrant ssh              (Type 'exit' or Ctrl+d to exit, default password: vagrant)"
            vagrant ssh;;
        php)    echo "Show current running PHP version"
                php --version;;
        php81)  echo "Switch to PHP 8.1.xx"
                brew unlink php@7.4
                brew link php --force --overwrite;;
        php74)  echo "Switch to PHP 7.4.xx"
                brew unlink php
                brew link php@7.4 --force --overwrite;;

      0) exit 0;;
    
    esac
      echo -n "Type option: ";
    done
}

function confirmUpdate {
    clear;
    echo;
    echo "This action destroys Homestead and update it to the latest version";
    echo "==================================================================";
    echo;
    echo "Before you execute this command, it is best to make a backup";
    echo "of all your databases with phpMyAdmin.";
    echo "- http://homestead.test/phpMyAdmin";
    echo "- http://phpMyAdmin.test";
    echo;
    read -p "Are you sure you want to destroy and update Homestead [Y/N]?" -n 1 -r
    echo;
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        vagrant box update
        vagrant destroy -f
        vagrant up
    fi
    home
}

function confirmDestroy {
    clear;
    echo;
    echo "This action destroys Homestead and remove it from VirtualBox";
    echo "============================================================";
    echo;
    echo "Before you execute this command, it is best to make a backup";
    echo "of all your databases with phpMyAdmin.";
    echo "- http://homestead.test/phpMyAdmin";
    echo "- http://phpMyAdmin.test";
    echo;
    read -p "Are you sure you want to destroy Homestead [Y/N]?" -n 1 -r
    echo;
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        vagrant up
        vagrant destroy -f
    fi
    home
}

home
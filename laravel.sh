#!/bin/bash

# creating a menu with the following options
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
    1) echo "vagrant up               (Homestead.yaml hasn't been changed)";;
    2) echo "vagrant up --provision   (Homestead.yaml has changed)";;
    3) echo "vagrant halt             (shut down Homestead)";;
    4) echo "vagrant port             (list of guest ports mapped to the host machine ports)";;
    5) echo "vagrant destroy          (destroy Homestead and remove it from VirtualBox)";;
    6) echo "vagrant box update       (Update Homestead to the latest version)";;
    7) echo "vagrant ssh              (Type 'exit' or Ctrl+d to exit, default password: vagrant)";;
    php)    echo "Show current running PHP version"
            php --version;;
    php81)  echo "Switch to PHP 8.1.xx"
            brew unlink php@7.4
            brew link php@8.1 --force;;
    php74)  echo "Switch to PHP 7.4.xx"
            brew unlink php@8.1
            brew link php@7.4;;

    0) exit 0;;
  
esac
  echo -n "Type option: ";
done
#!/bin/bash


echo -e "\e[33mupdating all \e[32mpackages\e[0m"

sudo yum update -y

sudo dnf upgrade -y

echo -e "\e[33mremoving \e[31mNginxpackage\e[0m"

sudo dnf remove nginx
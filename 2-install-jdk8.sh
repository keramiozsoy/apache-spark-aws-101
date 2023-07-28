#!/bin/sh

sudo apt-get update
sudo apt-get install wget
sudo apt-get install openjdk-8-jdk -y

sudo update-alternatives --config java || echo 2 || echo -ne '\n'

java -version

sudo update-alternatives --config javac || echo 2 || echo -ne '\n'

javac -version

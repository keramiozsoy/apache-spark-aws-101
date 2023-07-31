#!/bin/sh

sudo apt-get update

sudo apt-get install wget

sudo apt-get install openjdk-8-jdk -y

sudo update-alternatives --config java

## choose java-8

java -version

sudo update-alternatives --config javac

## choose java-8

javac -version




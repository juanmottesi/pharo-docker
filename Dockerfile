FROM ubuntu:16.04

MAINTAINER juanmottesi

RUN dpkg --add-architecture i386
RUN apt-get -y update
RUN apt-get -y install libx11-6:i386 libgl1-mesa-glx:i386 libfontconfig1:i386 libssl1.0.0:i386 curl wget unzip

#Download Pharo
RUN wget -O- get.pharo.org/64 | bash

#Add st's
ADD ./*.st ./

#Installing st
RUN ./pharo Pharo.image st --save --quit ./startingPharo.st

#End
RUN echo "Installed!!"

FROM ubuntu:bionic

# avoid questions when installing stuff in apt-get
ARG DEBIAN_FRONTEND=noninteractive

#base system stuff
RUN apt-get update && apt-get -y install software-properties-common \ 
	git build-essential cmake nano mousepad 

#python tools
RUN apt-get update && apt-get -y install python3-pip

#set up ssh for easy docker X-forwarding
RUN apt-get -y install openssh-server
RUN sed -i "s/.*PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
RUN sed -i "s/.*PasswordAuthentication.*/PasswordAuthentication yes/g" /etc/ssh/sshd_config
RUN sed -i "s/.*X11UseLocalhost.*/X11UseLocalhost no/" /etc/ssh/sshd_config

#god this is safe... (password = "toor")
RUN sed -i 's/root.*/root:$6$A0Pxx1Fa$EoiiNGgmLePvhc7S7LvpHCAzeMKlWdl2z2pjVBBthNeOmI6yhHF4c\/Wzk6gcY.wi0CNVrd4hHk0BiSi4tVblw0:18682:0:99999:7:::/' /etc/shadow

#gnuradio official dependencies
RUN apt-get -y install cmake git g++ libboost-all-dev python-dev python-mako \
	python-numpy python-wxgtk3.0 python-sphinx python-cheetah swig libzmq3-dev \
	libfftw3-dev libgsl-dev libcppunit-dev doxygen libcomedi-dev libqt4-opengl-dev \
	python-qt4 libqwt-dev libsdl1.2-dev libusb-1.0-0-dev python-gtk2 python-lxml \
	pkg-config python-sip-dev 

#additional dependencies I've found
RUN apt-get install -y liborc-0.4-dev		#copied from 3.8 (maybe different version here?)

#install from the gnuradio ppa + uhd + swig (for OOT modules)
RUN add-apt-repository ppa:gnuradio/gnuradio-releases-3.7 && apt-get update
RUN apt-get -y install gnuradio uhd-host swig
RUN uhd_images_downloader

#directory that we might use of files (or map from outside)
RUN mkdir /radio
WORKDIR /radio

ENTRYPOINT [ "/bin/bash" ]

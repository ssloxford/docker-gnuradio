FROM ubuntu:focal

# avoid questions when installing stuff in apt-get
ARG DEBIAN_FRONTEND=noninteractive

#base system stuff
RUN apt-get update && apt-get -y install software-properties-common \ 
	git build-essential cmake nano mousepad 

#set up ssh for easy docker X-forwarding
RUN apt-get install openssh-server
RUN sed -i "s/.*PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
RUN sed -i "s/.*PasswordAuthentication.*/PasswordAuthentication yes/g" /etc/ssh/sshd_config
RUN sed -i "s/.*X11UseLocalhost.*/X11UseLocalhost no/" /etc/ssh/sshd_config

#god this is safe... (password = "toor")
RUN sed -i 's/root.*/root:$6$A0Pxx1Fa$EoiiNGgmLePvhc7S7LvpHCAzeMKlWdl2z2pjVBBthNeOmI6yhHF4c\/Wzk6gcY.wi0CNVrd4hHk0BiSi4tVblw0:18682:0:99999:7:::/' /etc/shadow

#gnuradio official dependencies
RUN apt-get install -y git cmake g++ libboost-all-dev \
                        libgmp-dev swig python3-numpy python3-mako python3-sphinx \
                        python3-lxml doxygen libfftw3-dev libsdl1.2-dev libgsl-dev \
                        libqwt-qt5-dev libqt5opengl5-dev python3-pyqt5 liblog4cpp5-dev \
                        libzmq3-dev python3-yaml python3-click python3-click-plugins \
                        python3-zmq python3-scipy python3-gi python3-gi-cairo \
                        gobject-introspection gir1.2-gtk-3.0

#install from the gnuradio ppa + uhd + swig (for OOT modules)
RUN add-apt-repository ppa:gnuradio/gnuradio-releases-3.8 && apt-get update
RUN apt-get -y install gnuradio uhd-host swig

#directory that we might use of files (or map from outside)
RUN mkdir /radio
WORKDIR /radio

ENTRYPOINT [ "/bin/bash" ]

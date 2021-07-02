# SSL-Ox GNURadio Docker Builds

This repository contains Docker builds for GNURadio installations. Each is intended to act as a base image with appropriate dependencies to build a container on. 

Each targets a specific GNURadio version and should permit normal use (making and running flowgraphs, gnuradio-companion etc.) as well as developing out-of-tree modules.

**SECURITY WARNING** : The images assume a trusted environment and set default credentials on startup. If you can't trust the deployment environment, change the credentials from the defaults here.


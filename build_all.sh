#!/bin/bash

build_dir () {
	pushd $1
	./build.sh
	popd
}

build_dir "gnuradio3.7"
build_dir "gnuradio3.8"


export NDK_MODULE_PATH=../..

all: config install

config: local.properties build.xml

install:
	ndk-build
	ant install


local.properties build.xml:
	android update project --name java-bitmap --path .

clean:
	ndk-build clean
	ant clean
	rm -Rf obj libs


.PHONY: all config clean

# Makefile for calling CMake with specified toolchain file and install prefix
export LC_ALL=C
SHELL:=/bin/bash

CURRENT_DIR := $(shell pwd)

# Set the path to the CMake toolchain file
TOOLCHAIN_FILE := ../cmake/toolchainfile-rv1106.cmake

# Set the install prefix
INSTALL_PREFIX := ../release

# Set the source directory
SOURCE_DIR := ..

all:
	@echo "Creating output directory..."
	@mkdir -p output
	@cd output && cmake -DCMAKE_TOOLCHAIN_FILE=$(TOOLCHAIN_FILE) -DCMAKE_INSTALL_PREFIX=$(INSTALL_PREFIX) $(SOURCE_DIR)
	@make -C output
	@make -C output install

install:
	@make -C output install

clean:
	@rm -rf output

.PHONY: all install clean


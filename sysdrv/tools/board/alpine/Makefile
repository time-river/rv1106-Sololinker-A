#!/usr/bin/make -f

.DEFAULT_GOAL := alpine

export LC_ALL=C
SHELL:=/bin/bash

CURRENT_DIR := $(shell pwd)

env-check:
	@$(CURRENT_DIR)/env-check.sh

alpine: env-check
	@$(CURRENT_DIR)/mkrootfs.sh

clean:
	@rm -rf alpine-rootfs-*.tar.gz

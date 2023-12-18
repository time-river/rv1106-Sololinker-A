#!/bin/bash

PACKAGES="
	musl-utils gcompat libc-utils
	busybox busybox-binsh busybox-suid busybox-mdev-openrc busybox-openrc openrc kmod
	lsblk su-exec
	alpine-base alpine-release
	openssl ca-certificates ca-certificates-bundle
	htop file vim xxd wget
	i2c-tools v4l-utils
	iproute2 iw
	alpine-keys apk-tools
	strace
"
VERSION="latest-stable"
MIRROR="https://mirrors.tuna.tsinghua.edu.cn/alpine"

if [ -z "${CURRENT_DIR}" ]; then
	CURRENT_DIR="$(pwd)"
fi

if [ -z "${OUT_ROOTFS}" ]; then
	OUT_ROOTFS="${CURRENT_DIR}"
fi

sudo ${CURRENT_DIR}/alpine-make-rootfs \
    --mirror-uri "${MIRROR}"	\
    --branch "${VERSION}" \
    --no-default-pkgs --packages "${PACKAGES}"	\
    --script-chroot \
    ${OUT_ROOTFS}.tar.gz - <<'SHELL'
	# allow root to login without password
        sed -i 's/^root:x:0:0/root::0:0/g' /etc/passwd
SHELL

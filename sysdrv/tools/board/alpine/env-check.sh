#!/bin/bash

if [ ! -e "/proc/sys/fs/binfmt_misc/qemu-arm" ]; then
	echo "Please install qemu-user-static, binfmt-support. "	\
		"Then run command: \`update-binfmts --enable qemu-arm\`"
	exit 1
fi

status=$(cat /proc/sys/fs/binfmt_misc/qemu-arm | head -n 1)
if [ "${status}" != "enabled" ]; then
	echo "Please run command: `update-binfmts --enable qemu-arm`"
	exit 1
fi

exit 0

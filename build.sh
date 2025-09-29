#!/bin/bash
# based on the instructions from edk2-platform
set -e
. build_common.sh
# not actually GCC5; it's GCC7 on Ubuntu 18.04.
./build_bootshim.sh
GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -j$(nproc) -s -n 0 -a AARCH64 -t GCC5 -p EXYNOS2200Pkg/Devices/r0s.dsc||exit 1
cat BootShim/BootShim.bin workspace/Build/EXYNOS2200Pkg/DEBUG_GCC5/FV/EXYNOS2200PKG_UEFI.fd > workspace/payload.bin||exit 1

python3 ./device_specific/mkbootimg.py \
	--kernel ./workspace/payload.bin \
	--ramdisk ./device_specific/dummyramdisk \
    --kernel_offset 0x00008000 \
    --ramdisk_offset 0x00008000 \
    --tags_offset 0x00008000 \
    --os_version 13.0.0 \
    --os_patch_level "$(date '+%Y-%m')" \
    --header_version 4 \
    -o boot.img \

tar -c boot.img -f boot.tar

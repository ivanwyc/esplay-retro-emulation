#!/bin/sh

#edit your ESP-IDF path here, tested with release/v3.3 branch
export IDF_PATH=~/esp/esp-idf

#tune this to match yours
export ESPLAY_SDK=~/esplay-retro-emulation/esplay-sdk

#ffmpeg path
export PATH=~/esp/xtensa-esp32-elf/bin:$PATH

cd esplay-launcher
#make menuconfig
make -j4
cd ../esplay-gnuboy
#make menuconfig
make -j4
cd ../esplay-nofrendo
#make menuconfig
make -j4
cd ../esplay-smsplusgx
#make menuconfig
make -j4
cd ..

#ffmpeg -i assets/Tile.png -f rawvideo -pix_fmt rgb565 assets/tile.raw -y
~/esplay-base-firmware/tools/mkfw/mkfw Retro-Emulation assets/tile.raw 0 16 1310720 launcher esplay-launcher/build/RetroLauncher.bin 0 17 524288 esplay-nofrendo esplay-nofrendo/build/esplay-nofrendo.bin 0 18 458752 esplay-gnuboy esplay-gnuboy/build/esplay-gnuboy.bin 0 19 1179648 esplay-smsplusgx esplay-smsplusgx/build/esplay-smsplusgx.bin
rm esplay-retro-emu.fw
mv firmware.fw esplay-retro-emu.fw

#bin/bash
write=echo

var=userdebug
device=sloane

y=$(date +%Y)
m=$(date +%m)
d=$(date +%d)
fulld=$y$m$d

zip=$(pwd)/out/target/product/$device/lineage-12.1-$fulld-UNOFFICIAL-$device.zip

$write " _ _                                             "
$write "| (_)_ __   ___  __ _  __ _  ___  ___  ___       "
$write "| | | '_ \\ / _ \\/ _\` |/ _\` |/ _ \\/ _ \\/ __|"
$write "| | | | | |  __/ (_| | (_| |  __/ (_) \\__ \\    "
$write "|_|_|_| |_|\\___|\\__,_|\\__, |\\___|\\___/|___/ "
$write "                      |___/                      "

echo ""

echo "Setting a few variables.."
export LANG=C

echo "Preparing environment..."
cd .. && cd .. && cd ..
source ./build/envsetup.sh

echo "Prepare for cook time..."
lunch cm_$device-$var

read -p "Cleanup old files? y/n >> " clean
if [ $clean = "y" ]; then
   echo "Cleaning up..."
   make clobber
   make clean
else
   echo "Not cleaning up..."
fi

echo "Start the build..."
mka bacon -j8 | tee build.log
echo "Done! ROM ZIP FILE: $zip"


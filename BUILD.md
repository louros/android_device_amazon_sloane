# Build manual
* Download the sources
```
$ repo init -u https://github.com/cm12-amami/android.git -b cm-12.1 --groups=all,-notdefault,-darwin,-x86,-mips
$ cd .repo
$ git clone https://github.com/cm12-amami/local_manifests 
$ cd local_manifests 
$ git checkout cm-12.1 
$ cd ../.. 
$ repo sync --no-tags
$ git clone https://github.com/R0rt1z2/android_device_amazon_sloane.git device/amazon/sloane
$ git clone https://github.com/R0rt1z2/android_vendor_amazon_sloane.git vendor/amazon/sloane
```
* Start building
```
$ source ./build/envsetup.sh
$ lunch cm_sloane-userdebug
$ LANG=C mka bacon -j8
```
* Flash the ROM + SuperSU

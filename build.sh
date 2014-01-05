#!/usr/bin/env bash

# Check result function
function check_result {
  if [ "0" -ne "$?" ]
  then
    (repo forall -c "git reset --hard") >/dev/null
    echo $1
    exit 1
  fi
}

# Fix libraries
export LIBRARY_PATH=/usr/lib/x86_64-linux-gnu

# CCache
export USE_CCACHE=1
export CCACHE_NLEVELS=4
export PATH=~/bin:$PATH
export CCACHE_DIR=~/.ccache
export PATH="$PATH:/opt/local/bin/:$WORKSPACE/$ROM_NAME/prebuilts/misc/$(uname|awk '{print tolower($0)}')-x86/ccache"
ccache -M 50G

# Build directory
export JENKINS_BUILD_DIR="$ROM_NAME"
mkdir -p $JENKINS_BUILD_DIR
cd $JENKINS_BUILD_DIR

# Syncing
if [ $SYNC = "true" ]
then
  rm -rf .repo/manifests*
  rm -f .repo/local_manifests/dyn-*.xml
  repo init -u https://github.com/TeamCanjica/android.git -b $REPO_BRANCH
  check_result $CL_RED"Repo init failed!"$CL_RST
  echo -e $CL_BLU"Syncing..."$CL_RST
  repo sync -f -d -c > /dev/null
  check_result $CL_RED"Repo sync failed!"$CL_RST
  echo -e $CL_GRN"Sync complete."$CL_RST
fi

# Cherrypicking
. $WORKSPACE/BuildBot/cherry-pick.sh
check_result $CL_RED"Cherrypicking failed!"$CL_RST
echo -e $CL_GRN"Cherrypicking Complete"$CL_RST

# Get prebuilts
if [ $ROM_NAME = "cm" ]
then
  ./vendor/cm/get-prebuilts
fi

# Set environment and lunch
. build/envsetup.sh
lunch $LUNCH
check_result $CL_RED"Lunch failed!"$CL_RST

# Clean
if [ $CLEAN = "true" ]
then
  echo -e $CL_BLU"Cleaning..."$CL_RST
  make clobber
  echo -e $CL_GRN"Clean complete!"$CL_RST
else
  echo -e $CL_YLW"Cleaning skipped, removing only last built package."$CL_RST
  rm -f out/target/product/$DEVICE/cm-*
fi

# Start Build
if [ $SINGLE_PACKAGE = "true" ]
then
  if [ $PACKAGE_NAME = "" ]
  then
    echo -e $CL_RED"Package name not specified!"$CL_RST
    exit 1
  else
    echo -e $CL_BLU"Building single package only: $PACKAGE_NAME"$CL_RST
    time mka $PACKAGE_NAME
    check_result $CL_RED"Build failed!"$CL_RST
    echo -e $CL_GRN"Package build finished!"$CL_RST
  fi
else
  echo -e $CL_MAG"Building..."$CL_RST
  time make -j8 bacon
  check_result $CL_RED"Build failed!"$CL_RST
  echo -e $CL_GRN"Package build finished!"$CL_RST
fi

#!/usr/bin/env bash

if [ "$REPO_BRANCH" = "cm-10.1" ]
then
  echo -e $CL_BLU"Cherrypicking Oliver patches - android_frameworks_av"$CL_RST
  cd frameworks/av
  git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_av refs/changes/21/46421/3
  git cherry-pick FETCH_HEAD
# Use TeamCanjica frameworks_native until we fix buffers 
#	cd ..
#	echo -e $CL_BLU"Cherrypicking Oliver patches - android_frameworks_native"$CL_RST
#	cd native
#	git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_native refs/changes/20/46420/1
#	git cherry-pick FETCH_HEAD
  cd ../..
  echo -e $CL_BLU"Cherrypicking Oliver patches - android_system_core"$CL_RST
  cd system/core
  git fetch http://review.cyanogenmod.org/CyanogenMod/android_system_core refs/changes/32/45032/3
  git cherry-pick FETCH_HEAD
  cd ../..
fi

if [ "$REPO_BRANCH" = "cm-10.2" ] || [ "$REPO_BRANCH" = "omni-4.3" ]
then
  echo -e $CL_BLU"Cherrypicking Oliver patches - android_system_core"$CL_RST
  cd system/core
  git fetch http://review.cyanogenmod.org/CyanogenMod/android_system_core refs/changes/34/52034/2
  git cherry-pick FETCH_HEAD
  cd ../..

  if [ "$REPO_BRANCH" = "cm-10.2" ]
  then
    echo -e $CL_BLU"Cherrypicking Oliver patches - android_frameworks_av"$CL_RST
    cd frameworks/av
    git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_av refs/changes/32/52032/3
    git cherry-pick FETCH_HEAD
    cd ..
    echo -e $CL_BLU"Cherrypicking Oliver patches - android_frameworks_native"$CL_RST
    cd native
    git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_native refs/changes/33/52033/5
    git cherry-pick FETCH_HEAD
    cd ../..
    echo -e $CL_BLU"Cherrypicking vibrator fix"$CL_RST
    cd hardware/libhardware_legacy
    git fetch https://github.com/TeamCanjica/android_hardware_libhardware_legacy cm-10.2
    git cherry-pick 60207c7e08182e122030547cc3e22d8b27ec623b
    cd ../..
    echo -e $CL_BLU"Cherrypicking custom toolchain fix"$CL_RST
    cd build
    git fetch https://github.com/TeamCanjica/android_build cm-10.2
    git cherry-pick 8f031162d08dadd1595d8c1e42d23134bbdb93d3
    cd ..
    echo -e $CL_BLU"Cherrypicking low in-call volume fix"$CL_RST
    cd packages/apps/Phone
    git fetch https://github.com/TeamCanjica/android_packages_apps_Phone cm-10.2
    git cherry-pick 28f255779152310dfcf4bb232112017ea631e668
    cd ../../..
  else
    echo -e $CL_BLU"Cherrypicking multiwindow - android_frameworks_base"$CL_RST
    cd frameworks/base
    git fetch https://gerrit.omnirom.org/android_frameworks_base refs/changes/53/53/19
    git cherry-pick FETCH_HEAD
    cd ../..
  fi

fi
 
if [ "$REPO_BRANCH" = "cm-11.0" ] || [ "$REPO_BRANCH" = "cm-11.0-test" ] || [ "$REPO_BRANCH" = "omni-4.4" ]
then
  echo -e $CL_BLU"Cherrypicking ART fix"$CL_RST
  cd art
  git fetch https://github.com/cernekee/android_art monitor-stack-v1
  git cherry-pick fc2ac71d0d9e147c607bff9371fe2ef25d8470af
  cd ..

  if [ "$REPO_BRANCH" = "cm-11.0" ] || [ "$REPO_BRANCH" = "cm-11.0-test" ]
  then
    echo -e $CL_BLU"Cherrypicking vold patch to allow switching storages"$CL_RST
    cd system/vold
    git fetch http://review.cyanogenmod.org/CyanogenMod/android_system_vold refs/changes/15/56515/2
    git cherry-pick FETCH_HEAD
    cd ../..
  fi

fi

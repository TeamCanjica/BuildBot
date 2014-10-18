#!/usr/bin/env bash

if [ "$REPO_BRANCH" = "cm-10.1" ]
then
  echo -e $CL_BLU"Cherrypicking Oliver patches - android_frameworks_av"$CL_RST
  cd frameworks/av
  git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_av refs/changes/21/46421/3
  git cherry-pick FETCH_HEAD
  cd ../..
  echo -e $CL_BLU"Cherrypicking Oliver patches - android_system_core"$CL_RST
  cd system/core
  git fetch http://review.cyanogenmod.org/CyanogenMod/android_system_core refs/changes/32/45032/3
  git cherry-pick FETCH_HEAD
  cd ../..
fi

if [ "$REPO_BRANCH" = "cm-10.2" ] || [ "$REPO_BRANCH" = "omni-4.3" ]
then

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
 
if [ "$REPO_BRANCH" = "cm-11.0" ] || [ "$REPO_BRANCH" = "omni-4.4" ]
then
  echo -e $CL_BLU"Cherrypicking for android_system_core - Reboot/shutdown fix"$CL_RST
  cd system/core
  git fetch https://github.com/TeamCanjica/android_system_core cm-11.0
  git cherry-pick 347658ad1b53234b52d32d42fba2a72878b883c5
  cd ../..
  echo -e $CL_BLU"Cherrypicking for android_frameworks_base - OK Google patch"$CL_RST
  cd frameworks/base
  git fetch https://github.com/TeamCanjica/android_frameworks_base cm-11.0
  git cherry-pick de30387b3c32c2a9cf653590c8454bd002bf0dd1
  cd ..
  echo -e $CL_BLU"Cherrypicking for android_frameworks_native - Legacy sensors"$CL_RST
  cd native
  git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_native refs/changes/11/59311/1
  git cherry-pick FETCH_HEAD
  cd ../..
    
  if [ "$REPO_BRANCH" = "cm-11.0" ]
  then
    echo -e $CL_BLU"Cherrypicking for android_art - ART fix"$CL_RST
    cd art
    git fetch https://github.com/cernekee/android_art monitor-stack-v1
    git cherry-pick fc2ac71d0d9e147c607bff9371fe2ef25d8470af
    cd ..
    echo -e $CL_BLU"Cherrypicking for android_frameworks_av - STE Multimedia Fix [1/4]"$CL_RST
    cd frameworks/av
    git fetch https://github.com/TeamCanjica/android_frameworks_av cm-11.0
    git cherry-pick 87618c1ea54009c2e5e5dfb60060f9cc2e9bcc52
    echo -e $CL_BLU"Cherrypicking for android_frameworks_av - STE-OMX: fix getSupportedProfileLevel"$CL_RST
    git cherry-pick cfcb60d66b01783c274dc625bf32a44899d1e603
    echo -e $CL_BLU"Cherrypicking for android_frameworks_av - STE-OMX: video streaming fix"$CL_RST
    git cherry-pick 3dba426da410fadcd757eaa131166e534afbd1a9
    cd ..
    echo -e $CL_BLU"Cherrypicking for android_frameworks_native - STE Multimedia Fix [2/4]"$CL_RST
    cd native
    git fetch https://github.com/TeamCanjica/android_frameworks_native cm-11.0-te
    git cherry-pick 6e61e3f8f206ce9f09f1da6da14432bb417ce8e1
     git cherry-pick 47dcae2609ca4ce1a25e0e9c154bc9c42e4b6774
    cd ../..
    echo -e $CL_BLU"Cherrypicking for android_system_vold - patch to allow switching storages"$CL_RST
    cd system/vold
    git fetch http://review.cyanogenmod.org/CyanogenMod/android_system_vold refs/changes/15/56515/2
    git cherry-pick FETCH_HEAD
    cd ../..
    echo -e $CL_BLU"Cherrypicking for android_packages_services_Telephony - Low-InCall fix"$CL_RST
    cd packages/services/Telephony
    git fetch https://github.com/TeamCanjica/android_packages_services_Telephony cm-11.0
    git cherry-pick fdf281fdabe5e7517eb96f2faf159bbcc74ae4a6
    cd ../../..
      if [ "$DEVICE" = "janice" ] || [ "$DEVICE" = "janicep" ]
      then
        echo -e $CL_BLU"Cherrypicking default RGB Colors fix"$CL_RST
        cd packages/apps/Settings
        git fetch https://github.com/TeamCanjica/android_packages_apps_Settings cm-11.0
        git cherry-pick 76ce30bca51cb4392d7fb4df97ea8eed27f03c2d
        cd ../../..
      fi
  elif [ "$REPO_BRANCH" = "omni-4.4" ]
  then
    echo -e $CL_BLU"Cherrypicking ART fix"$CL_RST
    cd art
    git fetch https://github.com/TeamCanjica/omni_art android-4.4
    git cherry-pick cd5ff6efb38f85d0adb0706073a80e52e0c34311
    cd ..
    echo -e $CL_BLU"Cherrypicking OMX Patch - android_frameworks_av"$CL_RST
    cd frameworks/av
    git fetch https://github.com/TeamCanjica/omni_frameworks_av android-4.4
    git cherry-pick 0faae0d8184dfe241bea9511a934b63a754a1aed
    cd ..
    echo -e $CL_BLU"Cherrypicking OMX Patch - android_frameworks_native"$CL_RST
    cd native
    git fetch https://github.com/TeamCanjica/omni_frameworks_native android-4.4
    git cherry-pick 06c07d23cb515a2709464541899c36bee8cb033a
    cd ..
    echo -e $CL_BLU"Cherrypicking RIL build error fix"$CL_RST
    cd opt/telephony
    git fetch https://github.com/TeamCanjica/omni_frameworks_opt_telephony android-4.4
    git cherry-pick 776a1fab6285d2a4b09bd110f29853eb1b6b286e
    cd ../../..
    echo -e $CL_BLU"Cherrypicking vold patch to allow switching storages"$CL_RST
    cd system/vold
    git fetch http://github.com/TeamCanjica/omni_system_vold android-4.4
    git cherry-pick 602501d7f73e26e2ae8d6712ca293a133ae9cd62
    cd ../..
    echo -e $CL_BLU"Cherrypicking vibrator fix"$CL_RST
    cd hardware/libhardware_legacy
    git fetch https://github.com/TeamCanjica/omni_hardware_libhardware_legacy android-4.4
    git cherry-pick 2e71ea08a201040727f1e82768e9e50e1cf44fe9
    cd ../..
  fi

fi

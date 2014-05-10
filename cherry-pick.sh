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
 
if [ "$REPO_BRANCH" = "cm-11.0" ] || [ "$REPO_BRANCH" = "omni-4.4" ]
then
  echo -e $CL_BLU"Cherrypicking Core Patch - OMX and reboot/shutdown fix"$CL_RST
  cd system/core
  git fetch https://github.com/TeamCanjica/android_system_core cm-11.0
  git cherry-pick 02f79390ff2d6a0e173d1dd8bfae02844d4c33a6
  git cherry-pick 910ccc43a23b042df3df12ed1bbbe32954749e59
  cd ../..
  echo -e $CL_BLU"Cherrypicking OK Google patch"$CL_RST
  cd frameworks/base
  git fetch https://github.com/TeamCanjica/android_frameworks_base cm-11.0
  git cherry-pick de30387b3c32c2a9cf653590c8454bd002bf0dd1
  cd ..
  echo -e $CL_BLU"Cherrypicking Legacy sensors"$CL_RST
  cd native
  git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_native refs/changes/11/59311/1
  git cherry-pick FETCH_HEAD
  cd ../..
    
  if [ "$REPO_BRANCH" = "cm-11.0" ]
  then
    echo -e $CL_BLU"Cherrypicking ART fix"$CL_RST
    cd art
    git fetch https://github.com/cernekee/android_art monitor-stack-v1
    git cherry-pick fc2ac71d0d9e147c607bff9371fe2ef25d8470af
    cd ..
    echo -e $CL_BLU"Cherrypicking OMX Patch - android_frameworks_av"$CL_RST
    cd frameworks/av
    git fetch https://github.com/TeamCanjica/android_frameworks_av cm-11.0
    git cherry-pick 5c4dd9cc832f47017df8930d77e2d175744af3eb
    cd ..
    echo -e $CL_BLU"Cherrypicking OMX Patch - android_frameworks_native"$CL_RST
    cd native
    git fetch https://github.com/TeamCanjica/android_frameworks_native cm-11.0
    git cherry-pick 213b1afc3177f483598e23b9d09738d29c8129cb
    cd ../..
    echo -e $CL_BLU"Cherrypicking vold patch to allow switching storages"$CL_RST
    cd system/vold
    git fetch http://review.cyanogenmod.org/CyanogenMod/android_system_vold refs/changes/15/56515/2
    git cherry-pick FETCH_HEAD
    cd ../..
    echo -e $CL_BLU"Cherrypicking patch to reduce SystemUI crashes and freezes"$CL_RST
    cd frameworks/base
    git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_base refs/changes/34/63034/2
    git cherry-pick FETCH_HEAD
    cd ../..
    echo -e $CL_BLU"Cherrypicking Low-InCall fix"$CL_RST
    cd packages/services/Telephony
    git fetch https://github.com/TeamCanjica/android_packages_services_Telephony cm-11.0
    git cherry-pick fdf281fdabe5e7517eb96f2faf159bbcc74ae4a6
    cd ../../..
    echo -e $CL_BLU"Cherrypicking vibrator fix"$CL_RST
    cd hardware/libhardware_legacy
    git fetch https://github.com/TeamCanjica/android_hardware_libhardware_legacy cm-11.0
    git cherry-pick 9c2250d32a1eda9afe3b5cefe3306104148aa532
    cd ../..
    echo -e $CL_BLU"Cherrypicking recovery fix"$CL_RST
    cd bootable/recovery-cm
    git fetch https://github.com/Rox-/android_bootable_recovery-cm cm-11.0
    git cherry-pick 19759d61c5123d828bbc0cc9ef16988b0382978e
    cd ../..
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
    git cherry-pick e5d00edb9d6cff7845b72e32ed8e048e7234c688
    cd ..
    echo -e $CL_BLU"Cherrypicking OMX Patch - android_frameworks_av"$CL_RST
    cd frameworks/av
    git fetch https://github.com/TeamCanjica/omni_frameworks_av android-4.4
    git cherry-pick 3e8e2b16811e8c060d3339869b4f85b4842c26a7
    cd ..
    echo -e $CL_BLU"Cherrypicking OMX Patch - android_frameworks_native"$CL_RST
    cd native
    git fetch https://github.com/TeamCanjica/omni_frameworks_native android-4.4
    git cherry-pick 90db937c9b944c87a386c2b5b713dae811cf69cc
    cd ..
    echo -e $CL_BLU"Cherrypicking RIL build error fix"$CL_RST
    cd opt/telephony
    git fetch https://github.com/TeamCanjica/omni_frameworks_opt_telephony android-4.4
    git cherry-pick 5e09e67658d95db425d3684e65fbcf73a3705a5b
    cd ../../..
    echo -e $CL_BLU"Cherrypicking vold patch to allow switching storages"$CL_RST
    cd system/vold
    git fetch http://github.com/TeamCanjica/omni_system_vold android-4.4
    git cherry-pick e241d065c40385713c0628601a62f0d01fd20100
    cd ../..
    echo -e $CL_BLU"Cherrypicking Low-InCall fix"$CL_RST
    cd packages/services/Telephony
    git fetch https://github.com/TeamCanjica/omni_packages_services_Telephony android-4.4
    git cherry-pick 167b42ab759bf5c9612cf81d8e2a9315534dd3c8
    cd ../../..
    echo -e $CL_BLU"Cherrypicking vibrator fix"$CL_RST
    cd hardware/libhardware_legacy
    git fetch https://github.com/TeamCanjica/omni_hardware_libhardware_legacy android-4.4
    git cherry-pick 2e71ea08a201040727f1e82768e9e50e1cf44fe9
    cd ../..
  fi

fi

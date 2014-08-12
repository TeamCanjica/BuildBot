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
  echo -e $CL_BLU"Cherrypicking JustArchi's ArchiDroid Optimizations V3"$CL_RST
  cd build
  git fetch https://github.com/TeamCanjica/android_build cm-11.0
  git cherry-pick dbe7e5b4fff354cd9a9ef2e6605fa7db7eef9727
  cd ..
  echo -e $CL_BLU"Cherrypicking ART compatibility fix with GCC 4.8"$CL_RST
  cd art
  git fetch https://github.com/JustArchi/android_art cm-11.0
  git cherry-pick 71a0ca3057cc3865bd8e41dcb94443998d028407
  cd ..
  echo -e $CL_BLU"Cherrypicking clang optimisation suppression patches"$CL_RST
  cd external/clang
  git fetch https://github.com/zwliew/android_external_clang cm-11.0
  git cherry-pick bb0a1a5f007dc6e6f111c3a726977c4cce256bc5
  git cherry-pick 085466671e3c0483466de009bbc81fd31505f6e6
  cd ..
  echo -e $CL_BLU"Cherrypicking exfat compilation fix"$CL_RST
  cd fuse
  git fetch https://github.com/SlimSaber/android_external_fuse kk4.4
  git cherry-pick f3736cb1104f72ee1f1322a4eea79e960bee0cd6
  cd ..
  cd exfat
  git fetch https://github.com/SlimSaber/android_external_exfat kk4.4
  git cherry-pick 0cbb04e3fd9a254dbddf440355949383a9a00976
  cd ../..
  echo -e $CL_BLU"Cherrypicking Core Patch - Reboot/shutdown fix"$CL_RST
  cd system/core
  git fetch https://github.com/TeamCanjica/android_system_core cm-11.0
  git cherry-pick 347658ad1b53234b52d32d42fba2a72878b883c5
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
    git cherry-pick 87618c1ea54009c2e5e5dfb60060f9cc2e9bcc52
    cd ..
    echo -e $CL_BLU"Cherrypicking OMX Patch - android_frameworks_native"$CL_RST
    cd native
    git fetch https://github.com/TeamCanjica/android_frameworks_native cm-11.0-te
    git cherry-pick 0c5f79104778f6adc48493a0537cee8d091634aa
    git cherry-pick c75cc5314fd96a5325aaa6dcbbf0b2a8ec6b4458
    cd ../..
    echo -e $CL_BLU"Cherrypicking vold patch to allow switching storages"$CL_RST
    cd system/vold
    git fetch http://review.cyanogenmod.org/CyanogenMod/android_system_vold refs/changes/15/56515/2
    git cherry-pick FETCH_HEAD
    cd ../..
    echo -e $CL_BLU"Cherrypicking Low-InCall fix"$CL_RST
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
    echo -e $CL_BLU"Cherrypicking Low-InCall fix"$CL_RST
    cd packages/services/Telephony
    git fetch https://github.com/TeamCanjica/omni_packages_services_Telephony android-4.4
    git cherry-pick f65f8b9371add936e89a67319c8684b456cc467f
    cd ../../..
    echo -e $CL_BLU"Cherrypicking vibrator fix"$CL_RST
    cd hardware/libhardware_legacy
    git fetch https://github.com/TeamCanjica/omni_hardware_libhardware_legacy android-4.4
    git cherry-pick 2e71ea08a201040727f1e82768e9e50e1cf44fe9
    cd ../..
  fi

fi

#!/usr/bin/env bash

# Get rid of possible local changes
cd BuildBot
git reset --hard
git pull -s resolve

# Setting variables
cd $WORKSPACE
. BuildBot/variables.sh

# Start build script
case $UL_ONLY in 
"true")
  echo -e $CL_YLW"Skipping build and starting upload..."$CL_RST
  ;;
*)
  . BuildBot/build.sh
  ;;
esac

# Upload
if [ $UPLOAD = "true" ]
then
  echo -e $CL_BLU"Uploading..."$CL_RST
  . $WORKSPACE/BuildBot/upload.sh
  echo -e $CL_GRN"Upload finished!"$CL_RST
fi

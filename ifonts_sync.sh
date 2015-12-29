#!/bin/bash

# This script will backup all iFonts to a target location.

# Always provide trailing slashes to the directories provided for both source and target
SOURCE_IFONTS_LOCATION="/Library/Fonts/"
TARGET_IFONTS_LOCATION="andy@alice-imac.home:/Volumes/Media/iFonts/"

echo "Copying any fonts from user directory into system folder"
mv ~/Library/Fonts/* /Library/Fonts/

echo "Syncing iFonts files from source: $SOURCE_IFONTS_LOCATION to target: $TARGET_IFONTS_LOCATION"
rsync --archive --recursive --progress --times --update $SOURCE_IFONTS_LOCATION $TARGET_IFONTS_LOCATION

#!/bin/bash

# This script will backup all Ableton Live .asd files from one iTunes folder to another.
# It is particularly useful when using iTunes Match in order to manage music on multiple machines
# and allows consistent .asd files on all devices.

# Always provide trailing slashes to the directories provided for both source and target
SOURCE_ITUNES_LOCATION='/Users/andy/Music/iTunes/'
TARGET_ITUNES_LOCATION='andy@alice-imac.local:/Volumes/Media/iTunes/'

# First sync all .asd files from from the source into the target
echo "Syncing .als files from source: $SOURCE_ITUNES_LOCATION to target: $TARGET_ITUNES_LOCATION"
rsync --archive --recursive --progress --times --include '*/' --include '*.asd' --exclude '*' --update $SOURCE_ITUNES_LOCATION $TARGET_ITUNES_LOCATION

# Next sync all newly created .asd files back to the master
echo "Syncing .als files from source: $TARGET_ITUNES_LOCATION to target: $SOURCE_ITUNES_LOCATION"
rsync --archive --recursive --progress --times --include '*/' --include '*.asd' --exclude '*' --update $TARGET_ITUNES_LOCATION $SOURCE_ITUNES_LOCATION

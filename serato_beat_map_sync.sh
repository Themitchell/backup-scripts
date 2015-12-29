#!/bin/bash

# This script will backup all Serato beat mapping files from an external iTunes drive to a
# local iTunes drive and vice versa.
# It is particularly useful when using iTunes Match in order to manage music on multiple machines
# and allows consistent beat mapping files for Serato DJ on all devices.

# Always provide trailing slashes to the directories provided for both source and target
SOURCE_SERATO_FILES_LOCATION='/Users/andy/Music/_Serato_/metadata/'
TARGET_SERATO_FILES_LOCATION='andy@alice-imac.local:/Volumes/Media/_Serato_/metadata/'

# First sync all beat mapping files from from the source into the target
echo "Syncing beat mapping files from source: $SOURCE_SERATO_FILES_LOCATION to target: $TARGET_SERATO_FILES_LOCATION"
rsync -v --archive --recursive --progress --times --update $SOURCE_SERATO_FILES_LOCATION $TARGET_SERATO_FILES_LOCATION

# Next sync all beat mapping files back to the master
echo "Syncing beat mapping files from source: $TARGET_SERATO_FILES_LOCATION to target: $TARGET_SERATO_FILES_LOCATION"
rsync -v --archive --recursive --progress --times --include --update $TARGET_SERATO_FILES_LOCATION $SOURCE_SERATO_FILES_LOCATION

# Temporary measures until i can work out a better file sync
read -r -p "THIS WILL COPY ACCROSS ALL FILES FROM YOU CURRENT ITUNES FOLDER.
It is a limitation of current beat grids. This is only meant to be used when there are
only beat gridded tracks in your local library
Are you sure that is what you want? " response
response=${response,,} # tolower
if [[ $response =~ ^(yes|y| ) ]]; then
  SOURCE_ITUNES_LOCATION='/Users/andy/Music/iTunes/'
  TARGET_ITUNES_LOCATION='andy@alice-imac.local:/Volumes/Media/iTunes/'
  echo "Syncing .als files from source: $SOURCE_ITUNES_LOCATION to target: $TARGET_ITUNES_LOCATION"
  rsync --archive --recursive --progress --times --include '*/' --include '*.mp3' --include '.m4a' --exclude '*' --update $SOURCE_ITUNES_LOCATION $TARGET_ITUNES_LOCATION
fi

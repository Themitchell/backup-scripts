#!/bin/bash

# This script will backup all Samples to a new location for backup.

# Always provide trailing slashes to the directories provided for both source and target
SOURCE_SAMPLES_LOCATION="Users/andy/Samples"
TARGET_SAMPLES_LOCATION="andy@alice-imac.home:/Volumes/Media/Samples/"

# Sync from local source to target
echo "Syncing Samples files from source: $SOURCE_SAMPLES_LOCATION to target: $TARGET_SAMPLES_LOCATION"
rsync --archive --recursive --progress --times --update $SOURCE_SAMPLES_LOCATION $TARGET_SAMPLES_LOCATION

# Sync back to source to make sure both are in sync
echo "Syncing Samples files from source: $TARGET_SAMPLES_LOCATION to target: $SOURCE_SAMPLES_LOCATION"
rsync --archive --recursive --progress --times --update $TARGET_SAMPLES_LOCATION $SOURCE_SAMPLES_LOCATION

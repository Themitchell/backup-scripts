#!/bin/bash

# This script will backup all iBooks to a new location for backup of non Apple iBooks.

# Always provide trailing slashes to the directories provided for both source and target
SOURCE_IBOOKS_LOCATION="/Users/andy/Library/Containers/com.apple.BKAgentService/Data/Documents/iBooks/Books/"
TARGET_IBOOKS_LOCATION="andy@alice-imac.local:/Volumes/Media/iBooks/"

echo "Syncing iBooks files from source: $SOURCE_IBOOKS_LOCATION to target: $TARGET_IBOOKS_LOCATION"
rsync --archive --recursive --progress --times --update $SOURCE_IBOOKS_LOCATION $TARGET_IBOOKS_LOCATION

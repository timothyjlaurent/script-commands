#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Save URL to Wayback Machine from clipboard
# @raycast.mode compact
# @raycast.packageName Wayback Machine

# Optional parameters:
url=$(pbpaste)

regex='(https?)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'

if [[ $url =~ $regex ]]

then
	curl -s "http://web.archive.org/save/$url" > /dev/null
	echo "Submitted $url to Wayback Machine"
else
	echo "$url (in clipboard) is not valid URL"
fi

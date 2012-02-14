#!/bin/bash

# This script temporarily clones remote's Assetic repository
# and copies parts of it into the appropriate FLOW3's package's
# directories.

ASSETIC_REPOSITORY="git://github.com/kriswallsmith/assetic.git"

echo Assetic file checkout script
echo

if [ ! -d "Classes" -o ! -d "Scripts" -o ! -d "../Assetic" ]; then
	echo Make sure you run this from the Assetic package\'s root directory!
	echo
	exit 1
fi

git clone $ASSETIC_REPOSITORY ./_tempclone

echo Copying files
cp -R ./_tempclone/src/Assetic/* ./Classes
cp -R ./_tempclone/LICENSE ./Meta
cp -R ./_tempclone/composer.json ./Meta

echo Removing temporary directory
rm -rf ./_tempclone

echo Done.
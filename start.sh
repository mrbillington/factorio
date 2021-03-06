#!/bin/sh -x
set -e

ln -sf /config/saves /factorio/saves
cp -rp /files /conifg

if ! find -L /factorio/saves -iname \*.zip -maxdepth 1 -print | grep -q . ; then
	echo "No save files found. Creating new map."
	/factorio/bin/x64/factorio --create /factorio/saves/_autosave1.zip --map-gen-settings /config/map-gen-settings.json
fi

/factorio/bin/x64/factorio --start-server-load-latest --server-settings /config/server-settings.json --mod-directory /config/mods
#!/bin/sh -x
set -e

mkdir -p /factorio/saves
ln -s /factorio/saves /config/saves
cp -rp /files/ /conifg

ls -la /config
ls -la /files
ls -la /factorio

if ! find -L /factorio/saves -iname \*.zip -mindepth 1 -print | grep -q . ; then
	echo "No save files found. Creating new map."
	/factorio/bin/x64/factorio --create /factorio/saves/_autosave1.zip --map-gen-settings /config/map-gen-settings.json
	ls -la /factorio/
fi

/config/factorio/bin/x64/factorio --start-server-load-latest --server-settings /config/server-settings.json --mod-directory /config/mods
#!/bin/bash

echo "Version (e.g. 1.0.1): "
read version

echo "Zipping archive: "
zip -r PCM/4ms-kicad-lib-$version.zip footprints/ symbols/ resources/ metadata.json

echo "Copying metadata.json and icon.png"
cp metadata.json PCM/metadata.json
cp resources/icon.png PCM/icon.png

download_sha256=$(shasum --algorithm 256 PCM/4ms-kicad-lib-$version.zip | xargs | cut -d' ' -f1)
download_size=$(ls -l PCM/4ms-kicad-lib-$version.zip | xargs | cut -d' ' -f5)
install_size=$(unzip -l PCM/4ms-kicad-lib-$version.zip | tail -1 | xargs | cut -d' ' -f1)

echo "Edit these json values in PCM/metadata.json:"
echo "\"download_sha256\": \"$download_sha256\","
echo "\"download_size\": $download_size,"
echo "\"download_url\": \"https://github.com/4ms/4ms-kicad-lib/archive/4ms-kicad-lib-$version.zip\","
echo "\"install_size\": $install_size,"

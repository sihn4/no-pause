#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: ./build-neoforge.sh <minecraft-version>"
  exit 1
fi

MC="$1"

case "$MC" in
  "1.21.10") NEO="21.10.64"; JAVA="21" ;;
  "1.21.11") NEO="21.11.45"; JAVA="21" ;;
  "26.1")    NEO="26.1.0.19-beta"; JAVA="25" ;;
  "26.1.1")  NEO="26.1.1.15-beta"; JAVA="25" ;;
  "26.1.2")  NEO="26.1.2.109"; JAVA="25" ;;
  "26.2")    NEO="26.2.0.88"; JAVA="25" ;;
  "26.3")
    echo "NeoForge 26.3 is not enabled in this project yet."
    echo "The official NeoForge Maven index did not have a published 26.3 release when this source was generated."
    exit 2
    ;;
  *)
    echo "No pinned NeoForge target for Minecraft $MC."
    exit 1
    ;;
esac

echo "Building No Pause for NeoForge / Minecraft $MC"
echo "NeoForge: $NEO | Java target: $JAVA"

gradle -p neoforge clean build   -Pminecraft_version="$MC"   -Pneo_version="$NEO"   -Pjava_version="$JAVA"

mkdir -p dist
JAR="neoforge/build/libs/no-pause-neoforge-mc${MC}-1.0.0.jar"
cp "$JAR" dist/
echo "Built: dist/$(basename "$JAR")"

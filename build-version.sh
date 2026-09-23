#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: ./build-version.sh <minecraft-version>"
  exit 1
fi

MC_VERSION="$1"

if ! grep -Fxq "$MC_VERSION" versions.txt; then
  echo "Unsupported target: $MC_VERSION"
  echo "See versions.txt"
  exit 1
fi

case "$MC_VERSION" in
  "1.14.4") JAVA_VERSION=8 ;;
  "1.15") JAVA_VERSION=8 ;;
  "1.15.1") JAVA_VERSION=8 ;;
  "1.15.2") JAVA_VERSION=8 ;;
  "1.16") JAVA_VERSION=8 ;;
  "1.16.1") JAVA_VERSION=8 ;;
  "1.16.2") JAVA_VERSION=8 ;;
  "1.16.3") JAVA_VERSION=8 ;;
  "1.16.4") JAVA_VERSION=8 ;;
  "1.16.5") JAVA_VERSION=8 ;;
  "1.17") JAVA_VERSION=16 ;;
  "1.17.1") JAVA_VERSION=16 ;;
  "1.18") JAVA_VERSION=17 ;;
  "1.18.1") JAVA_VERSION=17 ;;
  "1.18.2") JAVA_VERSION=17 ;;
  "1.19") JAVA_VERSION=17 ;;
  "1.19.1") JAVA_VERSION=17 ;;
  "1.19.2") JAVA_VERSION=17 ;;
  "1.19.3") JAVA_VERSION=17 ;;
  "1.19.4") JAVA_VERSION=17 ;;
  "1.20.1") JAVA_VERSION=17 ;;
  "1.20.2") JAVA_VERSION=17 ;;
  "1.20.4") JAVA_VERSION=17 ;;
  "1.20.6") JAVA_VERSION=21 ;;
  "1.21") JAVA_VERSION=21 ;;
  "1.21.1") JAVA_VERSION=21 ;;
  "1.21.3") JAVA_VERSION=21 ;;
  "1.21.4") JAVA_VERSION=21 ;;
  "1.21.5") JAVA_VERSION=21 ;;
  "1.21.6") JAVA_VERSION=21 ;;
  "1.21.7") JAVA_VERSION=21 ;;
  "1.21.8") JAVA_VERSION=21 ;;
  "1.21.9") JAVA_VERSION=21 ;;
  "1.21.10") JAVA_VERSION=21 ;;
  "1.21.11") JAVA_VERSION=21 ;;
  *) echo "No Java target configured for $MC_VERSION"; exit 1 ;;
esac

echo "Building No Pause for Minecraft $MC_VERSION (Java $JAVA_VERSION target)..."

gradle clean build \
  -Pminecraft_version="$MC_VERSION" \
  -Pjava_version="$JAVA_VERSION"

mkdir -p dist

JAR="build/libs/no-pause-mc${MC_VERSION}-1.0.0.jar"
if [[ ! -f "$JAR" ]]; then
  echo "Expected JAR not found: $JAR"
  exit 1
fi

cp "$JAR" dist/
echo "Built: dist/$(basename "$JAR")"

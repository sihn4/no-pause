#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: ./build-version.sh <minecraft-version>"
  exit 1
fi

MC="$1"
PROJECT=""
JAVA_TARGET=""
LOADER="0.18.1"
LOOM=""
GRADLE_RECOMMENDED=""

case "$MC" in
  "1.14.4") PROJECT="legacy"; JAVA_TARGET="8";;
  "1.15") PROJECT="legacy"; JAVA_TARGET="8";;
  "1.15.1") PROJECT="legacy"; JAVA_TARGET="8";;
  "1.15.2") PROJECT="legacy"; JAVA_TARGET="8";;
  "1.16") PROJECT="legacy"; JAVA_TARGET="8";;
  "1.16.1") PROJECT="legacy"; JAVA_TARGET="8";;
  "1.16.2") PROJECT="legacy"; JAVA_TARGET="8";;
  "1.16.3") PROJECT="legacy"; JAVA_TARGET="8";;
  "1.16.4") PROJECT="legacy"; JAVA_TARGET="8";;
  "1.16.5") PROJECT="legacy"; JAVA_TARGET="8";;
  "1.17") PROJECT="legacy"; JAVA_TARGET="16";;
  "1.17.1") PROJECT="legacy"; JAVA_TARGET="16";;
  "1.18") PROJECT="legacy"; JAVA_TARGET="17";;
  "1.18.1") PROJECT="legacy"; JAVA_TARGET="17";;
  "1.18.2") PROJECT="legacy"; JAVA_TARGET="17";;
  "1.19") PROJECT="legacy"; JAVA_TARGET="17";;
  "1.19.1") PROJECT="legacy"; JAVA_TARGET="17";;
  "1.19.2") PROJECT="legacy"; JAVA_TARGET="17";;
  "1.19.3") PROJECT="legacy"; JAVA_TARGET="17";;
  "1.19.4") PROJECT="legacy"; JAVA_TARGET="17";;
  "1.20.1") PROJECT="legacy"; JAVA_TARGET="17";;
  "1.20.2") PROJECT="legacy"; JAVA_TARGET="17";;
  "1.20.4") PROJECT="legacy"; JAVA_TARGET="17";;
  "1.20.6") PROJECT="legacy"; JAVA_TARGET="21";;
  "1.21") PROJECT="legacy"; JAVA_TARGET="21";;
  "1.21.1") PROJECT="legacy"; JAVA_TARGET="21";;
  "1.21.3") PROJECT="legacy"; JAVA_TARGET="21";;
  "1.21.4") PROJECT="legacy"; JAVA_TARGET="21";;
  "1.21.5") PROJECT="legacy"; JAVA_TARGET="21";;
  "1.21.6") PROJECT="legacy"; JAVA_TARGET="21";;
  "1.21.7") PROJECT="legacy"; JAVA_TARGET="21";;
  "1.21.8") PROJECT="legacy"; JAVA_TARGET="21";;
  "1.21.9") PROJECT="legacy"; JAVA_TARGET="21";;
  "1.21.10") PROJECT="legacy"; JAVA_TARGET="21";;
  "1.21.11") PROJECT="legacy"; JAVA_TARGET="21";;
  "26.1") PROJECT="modern"; JAVA_TARGET="25"; LOADER="0.18.4"; LOOM="1.15-SNAPSHOT"; GRADLE_RECOMMENDED="9.4.0";;
  "26.1.1") PROJECT="modern"; JAVA_TARGET="25"; LOADER="0.18.4"; LOOM="1.15-SNAPSHOT"; GRADLE_RECOMMENDED="9.4.0";;
  "26.1.2") PROJECT="modern"; JAVA_TARGET="25"; LOADER="0.19.3"; LOOM="1.17-SNAPSHOT"; GRADLE_RECOMMENDED="9.5.1";;
  "26.2") PROJECT="modern"; JAVA_TARGET="25"; LOADER="0.19.3"; LOOM="1.17-SNAPSHOT"; GRADLE_RECOMMENDED="9.5.1";;
  "26.3") PROJECT="modern"; JAVA_TARGET="25"; LOADER="0.19.5"; LOOM="1.17-SNAPSHOT"; GRADLE_RECOMMENDED="9.6.0";;
  *)
    echo "Unsupported target: $MC"
    echo "See versions.txt"
    exit 1
    ;;
esac

mkdir -p dist

if [[ "$PROJECT" == "legacy" ]]; then
  echo "Building No Pause for Minecraft $MC (legacy/remapped, Java target $JAVA_TARGET)"
  gradle -p legacy clean build     -Pminecraft_version="$MC"     -Pjava_version="$JAVA_TARGET"     -Ploader_version="$LOADER"
  JAR="legacy/build/libs/no-pause-mc${MC}-1.0.0.jar"
else
  CURRENT_JAVA="$(java -version 2>&1 | head -n1)"
  echo "Building No Pause for Minecraft $MC (modern/unobfuscated, Java 25)"
  echo "Java: $CURRENT_JAVA"
  echo "Fabric Loom: $LOOM | Loader: $LOADER | recommended Gradle: $GRADLE_RECOMMENDED"
  gradle -p modern clean build     -Pminecraft_version="$MC"     -Ploader_version="$LOADER"     -Ploom_version="$LOOM"
  JAR="modern/build/libs/no-pause-mc${MC}-1.0.0.jar"
fi

if [[ ! -f "$JAR" ]]; then
  echo "Expected JAR not found: $JAR"
  exit 1
fi

cp "$JAR" dist/
echo "Built: dist/$(basename "$JAR")"

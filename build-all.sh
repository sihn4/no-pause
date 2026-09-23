#!/usr/bin/env bash
set -u

rm -rf dist
mkdir -p dist

PASSED=()
FAILED=()

while IFS='|' read -r version family rest; do
  [[ -z "$version" ]] && continue

  echo
  echo "============================================================"
  echo "Minecraft $version"
  echo "============================================================"

  if ./build-version.sh "$version"; then
    PASSED+=("$version")
  else
    FAILED+=("$version")
  fi
done < versions.txt

echo
echo "========================== SUMMARY =========================="
echo "Passed (${#PASSED[@]}): ${PASSED[*]:-none}"
echo "Failed (${#FAILED[@]}): ${FAILED[*]:-none}"
echo "JARs are in: dist/"

if (( ${#FAILED[@]} > 0 )); then
  exit 1
fi

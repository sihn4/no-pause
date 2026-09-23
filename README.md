# No Pause

A lightweight Fabric client mod that allows you to tab out without Minecraft's force pause screen popping up.

## Why it is lightweight

- Client-side only
- No Fabric API dependency
- No config screen
- No HUD
- No commands
- No background tick loop
- One startup assignment
- One tiny focus-change mixin

## Multi-version source

This repository uses one shared source tree and builds a separate JAR for each Minecraft version.

Configured targets:

1.14.4, 1.15, 1.15.1, 1.15.2, 1.16, 1.16.1, 1.16.2, 1.16.3, 1.16.4, 1.16.5, 1.17, 1.17.1, 1.18, 1.18.1, 1.18.2, 1.19, 1.19.1, 1.19.2, 1.19.3, 1.19.4, 1.20.1, 1.20.2, 1.20.4, 1.20.6, 1.21, 1.21.1, 1.21.3, 1.21.4, 1.21.5, 1.21.6, 1.21.7, 1.21.8, 1.21.9, 1.21.10, 1.21.11

The build matrix intentionally makes a separate JAR per Minecraft version instead of pretending one JAR is safe everywhere.

## Build one version

Example:

```bash
./build-version.sh 1.21.11
```

Output:

```text
dist/no-pause-mc1.21.11-1.0.0.jar
```

Another example:

```bash
./build-version.sh 1.20.1
```

## Build every configured version

```bash
./build-all.sh
```

Successful JARs are copied into `dist/`. The script continues through the list and gives a pass/fail summary at the end.

## GitHub Actions

`.github/workflows/build.yml` builds every configured Minecraft version independently whenever you push.

That is useful before marking a version as supported on Modrinth: check that its GitHub Actions job is green first.

## Requirements

Gradle runs using Java 21. The build itself targets the bytecode level appropriate for each Minecraft generation.

## Mod icon

The mod icon is stored at:

```text
src/main/resources/assets/nopause/icon.png
```

## License

MIT

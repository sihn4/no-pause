# No Pause

A lightweight mod that allows you to tab out without Minecraft's force pause screen popping up.

## Loaders

### Fabric
The `legacy/` and `modern/` projects contain the Fabric builds.

### Quilt
Quilt does **not** need a separate port for this mod. Quilt Loader can load almost
all Fabric mods, and No Pause has no Fabric API dependency. Use the corresponding
Fabric JAR on Quilt. See `QUILT.md`.

### NeoForge
`neoforge/` is a separate NeoForge port because NeoForge cannot load Fabric/Quilt mods.

Pinned NeoForge targets currently included:

- Minecraft 1.21.10 -> NeoForge 21.10.64
- Minecraft 1.21.11 -> NeoForge 21.11.45
- Minecraft 26.1 -> NeoForge 26.1.0.19-beta
- Minecraft 26.1.1 -> NeoForge 26.1.1.15-beta
- Minecraft 26.1.2 -> NeoForge 26.1.2.109
- Minecraft 26.2 -> NeoForge 26.2.0.88

NeoForge 26.3 is intentionally **not claimed yet** in this source. The Minecraft
26.3 release exists, but the official NeoForge Maven release index did not yet
contain a published 26.3 artifact when this source was generated.

## Build

Fabric example:

```bash
./build-version.sh 1.21.11
```

NeoForge example:

```bash
./build-neoforge.sh 1.21.11
```

or:

```bash
./build-neoforge.sh 26.2
```

Successful JARs are copied into `dist/`.

## Design

- client-side
- no Fabric API dependency
- no config
- no commands
- no HUD
- no background tick loop
- one tiny focus-change mixin
- your custom icon is included

## Before Modrinth

Do not mark a loader/version as supported until that exact build is green in CI
and ideally has been launched once in that loader.

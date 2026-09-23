# Versioning notes

Minecraft 26.1 changed the modding build pipeline substantially.

- Minecraft 1.21.11 and older are obfuscated and use Fabric's remapping Loom plugin.
- Minecraft 26.1 and newer are unobfuscated and use `net.fabricmc.fabric-loom`.
- Minecraft 26.1+ requires Java 25.

For that reason this repository intentionally has two tiny build projects instead of forcing every Minecraft generation through one Gradle configuration.

Each Minecraft release gets its own JAR. This is safer for Modrinth compatibility metadata than claiming one file supports every release.

The actual No Pause behavior stays the same in both generations:
1. turn off `pauseOnLostFocus` during client initialization;
2. force it off again whenever Minecraft's window focus changes.

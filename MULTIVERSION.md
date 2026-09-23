# Multi-version release notes

Do not upload one JAR and mark it compatible with every Minecraft version.

No Pause builds one remapped JAR per Minecraft version because Minecraft/Fabric mappings can change between releases.

Recommended release workflow:

1. Push source to GitHub.
2. Open the Actions tab.
3. Wait for the version matrix.
4. Only mark a Minecraft version supported when that version's job builds successfully.
5. Runtime-test at least the versions you expect most users to download.

The core implementation deliberately stays tiny so porting is easy:
- set `options.pauseOnLostFocus = false` on client init
- force it false again when window focus changes

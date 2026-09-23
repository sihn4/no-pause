package dev.layne.nopause;

import net.neoforged.fml.common.Mod;

@Mod(NoPauseNeoForge.MOD_ID)
public final class NoPauseNeoForge {
    public static final String MOD_ID = "nopause";

    public NoPauseNeoForge() {
        // The actual behavior is intentionally implemented by one tiny
        // client mixin so the loader-specific bootstrap stays empty.
    }
}

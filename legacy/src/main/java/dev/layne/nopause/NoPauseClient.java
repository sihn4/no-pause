package dev.layne.nopause;

import net.fabricmc.api.ClientModInitializer;
import net.minecraft.client.Minecraft;

public final class NoPauseClient implements ClientModInitializer {
    @Override
    public void onInitializeClient() {
        Minecraft.getInstance().options.pauseOnLostFocus = false;
    }
}

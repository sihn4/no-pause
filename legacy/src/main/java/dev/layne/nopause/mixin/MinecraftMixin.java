package dev.layne.nopause.mixin;

import net.minecraft.client.Minecraft;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;

@Mixin(Minecraft.class)
public abstract class MinecraftMixin {
    @Inject(method = "setWindowActive", at = @At("HEAD"))
    private void noPause$disablePauseOnFocusChange(boolean active, CallbackInfo ci) {
        Minecraft minecraft = (Minecraft) (Object) this;
        minecraft.options.pauseOnLostFocus = false;
    }
}

# Quilt support

No separate Quilt source tree is needed for No Pause.

Quilt Loader is designed to load almost all Fabric mods. No Pause is an especially
simple compatibility case because it:

- is client-side only;
- depends only on Fabric Loader, not Fabric API;
- uses one standard Mixin;
- does not use Fabric-specific gameplay APIs.

So for a Minecraft version that Quilt Loader supports, use the matching **Fabric**
No Pause JAR and mark that file as both **Fabric** and **Quilt** on Modrinth after
you have confirmed its build/runtime test.

Do not create a second identical "Quilt JAR" just to change the filename.

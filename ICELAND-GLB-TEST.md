# Iceland Snow Field integration test

- User-supplied `assets/snow-field.glb` is loaded via GLTFLoader in the existing game.
- Nine 24 m tiles form a ~72 m x 72 m patch around Iceland spawn.
- A downward raycast samples the real mesh surface under the player to adjust walking height.
- Only Iceland shows this model; other regions retain their previous terrain.
- Existing camera, controls, photo mode, and aurora code are preserved.
- This is a terrain replacement TEST, not a finished high-quality Iceland world.
- Existing primitive trees/mountains/buildings still exist and require separate replacement.
- Local file opening may fail due to browser restrictions: use a static web server / HTTPS host.
- Not tested on an actual iPhone or browser runtime in this environment.

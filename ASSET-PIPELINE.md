# aurura game v80 — real 3D asset pipeline

This version introduces an external `assets/winter_cabin.glb` file and Three.js `GLTFLoader`. The authored cabin is a prototype GLB with a continuous pitched roof, log courses, recessed-looking window frames, and chimney. It is **not** yet a professional high-fidelity environment asset. The game uses it for cabin placements when loaded; otherwise it falls back to the previous procedural cabin. A region change after the asset loads will show the new cabin.

## Next production steps
1. Commission/sculpt the chibi character in Blender and export a skinned, animated GLB with Idle/Walk clips, three hairstyle meshes and material variants.
2. Replace the prototype cabin GLB with an art-directed textured cabin; add spruce, rock, and terrain GLBs.
3. Add model loading progress, mobile LOD, compression and full regression tests for movement, aurora, camera, map and photo mode.

No claim of reference-image-level fidelity or iPhone QA is made for this prototype.


## v81 independent avatar GLB
`assets/winter_avatar.glb` is a separately exported static character mesh with distinct hairstyle meshes. Runtime loads it and preserves saved hairstyle, jacket and scarf colors. Existing procedural v79 avatar remains fallback. **Not a Blender-quality sculpt**: the GLB is an initial authored asset and is not skinned or rigged; limb walk animation is not yet connected to the external GLB. Future work: sculpting, UV/textures, skeletal rig, idle/walk clips, optimized LOD.

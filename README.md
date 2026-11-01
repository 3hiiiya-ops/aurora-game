# aurura game v43 — original-reference palette lock

- Jacket colors fixed to cream/white, pink, navy.
- Scarf colors fixed to pink plaid, blue plaid, cream plaid.
- Each first-visit avatar independently receives one jacket and one scarf color. Existing local character assignments remain intact.
- Added lightweight geometric plaid stripes to scarf tail; sleepy eyes, face proportions, beanie, hairstyle variants, and outfit silhouette preserved.
- Multiplayer placeholder coat palette updated to match the three jacket colors.

**Fidelity limitation:** The character remains a primitive Three.js model, not a mesh reconstruction of the original uploaded reference. Exact visual match requires dedicated 3D modeling/texturing and visual comparison.
**Validation:** JavaScript syntax check only. No mobile runtime or multiplayer verification.

## v44: regional camp identity pass
- Iceland: basalt ring and turquoise geothermal pool.
- Norway: separate red harbor shed, pier posts, beacon.
- Canada: ranger lookout platform and timber supplies.
- Alaska: expedition crates, antenna and signal lamp.
- These are lightweight prototype meshes; not reference-quality assets.
- 5 min aurora appearance, 10 min absence, 15 min full cycle and region offsets unchanged.
- No changes to avatar identity/palette, controls, authentication, or PWA.
- JS syntax validated; browser rendering and device performance still require tests.


## v45: third character hairstyle
- Added `girl-long`: straight long hair, keeping the original sleepy face, beanie and outfit.
- Character variants now: `girl` (bob), `girl-long` (straight long), `boy` (short).
- Existing saved avatar variants are preserved; only new avatars randomize among 3 variants.
- New account profiles need the updated SQL constraint: run `supabase-v45-migration.sql` in Supabase SQL Editor on an existing project. Never execute migration automatically from client.
- Outfit/scarf 3-color palettes, four regions, 5-minute aurora/10-minute wait, controls, PWA unchanged.
- Syntax checked, not tested on iPhone/Android browser.

## v46 — ear-length bob correction
- Girl short hairstyle now ends immediately below the ears rather than reaching the chin.
- Girl long straight hair and boy short hair are unchanged.
- Existing avatar identity and clothing palette remain unchanged.
- Prototype geometry only; visual fidelity still requires modeling and device testing.

## v47: photo zone exploration usability
- All 12 distant photo arches are discoverable independently of landmark completion.
- 28-unit approach hint, 12-unit arrival/unlock, saved locally in browser storage.
- Field guide and diagnostics show photo-zone progress (0–12).
- No changes to 3 character hair types, ear-length bob, outfit colors or staggered aurora.
- JavaScript syntax checked; actual browser and phone testing still pending.

## v48 winter visual pass
- Fix Alaska baseCamp undefined stone/warm variables (runtime blocker).
- Add region-specific camp window highlights, snowdrifts, and environment accents.
- Keep three character hairstyles, palette, independent aurora schedule, and exploration.
- Syntax checked, browser/device rendering not yet verified.

## v49 visual forest pass
- Spruce trees now have four staggered branch layers, muted regional foliage, smaller snow caps and snow skirts.
- Existing 3 character styles (including ear-length bob), clothing palettes, regional camps and independent 5-minute-on/10-minute-off aurora schedule unchanged.
- This is an incremental geometry polish, not a replacement for original character reference-quality modeling.
- Syntax checked, not browser/device tested.

## v50
- Replaced perfectly conical distant mountains with irregular faceted peaks and integrated snowcaps.
- Different faces use subtle slate tones, with deterministic silhouettes for each region.
- No changes to character hair, color palettes, 5min-on/10min-off aurora, or exploration.
- Syntax checked; visual/mobile device verification outstanding.

## v51: Navigation map
- Map modal shows exact player position (red marker), base camp (gold marker), and three regional landmarks.
- Live update every 300ms while the map modal is open.
- Map uses game world coordinates -130..130 and north = negative Z.
- Aurora spawn locations remain hidden; compass hints remain available.
- Distance is approximate game-world units, not real GPS distance.
- Syntax checked; mobile browser interaction still needs testing.

## v52 - trail and return-to-camp guidance
- Map shows the player's recent walking trail as an amber polyline.
- Map reports approximate direction and distance back to base camp.
- Trail is held only in memory (up to 700 samples, sampled at least 3 in-game units apart) and resets when changing regions.
- Aurora coordinates remain hidden. No device GPS is used.
- This is a prototype navigation aid, not turn-by-turn pathfinding.
- JavaScript syntax checked; mobile browser testing still needed.

## v53 character detail pass
- Added layered puffer quilting, shaded pockets, scarf fringe, beanie seams, and subtle ear accents.
- Existing assigned avatar variant and palette stay unchanged.
- Three variants: ear-length bob girl, long straight hair girl, short-haired boy.
- This remains procedural low-poly 3D, not a faithful model of the user reference.
- No gameplay schedule or navigation changes. Browser/mobile visual QA pending.

## v54 camera and companion movement
- Companion now follows behind and to the side of the avatar, instead of a fixed world-coordinate offset.
- Companion turns smoothly toward movement and uses subtle steps while following.
- Camera position smoothing adjusted for moving/idle states; no change to user drag, zoom, or sky controls.
- Reuses Vector3 instances each frame to reduce memory churn on mobile.
- No changes to character assignments, region aurora schedule, map, or backend.
- JavaScript syntax verified; on-device visual validation remains necessary.

## v55 Aurora snow glow
- Added a translucent, color-matched aurora glow decal over the snow at the active observation site.
- Glow smoothly fades based on distance and only appears during each region's 5-minute sighting.
- No realtime shadow-casting lights, preserving mobile GPU performance.
- Existing 10-minute wait, 15-minute cycle, map, avatar variants and palettes unchanged.
- Static JS syntax validation completed; real device visual QA is pending.

## v56: winter character ambience
- Adds three low-poly, reusable translucent breath puffs attached to the player.
- Puffs gently expand and fade in cold air; weaker while running.
- Adds subtle idle breathing motion for the white dog.
- Existing character variants, ear-length bob, jacket/scarf palettes, map and aurora timing are unchanged.
- This is a prototype polish pass, not an exact reproduction of the reference illustration.
- Static JS syntax checked; no claim of device/runtime verification.

## v57 mobile HUD
- Narrow screens show map, compass, photo, and More; the other tools open in a collapsible tray.
- Desktop shows all tools as before.
- Tray closes when a tool is selected.
- This does not change character assignments, region art, aurora timing, or navigation.
- JavaScript syntax checked; Safari/Android manual verification still needed.


## v58 avatar and camera polish
- Added subtle translucent cheek warmth and small nose highlight without changing the sleepy eyes.
- Added a padded hood backing behind the head, not covering the face.
- Vertical camera swipe now also adjusts camera elevation, clamped above ground.
- Existing three hairstyles, palettes, map/trail, 5min-on/10min-off aurora unchanged.
- Static JS syntax checked; needs real mobile runtime and screenshot review.

## v59 camera orbit fix
- Real spherical vertical orbit for touch drag; no artificial underground look-at point.
- Camera floor prevents clipping through snow.
- Sky button retains upward view; camera yaw and walking directions preserved.
- No change to aurora timings, avatar variants, clothing colors or map.
- Syntax checked; real-device test pending.

## v60 navigation upgrade
- Map zoom toggle: whole region / 2x follow-player view.
- White heading arrow rotates with avatar; north remains up.
- Aurora location stays hidden. No GPS or new backend permissions.
- JavaScript syntax checked; mobile browser behavior still needs device testing.

## v61: Navigation quality pass
- Route display toggle and clear-history control in map dialog.
- Zoomed map adds a camp bearing arrow even when the camp pin is off-screen.
- No precise aurora locations exposed; current player map coordinates remain local.
- Character hair variants and clothing colors, 5m/10m aurora schedule unchanged.
- JavaScript syntax tested; browser and mobile integration still need device checks.

## v62 지도 정확도 개선
- 지도 방향 화살표의 남북 반전 수정: 캐릭터가 향하는 방향과 일치하도록 조정.
- 전체(1x) / 주변(2x) / 근거리(4x) 3단계 지도 확대.
- 지도 하단 축척 막대(게임 내 거리)를 추가.
- 캐릭터 위치, 지나온 길, 베이스캠프 방향, 오로라 위치 비공개 유지.
- JavaScript 구문 검사만 완료. 실제 브라우저 및 모바일 테스트 필요.


## v63 — 모바일 3D 그래픽 연결 복구
- WebGL 컨텍스트 손실 시 검은 화면 대신 복구 안내 및 다시 열기 버튼 표시
- 그래픽 복구 이벤트가 발생하면 렌더링 해상도와 캔버스 크기를 재설정
- 손실 중 프레임 렌더링을 일시 중지하여 반복 오류 방지
- 서비스워커 캐시 버전을 v63으로 변경하여 구버전 HTML 잔류 위험 감소
- 정적 문법 검사만 수행, 실제 기기 WebGL 손실·복구 테스트는 미실시


## v64 — visual pass
- More legible chibi face and jacket detailing (cheek glow, eye glints, zipper).
- Large region-specific terrain silhouettes: Iceland basalt stacks, Norway shore cottages, Canada treeline, Alaska icy ridge.
- Snow drifts add landscape layering. Visuals still require real-device inspection.

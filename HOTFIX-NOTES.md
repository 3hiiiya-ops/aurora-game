# aurura game v39 — second runtime hotfix

Observed on iPhone: `ReferenceError: Cannot access 'trackPool' before initialization`.

Root cause: initial `build(current)` ran before `const trackPool=[]` was initialized. `typeof` does not protect against a `const` binding in its temporal dead zone.

Fix: delay initial region build until after pooled footprints, snow particles and animation setup; remove misleading typeof guard. This builds the region before starting the animation loop.

Only `index.html` needs replacing if all other v39 files are already present. After committing, ensure Codespaces uses the updated repository version; existing Codespaces may not automatically pull new commits. Clear/reload stale browser PWA cache if necessary.

Validation: inline JavaScript syntax checked with Node. iPhone runtime not yet verified.

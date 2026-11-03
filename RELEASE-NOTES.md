# WeakAuras-CoA v1.0.7 — Prerelease

Fixes the actual root cause of the Options version mismatch: `WeakAurasOptions/VersionCheck.lua` hardcoded `optionsVersion = "1.0.1"`, independently of the TOC metadata. Now the internal Options check, core version, and all companion TOCs agree at 1.0.7. Includes all six addon folders. In-game validation pending.

# WeakAuras-CoA v1.0.6 — Stable

Fixes the version mismatch warning between WeakAuras core and WeakAurasOptions. All four versioned companion modules now report 1.0.6, matching core. Includes all six addon folders, ready to extract into Interface/AddOns. Restart the game after replacing the old folders.

# WeakAuras-CoA v1.0.5

Stable CoA maintenance build. Removes obsolete Beta version matching and fixes the false restart warning on every login. Synchronizes the internal version and AddOns panel metadata.

Memory improvements beyond v1.0.4 have not been benchmarked or verified in-game. Existing auras and SavedVariables remain unchanged.

Maintainer: Uncle Bone — https://github.com/uncle-bone

Original WeakAuras Team attribution and third-party licenses retained.

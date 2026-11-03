# WeakAuras-CoA v1.0.7

**Latest stable release: v1.0.7** · [Download the install-ready ZIP](https://github.com/uncle-bone/WeakAuras-CoA/releases/download/v1.0.7/WeakAuras-CoA-v1.0.7.zip) · [Release notes](https://github.com/uncle-bone/WeakAuras-CoA/releases/tag/v1.0.7)

WeakAuras-CoA is a maintained WeakAuras distribution for **Ascension Conquest of Azeroth / Conquest Reborn**, targeting **World of Warcraft 3.3.5a (Lua 5.1)**.

## v1.0.7 — Version-check fix

- Fixes the repeated Options addon version mismatch warning. The actual cause was a hardcoded `optionsVersion = "1.0.1"` in `WeakAurasOptions/VersionCheck.lua`, even after the Options TOC was updated.
- Synchronizes the runtime Options version, core version, and active 3.3.5a companion addon metadata to **1.0.7**.
- Includes all six addon folders in one ZIP: `WeakAuras`, `WeakAurasArchive`, `WeakAurasModelPaths`, `WeakAurasOptions`, `WeakAurasStopMotion`, and `WeakAurasTemplates`.

## Installation

1. Exit World of Warcraft completely.
2. Extract the ZIP contents directly into your Conquest Reborn `Interface/AddOns/` folder, replacing the existing WeakAuras addon folders.
3. Restart the game. Keep your `WTF` directory and SavedVariables untouched.

The release packaging passed GitHub Actions validation. In-game testing is not claimed.

**Maintainer:** Uncle Bone · [@uncle-bone](https://github.com/uncle-bone)

Original WeakAuras Team attribution and third-party licenses are retained.

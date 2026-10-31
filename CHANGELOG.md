# S-Grab changelog

## 1.0.3 - Developer credit (31 Oct 2026)

- "Built & developed by Shifat" shown under the download button, bottom-right of the home screen

## 1.0.2 - Icon from an image (31 Oct 2026)

- App icon is now built from one picture, `branding/app-icon.png`; replace it to change the icon
- `branding/make-icons.sh` creates every size; the GitHub build runs it automatically
- Removed the vector (code) icon files

## 1.0.1 - New icon (31 Oct 2026)

- Launcher icon is now "SG" on a red/blue split (adaptive, themed and legacy versions)

## 1.0.0 - Stage 1: rebrand (31 Oct 2026)

Forked from Seal 2.0.0-alpha.5 (upstream commit 7677f61, 25 Sep 2026).

- Renamed to S-Grab; app ID `com.sgrab.app`, so it installs alongside Seal
- New teal launcher icon (adaptive, themed/monochrome and legacy PNGs)
- Default theme seed colour teal #0F766E (Material You dynamic colour is still on by default where supported)
- Downloads go to `Download/S-Grab`
- In-app updater, About links and release links point to github.com/operations-t/S-Grab (one constant in `util/AppInfo.kt`)
- Removed upstream sponsor, Telegram and Matrix entries; About now credits Seal (GPL-3.0)
- Version reset to 1.0.0
- New GitHub Actions workflow builds signed APKs and publishes releases from `v*` tags

### Planned
- Stage 2: built-in player
- Stage 3: scheduled downloads
- Stage 4: channel / playlist auto-download
- Stage 5: in-app browser with media detection

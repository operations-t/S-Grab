# S-Grab

Video and audio downloader for Android, built on [yt-dlp](https://github.com/yt-dlp/yt-dlp).
S-Grab is a fork of [Seal](https://github.com/JunkFood02/Seal) by JunkFood02 (GPL-3.0).

## Features

From Seal:
- Download video or audio from the 1,000+ sites yt-dlp supports
- Pick format and quality; embed subtitles, metadata and thumbnails
- Whole playlists in one tap; Quick Download from the share sheet
- Concurrent downloads, queue, resume
- aria2c for faster downloads; custom yt-dlp command templates
- Cookies via a built-in sign-in browser
- Download history with search and export
- Material 3 design with dynamic colour

Coming in S-Grab:
- Built-in player
- Scheduled downloads (time, Wi-Fi only, charging)
- Channel / playlist auto-download
- In-app browser with media detection

## Getting the APK

Every push to `main` builds APKs under **Actions → Build S-Grab APK → Artifacts**.
Pushing a tag such as `v1.0.0` also creates a GitHub Release with the APKs; the app's
built-in updater checks those releases.

Install the `arm64-v8a` APK on most phones, or `universal` if unsure.

### Signing (one-time)

Add these four repository secrets under **Settings → Secrets and variables → Actions**:
`SIGNING_KEY` (the keystore, base64), `ALIAS`, `KEY_STORE_PASSWORD`, `KEY_PASSWORD`.
Without them the workflow builds a debug APK, which cannot update over a previous install.
Keep a private backup of the keystore: if it is lost, users must uninstall to update.

## Changing the app icon

The icon is made from one picture: **`branding/app-icon.png`**.
Replace it with your own square image (1024 × 1024 PNG is best) and push; the build
creates every icon size automatically. Keep the important part in the middle, because
phones crop the edges into a circle or rounded square.

## Building locally

Open in Android Studio (JDK 21), or run `./gradlew assembleGenericDebug`.

## License

GPL-3.0, same as Seal. See `LICENSE` and `NOTICE.md`.

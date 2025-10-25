# BenedictMovies

A lightweight movie browsing app for the take‑home challenge. It fetches data from The Movie Database (TMDB) and showcases Swift Concurrency, a small typed networking layer, and a simple UI for browsing popular titles.

## Setup Instructions

1. Requirements
   - Xcode 26 or later
   - iOS 18 SDK (runs on iOS 17+ with minor feature degradation if applicable)
   - Swift 6 mode enabled

### Quick Start

1) Clone the repo  
2) Open `BenedictMovies.xcodeproj` (or the workspace if present) in Xcode 26+  
3) Add your TMDB API key (see next section) — the app won’t run without it  
4) Select the `BenedictMovies` iOS scheme and Run (⌘R)

## Configuration: API Key via Secrets

This project loads the TMDB API key from a `Secrets.plist`. If you skip this step or the file isn’t found at runtime, network requests will fail with an unauthorized error.

### 1) Place Secrets.plist (required)

You can place `Secrets.plist` in either location — the app will look in the main bundle first, then the repository root as a fallback:

- Preferred: Add `Secrets.plist` to the app target so it’s embedded in the app bundle
  - In Xcode: File > Add Files to "BenedictMovies"…
  - Choose your `Secrets.plist`
  - Confirm "Copy items if needed" is checked
  - Ensure the app target is checked under "Add to targets"
- Alternative: Put `Secrets.plist` at the repository root (same folder as the `.xcodeproj`)

Expected contents:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>API_KEY</key>
    <string>YOUR_TMDB_API_KEY_HERE</string>
</dict>
</plist>
```

## Developer Contact
Name: Reiss Zurbyk
Title: iOS Developer
Phone: 905-774-1878
Email: reisszurbyk@live.ca


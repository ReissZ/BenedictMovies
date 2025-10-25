# BenedictMovies

A lightweight movie browsing app built for the take‑home challenge. It fetches data from The Movie Database (TMDB) and demonstrates modern Swift concurrency, clean networking, and a simple UI to browse popular titles.

## Setup Instructions

1. Requirements
   - Xcode 26 or later
   - iOS 18 SDK (runs on iOS 17+ with minor feature degradation if applicable)
   - Swift 6 mode enabled

## Configuration: API Key via Secrets

This project supports providing the TMDB API key via a `Secrets.plist` which will be shared separately. Follow the steps below to set up your development environment.

### 1) Place Secrets.plist
- Create or obtain a file named `Secrets.plist` (sent separately).
- Place it at the root of the repository (next to the Xcode project), or inside the app target bundle as configured by your project settings. If unsure, prefer the repository root.

The expected structure is a property list with a single string key:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>API_KEY</key>
	<string>YOUR_TMDB_API_KEY_HERE</string>
</dict>
</plist>

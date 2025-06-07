# BeamNG Crash Teleport Tool

This project contains a simple Lua script that teleports your vehicle to a random **crash** location in BeamNG.drive. These spots are intended to leave the car in awkward positions so you can tow it back to a garage or recovery point. The mod now comes with a tiny UI app so you can trigger a random crash with a single button press.

## How it works
- When the mod loads it searches the map for available spawn spheres and uses them as crash locations. If none are found, a few built-in sample points are used instead.
- The script chooses a random location and moves the active vehicle there when triggered.
- You can still add extra spots at runtime with `crash_teleport.addCrashPoint(pos, rot)`.

## Installation

1. Copy or clone this repository into your `Documents/BeamNG.drive/mods/unpacked/crashTeleport` folder.
2. Start BeamNG.drive and enable the mod if prompted.
3. While in game, open the UI app menu and add the **Crash Teleport** app.
4. Press the **Teleport to Crash** button to instantly move your vehicle to a random crash spot.

## Getting Started with Git

1. Initialize the repository (if you haven't already):
   ```bash
   git init
   ```
2. Add files to track:
   ```bash
   git add <file>
   ```
3. Commit your changes:
   ```bash
   git commit -m "Describe your changes"
   ```
4. Push to GitHub:
   ```bash
   git remote add origin <your-repo-url>
   git push -u origin main
   ```

# BeamNG Crash Teleport Tool

This project contains a simple Lua script that teleports your vehicle to a random **crash** location in BeamNG.drive. These spots are intended to leave the car in awkward positions so you can tow it back to a garage or recovery point. The mod now comes with a tiny UI app so you can trigger a random crash with a single button press.

## How it works
- A list of crash coordinates is defined in `lua/crash_teleport.lua`.
- When executed, the script chooses one at random and moves the active vehicle there.
- You can customize the coordinates to match the map you are playing. Use `crashTeleport.addCrashPoint(pos, rot)` in the console to add your own locations at runtime.

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

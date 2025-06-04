# BeamNG Crash Teleport Tool

This project contains a simple Lua script that teleports your vehicle to a random **crash** location in BeamNG.drive. These spots are intended to leave the car in awkward positions so you can tow it back to a garage or recovery point.

## How it works
- A list of crash coordinates is defined in `lua/crash_teleport.lua`.
- When executed, the script chooses one at random and moves the active vehicle there.
- You can customize the coordinates to match the map you are playing.

To use the script, place it inside your BeamNG mod's `lua` folder and invoke `crashTeleport.teleportRandomCrash()` via a key binding or UI button.

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

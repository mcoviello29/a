local M = {}

-- Example crash locations (adjust to match your map)
local crashPoints = {
  {pos = vec3(100, 200, 50), rot = quat(0, 0, 0, 1)},
  {pos = vec3(-150, 75, 60),  rot = quat(0, 0, 1, 0)},
  {pos = vec3(50, -300, 45),  rot = quat(0, 1, 0, 0)},
  {pos = vec3(200, 100, 40), rot = quat(1, 0, 0, 0)},
}

--- Teleports the player's vehicle to a random crash point
local function teleportRandomCrash()
  local vehicle = be:getPlayerVehicle(0)
  if not vehicle or #crashPoints == 0 then return end
  local idx = math.random(#crashPoints)
  local target = crashPoints[idx]
  vehicle:setPosition(target.pos, target.rot)
end

-- Adds a new crash location at runtime
local function addCrashPoint(pos, rot)
  table.insert(crashPoints, {pos = pos, rot = rot or quat(0, 0, 0, 1)})
end

-- Clears all crash points
local function clearCrashPoints()
  crashPoints = {}
end

-- Returns all crash points (useful for debugging)
local function getCrashPoints()
  return crashPoints
end

M.teleportRandomCrash = teleportRandomCrash
M.addCrashPoint = addCrashPoint
M.clearCrashPoints = clearCrashPoints
M.getCrashPoints = getCrashPoints
return M


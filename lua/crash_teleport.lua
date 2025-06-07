local M = {}
-- Crash locations automatically populated at startup
local crashPoints = {}
local defaultPoints = {
  {pos = vec3(100, 200, 50), rot = quat(0, 0, 0, 1)},
  {pos = vec3(-150, 75, 60),  rot = quat(0, 0, 1, 0)},
  {pos = vec3(50, -300, 45),  rot = quat(0, 1, 0, 0)},
  {pos = vec3(200, 100, 40),  rot = quat(1, 0, 0, 0)},
}

-- Attempts to gather crash points from map spawn spheres
local function initCrashPoints()
  crashPoints = {}
  local spawns = scenetree.findClassObjects('SpawnSphere')
  if spawns then
    for _, id in ipairs(spawns) do
      local obj = scenetree.findObjectById(id)
      if obj then
        table.insert(crashPoints, {
          pos = obj:getPosition(),
          rot = obj:getRotation(),
        })
      end
    end
  end
  -- If no spawns were found, fall back to built-in points
  if #crashPoints == 0 then
    crashPoints = defaultPoints
  end
end

local function onInit()
  initCrashPoints()
end

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
M.onInit = onInit
return M


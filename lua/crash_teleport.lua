local M = {}

-- Crash locations automatically populated at startup
local crashPoints = {}
local defaultPoints = {
  {pos = vec3(100, 200, 50), rot = quat(0, 0, 0, 1)},
  {pos = vec3(-150, 75, 60),  rot = quat(0, 0, 1, 0)},
  {pos = vec3(50, -300, 45),  rot = quat(0, 1, 0, 0)},
  {pos = vec3(200, 100, 40),  rot = quat(1, 0, 0, 0)},
}

-- Creates random crash locations across the map by raycasting to the ground
local function generateRandomPoints(count)
  local veh = be:getPlayerVehicle(0)
  if not veh then return end

  local mapMin = vec3(-2000, -2000, 0) -- adjust for your map size
  local mapMax = vec3(2000, 2000, 0)
  local attempts = 0

  while #crashPoints < count and attempts < count * 10 do
    local x = mapMin.x + math.random() * (mapMax.x - mapMin.x)
    local y = mapMin.y + math.random() * (mapMax.y - mapMin.y)
    local z = mapMin.z + 100

    local from = vec3(x, y, z)
    local to   = vec3(x, y, z - 200)
    local result = veh:castRayStatic(from, to)

    if result and result.hit then
      local spawnZ = result.pos.z + 1
      table.insert(crashPoints, {
        pos = vec3(x, y, spawnZ),
        rot = quat(0, 0, 0, 1)
      })
    end
    attempts = attempts + 1
  end
end

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

  if #crashPoints == 0 then
    generateRandomPoints(50)
  end

  if #crashPoints == 0 then
    crashPoints = defaultPoints
  end
end

local function onExtensionLoaded()
  initCrashPoints()
end

--- Teleports the player's vehicle to a random crash point
local function teleportToRandomCrash()
  if #crashPoints == 0 then
    log("E", "crashTeleport", "No crash points available!")
    return
  end

  local vehicle = be:getPlayerVehicle(0)
  if not vehicle then return end
  local idx = math.random(#crashPoints)
  local target = crashPoints[idx]
  vehicle:setPositionRotation(target.pos.x, target.pos.y, target.pos.z,
    target.rot.x, target.rot.y, target.rot.z, target.rot.w)
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

M.teleportToRandomCrash = teleportToRandomCrash
M.addCrashPoint = addCrashPoint
M.clearCrashPoints = clearCrashPoints
M.getCrashPoints = getCrashPoints
M.onExtensionLoaded = onExtensionLoaded
return M


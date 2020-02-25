Class("RoomTiles") ({
    ["TileImage"] = love.graphics.newImage("Data/RoomTile.png")
},
{GUIElement})
---Define system base class:
Class("SystemClass") {
  ["Name"] = "Shields",
  ["Damage"] = 0,
  ["Level"] = 2,
  ["MaxLevel"] = 10,
  ["Power"] = 2,
  ["UpgradeCost"] = MakeUpgrScalingRule(6, 50, 10, 0, 5),
  ["EquipmentInSys"] = false,
  ["Equipment"] = {},
  ["BuffWhenManned"] = true,
  ["CurrentBuffMult"] = 1,
  ["MannedBuffMult"] = 0.85,
  ["UnmannedBuffMult"] = 1,
  ["Manned"] = false,
  ["ActiveEffectEndMultiplier"] = 1,
  ["PassiveEffectWhenPowered"] = true,
  ["ActiveEffectWhenPowered"] = true
}
---Define door class:
Class("DoorClass") {
  ["Room1Index"] = 1,
  ["Room1Size"] = {2, 2},
  ["Room1Tile"] = {2, 1},
  ["Airlock"] = true,
  ["Room2Index"] = 2,
  ["Room2Size"] = {2, 2},
  ["Room2Tile"] = {1, 1}
}
function MakeDoor(R1I, R1S, R1T, A, R2I, R2S, R2T)
  door = DoorClass:new()
  door.Room1Index = R1I or 1
  door.Room1Size = R1S or {2, 2}
  door.Room1Tile = R1T or {2, 1}
  A = a or true
  door.Airlock = A
  if not A then
    door.Room2Index = R2I or 2
    door.Room2Index = R2S or {2, 2}
    door.Room2Tile = R2T or {1, 1}
  end
  return door
end
---Define room class + list:
TargetableRooms = {}
Class("RoomClass") {
  ["Location"] = {0, 0},
  ["Ox"] = 100,
  ["Size"] = {2, 2},
  ["Doors"] = {},
  ["System"] = SystemClass:new()
  }
---Defines ship base class:
Class("ShipClass") {
  ["MaxHull"] = 50,
  ["Hull"] = 50,
  ["Shield"] = 0,
  ["ShieldRechargeLerp"] = 0,
  ["ShieldBuffer"] = 1, ---how many impacts each layer of shield protects against
  ["MaxReactor"] = 50,
  ["Reactor"] = 10,
  ["MaxSystems"] = 20,
  ["SystemList"] = {},
  ["MaxSubSystems"] = 10,
  ["SubSystemList"] = {}
  }
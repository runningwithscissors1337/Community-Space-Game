---Define system base class:
Class("SystemClass") {
  ["Name"] = "Shields",
  ["Damage"] = 0,
  ["Level"] = 2,
  ["MaxLevel"] = 10,
  ["Power"] = 2,
  ["Room"] = 0,
  ["EquipmentInSys"] = false,
  ["Equipment"] = {},
  ["BuffWhenManned"] = true,
  ["BuffMult"] = 1,
  ["Manned"] = false,
  ["Buff"] = function(ShSkL)
    if self.Manned then
    self.BuffMult = (self.BuffMult - (15 + (5*ShSkL))/100)
  end
end,
  ["ActiveEffectEndMultiplier"] = 1,
  ["UpgrScalingRule"] = function(Level)
    if Level > 6 then
      return 50 + ((Level-1)*10)
    else
    return (Level*10)
  end
end,
  ["PassiveEffectWhenPowered"] = true,
  ["EffectScaling"] = function(Power)
    
  end,
  ["PassiveEffect"] = function(Ship)
    if Ship.Shield < (math.floor(self.Power/2)) then
    Wait(1*self.ActiveEffectEndMultiplier*BuffMult)
    Ship.Shield = Ship.Shield + 1
  end
end,
  ["ActiveEffectWhenPowered"] = true,
  ["ActiveEffect"] = function(Ship)
    Ship.Shield = (Ship.Shield*2)
    Wait(5)
    self.ActiveEffectWhenPowered = false
    self.EfEndMult = 2
    Wait(10)
    self.EfEndMult = 1
    self.ActiveEffectWhenPowered = true
    Ship.Shield = 0
end
}
function MakeSystem(N, L, ML, P, R, EqISys, Eq, BuffWM, B, SR, PassEfWP, EfS, PassEf, ActEfWP, ActEf)
  sys = SystemClass:new()
  sys.Name = N or "ErrorWithName"
  sys.Damage = 0
  sys.Level = L or 2
  sys.MaxLevel = ML or 10
  sys.Power = P or 2
  sys.Room = R or 0
  sys.EquipmentInSys = EqISys or false
  sys.Equipment = Eq or {}
  sys.BuffWhenManned = BuffWM or true
  sys.Buff = B or function()
  sys.UpgrScalingRule = SR or function(Level)
    if Level > 6 then
    return 50 + ((Level-1)*10)
  else
    return (Level*10)
  end
end
  sys.PassiveEffectWhenPowered = PassEfWP or true
  sys.EffectScaling = EfS or function(Power)
    
  end
  sys.PassiveEffect = PassEf or function(Ship)
    if Ship.Shield < (math.floor(self.Power/2)) then
    Wait(1*self.ActiveEffectEndMultiplier)
    Ship.Shield = Ship.Shield + 1
end
end
  sys.ActiveEffectWhenPowered = ActEfWP or true
  sys.ActiveEffect = ActEf or function(Ship)
    Ship.Shield = (Ship.Shield*2)
    Wait(5)
    self.ActiveEffectWhenPowered = false
    self.EfEndMult = 2
    Wait(10)
    self.EfEndMult = 1
    self.ActiveEffectWhenPowered = true
    Ship.Shield = 0
  end
  end
end
---Define basic systems:
function NewShieldSys(R)
  MakeSystem("Shields", 2, 12, 2, R, false, {}, true, false)
end
function NewWeaponSys(EqWeapons, R)
  MakeSystem("Weapons", 4, 16, 0, R, true, EqWeapons, true, false)
end
---Defines ship base class:
Class("ShipClass") {
  ["MaxHull"] = 50,
  ["Hull"] = 50,
  ["Shield"] = 0,
  ["TakeDamage"] = function(Damage, TargetedRoom)
    self.Hull = self.Hull - Damage
  end,
  ["MaxReactor"] = 50,
  ["Reactor"] = 10,
  ["MaxSystems"] = 20,
  ["SystemList"] = {},
  ["MaxSubSystems"] = 10,
  ["SubSystemList"] = {}
  }
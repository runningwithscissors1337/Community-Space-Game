function MakeUpgrScalingRule(a, b, c, d, e)
  return function(Level)
    if Level > a then
      return (b + (Level * c))
    else
      return (d + (Level * e))
  end
end
end
function MakeWeaponCharge(W)
  return function()
    
  end
end
function MakeShieldRegen()
return function(S, CMult)
  Timer.tween((1*CMult), Ship.ShieldRechargeLerp, 1, "linear", function()
      Ship.ShieldRechargeLerp = 0
      Ship.Shield = Ship.Shield + 1
    end)
  end
end

-- {[magicLevel] = dano}

local LEVEL_STORAGE = 6553712
local MAGIC_STORAGE = 6553713

local minimumDamage = 380

local damages = {
  [140] = 600,
  [135] = 550,
  [125] = 490,
  [100] = minimumDamage,
}

local damagePerLevel = {
  [300] = 1.50,
  [20] = 1.55,
  [15] = 1.15,
  [10] = 1,
}

local function getDamage(magicLevel, level)
  if not magicLevel or magicLevel == -1 then
    return minimumDamage 
  end

  local damage = minimumDamage

  local damageLevel = 1

  for a, b in pairs(damages) do 
    if magicLevel >= a and b > damage then 
      damage = b 
    end 
  end

  for a, b in pairs(damagePerLevel) do 
    if level >= a and b > damageLevel then 
      damageLevel = b 
    end 
  end

  return damage * damageLevel
end


function onCastSpell(cid, var)
  local damage = getDamage(getCreatureStorage(cid, MAGIC_STORAGE), getCreatureStorage(cid, LEVEL_STORAGE))
  local target = getCreatureTarget(cid)
  if not target then 
    return true
  end

  local pos = getThingPos(cid)
  local targetPos = getThingPos(target)
  if getDistanceBetween(pos, targetPos) > 7 then
    return true 
  end

  doSendDistanceShoot(pos, targetPos, CONST_ANI_ENERGY)
  doTargetCombatHealth(cid, target, COMBAT_ENERGYDAMAGE, -damage, -damage, CONST_ME_PURPLEENERGY)
  --doTargetCombatHealth(cid, target, COMBAT_ENERGYDAMAGE, -damage - damage*0.15, -damage - damage*0.15, CONST_ME_PURPLEENERGY)
  return true
end

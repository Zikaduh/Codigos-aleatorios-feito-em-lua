local HAVE_CLONE = 6553720 --storage to know if you have clones or not

local LEVEL_STORAGE = 6553712
local MAGIC_STORAGE = 6553713


local function summonerCreature(cid, creature)
	local monster
	if getCreatureTarget(cid) > 0 then
		monster = doCreateMonster(creature, getCreaturePosition(getCreatureTarget(cid)), false, true)
	else
		monster = doCreateMonster(creature, getCreaturePosition(cid), false, true)
	end
	doCreatureSetStorage(monster, MAGIC_STORAGE, getPlayerMagLevel(cid))
	doCreatureSetStorage(monster, LEVEL_STORAGE, getPlayerLevel(cid))
	doConvinceCreature(cid, monster)
	setPlayerStorageValue(cid, HAVE_CLONE, 1)
	doCreatureSay(cid, "Utevo Aura", TALKTYPE_ORANGE_1)
	doCreatureAddMana(cid, -2000)
	addEvent(function()
		if isCreature(monster) then
			doRemoveCreature(monster)
		end
		if isCreature(cid) then
			setPlayerStorageValue(cid, HAVE_CLONE, -1)
		end
	end, 30 * 1000)

end

function onCastSpell(cid, var)
	local treiner = isInArea(getCreaturePosition(cid),{x = 612, y = 2510, z = 14},{x = 822, y = 3181, z = 14}) or  isInArea(getThingPos(cid),{x = 872, y = 2702, z = 14},{x = 1354, y = 3182, z = 14})
--	if not bomberman:isInGame(cid) or ZombieEvent:isInEvent(cid) then
		if treiner ~= true then
			if getPlayerStorageValue(cid, HAVE_CLONE) == -1 then
				if getPlayerLevel(cid) >= 1 then
					summonerCreature(cid, "Crystal Protector")
				else
					doPlayerSendCancel(cid, "Voc� precisa ser level maior que 300 para pode usar!")
				end
			else
				doPlayerSendCancel(cid, "Voc� Ja fez o Cyber Protector.")
			end
		else
			doPlayerSendCancel(cid, "Voc� n�o pode utilizar utevo aura dentro dos treiners.")
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		end
--	else
--		doPlayerSendCancel(cid, "Voc� n�o pode utilizar utevo aura durante o evento.")
	--	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
--	end
end
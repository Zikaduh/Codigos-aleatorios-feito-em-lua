TR_ALAVANCAS2 = 'alavancas2'

local context = Locales:getContext(TR_ALAVANCAS2)
if not context then
  context = Locales:registerContext(TR_ALAVANCAS2)
  context[LANG_PT][1] = "Aguarde!"
  context[LANG_EN][1] = "Wait!"
  context[LANG_ES][1] = "�Espera!"
end

local config = {
	[33920] = {positions = {{x = 1279, y = 1475, z = 13}, {x = 1279, y = 1476, z = 13}}, pedras = 9533, storage = 20000000001},
	[33921] = {positions = {{x = 1303, y = 1454, z = 13}, {x = 1304, y = 1454, z = 13}}, pedras = 9485, storage = 20000000002},
	[33922] = {positions = {{x = 1261, y = 1446, z = 12}}, pedras = 1304, storage = 20000000003},
	[33923] = {positions = {{x = 1333, y = 1451, z = 13}, {x = 1333, y = 1452, z = 13}}, pedras = 1304, storage = 20000000004},
	[33924] = {positions = {{x = 1356, y = 1441, z = 13}, {x = 1357, y = 1441, z = 13},{x = 1358, y = 1441, z = 13},{x = 1359, y = 1441, z = 13}}, pedras = 1304, storage = 20000000005},
	[33925] = {positions = {{x = 939, y = 2119, z = 8}, {x = 940, y = 2119, z = 8}}, pedras = 1354, storage = 20000000006},
	[33926] = {positions = {{x = 962, y = 2293, z = 7}, {x = 962, y = 2292, z = 7}, {x = 962, y = 2291, z = 7}, {x = 962, y = 2290, z = 7}}, pedras = 1353, storage = 20000000007},
	[33927] = {positions = {{x = 985, y = 2292, z = 7}, {x = 985, y = 2291, z = 7}, {x = 985, y = 2290, z = 7}, {x = 985, y = 2289, z = 7}}, pedras = 1353, storage = 20000000008},
}
function onUse(cid, item, fromPosition)
	if getCreatureStorage(cid, 7081) - os.time() >= 0 then
		doPlayerSendCancel(cid, translate(cid, TR_ALAVANCAS2, 1))
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
	  return true
 	end
	 
	if item.itemid == 9825 then
		doTransformItem(item.uid,item.itemid+1)
		doSendMagicEffect(fromPosition,CONST_ME_MAGIC_GREEN)
		doSendAnimatedText(fromPosition, "*OPEN*", TEXTCOLOR_WHITE)
	elseif item.itemid == 9826 then
		doTransformItem(item.uid, item.itemid-1)
		doSendMagicEffect(fromPosition,CONST_ME_MAGIC_GREEN)
		doSendAnimatedText(fromPosition, "*CLOSE*", TEXTCOLOR_RED)
  end
	for _, pos in pairs(config[item.uid].positions) do
		local pedra = getTileItemById(pos, config[item.uid].pedras).uid
		
		if pedra > 100 then
			doRemoveItem(pedra)
			doCreatureSetStorage(cid, 7081,  os.time() + (1 * 10))
			doSendMagicEffect(pos,CONST_ME_TUTORIALARROW)
			if item.itemid == 9534 or 9531 then
				doSendMagicEffect(fromPosition,CONST_ME_MAGIC_GREEN)
				doSendAnimatedText(fromPosition, "*OPEN*", TEXTCOLOR_WHITE)
			end
		else
			doCreatureSetStorage(cid, 7081,  os.time() + (1 * 10))
			doSendMagicEffect(pos,CONST_ME_HOLYAREA)
			
			if config[item.uid].action then
				local atribute = doCreateItem(config[item.uid].pedras,1, pos) 
				doItemSetAttribute(atribute, "uid", config[item.uid].action)
			elseif config[item.uid].citem then
				doCreateItem(config[item.uid].citem,1, pos)
				setGlobalStorageValue(config[item.uid],  os.time() + 60 * 60 * 24)
			else
				doCreateItem(config[item.uid].pedras,1, pos)
					
				if item.itemid == 9534 or 9531 then
					doSendMagicEffect(fromPosition,CONST_ME_MAGIC_GREEN)
					doSendAnimatedText(fromPosition, "*CLOSE*", TEXTCOLOR_RED)
				end
			end
		end
	end
	return true
end 

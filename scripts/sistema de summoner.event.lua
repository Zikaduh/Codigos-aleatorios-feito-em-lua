TR_GUILD_QUEST = 'guildQuest'

local context = Locales:getContext(TR_GUILD_QUEST)
if not context then
  context = Locales:registerContext(TR_GUILD_QUEST)
  context[LANG_PT][1] = "[Guild Quest]%sO round %s acabou e a alavanca já pode ser puxada novamente."
  context[LANG_EN][1] = "[Guild Quest]%sRound %s ended and the lever can now be pushed again."
  context[LANG_ES][1] = "[Guild Quest]%sLa wave %s ha terminado y la palanca ya se puede tirar de nuevo."

  context[LANG_PT][2] = "[Guild Quest]\nA wave %s do round %s começou!"
  context[LANG_EN][2] = "[Guild Quest]\nWave %s from round %s started!"
  context[LANG_ES][2] = "[Guild Quest]\nLa wave %s del round %s ha comenzado!"

  context[LANG_PT][3] = "[Guild Quest]%sVocês completaram todas as waves e podem prosseguir para a sala de prêmios!"
  context[LANG_EN][3] = "[Guild Quest]%sYou have completed all the waves and can proceed to the awards room!"
  context[LANG_ES][3] = "[Guild Quest]%sUsted ha completado todas las ondas y pueden continuar a la sala de premios!"

  context[LANG_PT][4] = "[Guild Quest] Aguarde um pouco antes de puxar a alavanca!"
  context[LANG_EN][4] = "[Guild Quest] Wait a bit before pulling the lever!"
  context[LANG_ES][4] = "[Guild Quest] ¡Espere un poco antes de tirar de la palanca!"

  context[LANG_PT][5] = "[Guild Quest] Somente líderes de guild podem puxar a alavanca!"
  context[LANG_EN][5] = "[Guild Quest] Only guild leaders can pull the lever!"
  context[LANG_ES][5] = "[Guild Quest] ¡Sólo los líderes del gremio pueden tirar de la palanca!"

  context[LANG_PT][6] = "[Guild Quest] Alguma guild já está fazendo a quest, aguarde até que eles terminem."
  context[LANG_EN][6] = "[Guild Quest] Some guild is already doing the quest, wait until they finish."
  context[LANG_ES][6] = "[Guild Quest] Un guild ya está haciendo la quest, espere hasta que terminen."

  context[LANG_PT][7] = "[Guild Quest] A sua conta já participou da quest esta semana. Aguarde %s para participar novamente."
  context[LANG_EN][7] = "[Guild Quest] Your account has already taken part in the quest this week. Please wait %s to participate again."
  context[LANG_ES][7] = "[Guild Quest] Su cuenta ya ha participado en la encuesta esta semana. Espere %s para participar de nuevo."

  context[LANG_PT][8] = "[Guild Quest] Você deve ser pelo menos level 100 para participar da quest."
  context[LANG_EN][8] = "[Guild Quest] You must be at least level 100 to participate in the quest."
  context[LANG_ES][8] = "[Guild Quest] Usted debe ser al menos nivel 100 para participar en la quest."

  context[LANG_PT][9] = "[Guild Quest] Você precisa de pelo menos %s membros level 100+ da sua guild que não participaram da quest esta semana para iniciar."
  context[LANG_EN][9] = "[Guild Quest] You need at least %s members level 100+ from your guild who did not participate in the quest this week to start."
  context[LANG_ES][9] = "[Guild Quest] Usted necesita al menos %s miembros level 100+ de su gremio que no participaron en la búsqueda esta semana para comenzar."

  context[LANG_PT][10] = "[Guild Quest] O seu time excedeu o limite de %s players permitidos na quest. Escolha %s players para sair e tente novamente."
  context[LANG_EN][10] = "[Guild Quest] Your team has exceeded the limit of %s players allowed in the quest. Choose %s players to quit and try again."
  context[LANG_ES][10] = "[Guild Quest] Su equipo ha superado el límite de %s players permitidos en la quest. Seleccione %s players para salir y volver a intentarlo."

  context[LANG_PT][11] = "[Guild Quest]\nPara iniciar o primeiro round, puxe a alavanca."
  context[LANG_EN][11] = "[Guild Quest]\nTo start the first round, pull the lever."
  context[LANG_ES][11] = "[Guild Quest]\nPara iniciar el primero round, tire de la palanca."

  context[LANG_PT][12] = "[Guild Quest] Você só pode sair depois que todos os rounds tiverem terminado."
  context[LANG_EN][12] = "[Guild Quest] You can only leave after all the rounds are over."
  context[LANG_ES][12] = "[Guild Quest] Usted sólo puede salir después de que todos los rounds hayan terminado."

  context[LANG_PT][13] = "[Guild Quest] Esta porta é somente para saída."
  context[LANG_EN][13] = "[Guild Quest] This door is for exit only."
  context[LANG_ES][13] = "[Guild Quest] Este puerto es sólo para salida."

  context[LANG_PT][14] = "[Guild Quest]\nBem vindo à sala de recompensas!"
  context[LANG_EN][14] = "[Guild Quest]\nWelcome to the rewards room!"
  context[LANG_ES][14] = "[Guild Quest]\nBienvenido a la sala de recompensas!"

  context[LANG_PT][15] = "Este baú está vazio."
  context[LANG_EN][15] = "This chest is empty."
  context[LANG_ES][15] = "Este baúl está vacío."

 	context[LANG_PT][16] = "[EXP BOOST]\nVocê recebeu 50%% de bônus de exp por mais 3 hora Use !exp para mais informações."
  context[LANG_EN][16] = "[EXP BOOST]\nYou received 50%% bonus exp for 3 more hours Use !exp for more information."
  context[LANG_ES][16] = "[EXP BOOST]\nRecibió 50%% de bonificación exp por 3 horas más Use !exp para más información."
end

if GuildQuest == nil then

	GuildQuest = {
		minPlayers = 2,
		maxPlayers = 20,
		storages = {
		lives = STORAGE_GUILDQUEST_LIVES, 
		round = STORAGE_GUILDQUEST_ROUND, 
		delay = STORAGE_GUILDQUEST_DELAY, 
		participation = STORAGE_GUILDQUEST_PARTICIPATION},
		waitingRoom = {
			fromPos = {x = 831, y = 1303, z = 7},
			  toPos = {x = 837, y = 1306, z = 7}
		},
		room = {
			fromPos = {x = 822, y = 1291, z = 7},
			  toPos = {x = 842, y = 1301, z = 7}
		},
		enterPositions = {
		{x = 828, y = 1293, z = 7}, {x = 832, y = 1293, z = 7}, 
		{x = 835, y = 1292, z = 7}, {x = 840, y = 1292, z = 7}, 
		{x = 840, y = 1299, z = 7}, {x = 840, y = 1302, z = 7},
		{x = 837, y = 1298, z = 7}, {x = 832, y = 1295, z = 7}, 
		{x = 831, y = 1298, z = 7}, {x = 834, y = 1300, z = 7}},
		rounds = {
			[1] = {
				effect = CONST_ME_SMALLPLANTS,
				{{"[Guild Quest] Hydra", 2}, {"[Guild Quest] Bog Raider", 3}, {"[Guild Quest] Bog Raider", 3}, {"[Guild Quest] Medusa", 1}},
				{{"[Guild Quest] Phantasm", 2}, {"[Guild Quest] Defiler", 2}, {"[Guild Quest] Earth Infernalist", 3}, {"[Guild Quest] Son of Verminor", 1}},
				{{"[Guild Quest] Hydra", 2}, {"[Guild Quest] Lizard Legionnaire", 3}, {"[Guild Quest] Cranky Lizard Crone", 3}, {"[Guild Quest] Druid", 1}},
				{{"[Guild Quest] Hydra", 2}, {"[Guild Quest] Bog Raider", 3}, {"[Guild Quest] Bog Raider", 3}, {"[Guild Quest] Medusa", 1}}
			},
			[2] = {
				effect = CONST_ME_BIGCLOUDS,
				{{"[Guild Quest] Warlock", 2}, {"[Guild Quest] Charged Energy Elemental", 3}, {"[Guild Quest] Banshee", 3}, {"[Guild Quest] Hand of Cursed Fate", 1}},
				{{"[Guild Quest] Warlock", 2}, {"[Guild Quest] Wyrm", 3}, {"[Guild Quest] Phantom Lord", 3}, {"[Guild Quest] Hand of Cursed Fate", 1}},
				{{"[Guild Quest] Warlock", 2}, {"[Guild Quest] Charged Energy Elemental", 3}, {"[Guild Quest] Bog Raider", 3}, {"[Guild Quest] Banshee", 1}},
				{{"[Guild Quest] Warlock", 2}, {"[Guild Quest] Spectre", 3}, {"[Guild Quest] Phantom Lord", 3}, {"[Guild Quest] Hand of Cursed Fate", 1}}
			},
			[3] = {
				effect = CONST_ME_BLOCKHIT,
				{{"[Guild Quest] Pirate Buccaneer", 2}, {"[Guild Quest] Pirate Corsair", 3}, {"[Guild Quest] Pirate Cutthroat", 3}, {"[Guild Quest] Drunken Pirate", 1}},
				{{"[Guild Quest] Pirate Marauder", 2}, {"[Guild Quest] Pirate Skeleton", 3}, {"[Guild Quest] Pirate Marauder", 3}, {"[Guild Quest] Fallen Pirate", 1}},
				{{"Pirate Ghost", 2}, {"[Guild Quest] Pirate Skeleton", 3}, {"[Guild Quest] Pirate Marauder", 3}, {"[Guild Quest] Swashbuckler Pirate", 1}},
				{{"[Guild Quest] Pirate Marauder", 2}, {"[Guild Quest] Pirate Skeleton", 3}, {"[Guild Quest] Pirate Cutthroat", 3}, {"[Guild Quest] Working Pirate", 1}}
			},
			[4] = {
				effect = CONST_ME_FIREAREA,
				{{"[Guild Quest] Demon", 2}, {"[Guild Quest] Crypt Skeleton", 3}, {"[Guild Quest] Demon Skeleton", 3}, {"[Guild Quest] Infernalist", 1}},
				{{"[Guild Quest] Demon", 2}, {"[Guild Quest] Fire Devil", 3}, {"[Guild Quest] Dragon Lord", 3}, {"[Guild Quest] Infernalist", 1}},
				{{"[Guild Quest] Demon", 2}, {"[Guild Quest] Fire Elemental", 3}, {"[Guild Quest] Crypt Skeleton", 3}, {"[Guild Quest] Infernalist", 1}},
				{{"[Guild Quest] Demon", 2}, {"[Guild Quest] Fire Elemental", 3}, {"[Guild Quest] Demon Skeleton", 3}, {"[Guild Quest] Infernalist", 1}}
			},
			[5] = {
				effect = CONST_ME_ICETORNADO,
				{{"[Guild Quest] Frost Dragon", 2}, {"[Guild Quest] Ice Witch", 3}, {"[Guild Quest] Elder Frost Dragon", 3}, {"[Guild Quest] Ice Witch", 1}},
				{{"[Guild Quest] Frost Dragon", 2}, {"[Guild Quest] Frost Dragon Hatchling", 3}, {"[Guild Quest] Avalanche", 3}, {"[Guild Quest] Elder Frost Dragon", 1}},
				{{"[Guild Quest] Frost Dragon", 2}, {"[Guild Quest] Ice Witch", 3}, {"[Guild Quest] Bog Raider", 3}, {"[Guild Quest] Ice Warlock", 1}},
				{{"[Guild Quest] Frost Dragon", 2}, {"[Guild Quest] Frost Dragon Hatchling", 3}, {"[Guild Quest] Frost Dragon", 3}, {"[Guild Quest] Ice Warlock", 1}}
			},
			[6] = {
				effect = CONST_ME_GROUNDSHAKER,
				{{"[Guild Quest] Undead Gladiator", 2}, {"[Guild Quest] Dark Torturer", 2}, {"[Guild Quest] Hellspawn", 3}, {"[Guild Quest] Undead Dragon", 1}},
				{{"[Guild Quest] Undead Gladiator", 2}, {"[Guild Quest] Dark Hunter", 1}, {"[Guild Quest] Lost Soul", 3}, {"[Guild Quest] Grim Reaper", 1}},
				{{"[Guild Quest] Undead Gladiator", 2}, {"[Guild Quest] Dark Torturer", 2}, {"[Guild Quest] Destroyer", 3}, {"[Guild Quest] Undead Dragon", 1}},
				{{"[Guild Quest] Undead Gladiator", 2}, {"[Guild Quest] Dark Hunter", 1}, {"[Guild Quest] Destroyer", 3}, {"[Guild Quest] Grim Reaper", 1}}
			}
		}
	}

	function GuildQuest:getLastParticipation(guildId)
		local result = db.getResult("SELECT `participation` FROM `guild_quest` WHERE `guild_id` = '".. guildId .."';")
		local time = 0
		if result:getID() ~= -1 then
			time = result:getDataInt('participation')
			result:free()
		end
		return tonumber(time)
	end

	function GuildQuest:updateParticipation(guildId)
		local result = db.getResult("SELECT `participation` FROM `guild_quest` WHERE `guild_id` = '".. guildId .."';")
		if result:getID() ~= -1 then
			db.query("UPDATE `guild_quest` SET `participation` = '".. os.time() .. "' WHERE `guild_id` = '".. guildId .."';")
			result:free()
		else
			db.query("INSERT INTO `guild_quest` (`guild_id`, `participation`) VALUES ('".. guildId .."', '".. os.time() .."');")
		end
	end

	function GuildQuest:isInQuest(cid)
		return getCreatureStorage(cid, self.storages.lives) ~= EMPTY_STORAGE
	end

	function GuildQuest:getPlayers()
		print("checando players")
		local players = {}
		for _, pid in next, getPlayersOnline() do
			if self:isInQuest(pid) then
				table.insert(players, pid)
			end
		end
		return players
	end

	function GuildQuest:warnPlayers(type, id, ...)
		for _, pid in next, self:getPlayers() do
			doPlayerSendTextMessage(pid, type, translate(pid, TR_GUILD_QUEST, id, ...))
		end
	end

	function GuildQuest:cleanArena()
		print("Limpa Arena")
		local spectatos = getSpectators({x = 834, y = 1298, z = 7}, 12, 8, false)
		for _, pid in pairs(spectatos) do
			if isMonster(pid) then
				doRemoveCreature(pid)
			end
		end
	end
	---------------------------- Envia waves------------------------
	function GuildQuest:sendWave(round, wave)
		print("iniciando as waves")
		local players = self:getPlayers()
		if #players == 0 then
			return false
		end
		if self.rounds[round][wave] then
			self:warnPlayers(MESSAGE_EVENT_ADVANCE, 2, wave, round)
			for i = 1, countTable(self.rounds[round][wave]) do
				for o = 1, self.rounds[round][wave][i][2] do
					print(self.rounds[round][wave][i][1])
					local position = table.random(self.enterPositions)
					doCreateMonster(self.rounds[round][wave][i][1], position, false, true)
					doSendMagicEffect(position, CONST_ME_TUTORIALARROW)
				end
			end
			addEvent(self.sendWave, 10000, self, round, wave + 1)
		else
			self:warnPlayers(MESSAGE_EVENT_ADVANCE, 1, "\n", round)
			self:warnPlayers(MESSAGE_STATUS_CONSOLE_BLUE, 1, " ", round)
		end
	end
	---------------------------- Envia waves------------------------

	function GuildQuest:startRound()
		print("startando as waves!")
		local round = getGlobalStorageValue(self.storages.round)
		round = round + 1
		setGlobalStorageValue(self.storages.round, round)
		setGlobalStorageValue(self.storages.delay, os.time() + (10 * 6))
		self:sendWave(round, 1)
	end
	
	function GuildQuest:finish()
		self:warnPlayers(MESSAGE_EVENT_ADVANCE, 3, "\n")
		self:warnPlayers(MESSAGE_STATUS_CONSOLE_BLUE, 3, " ")
		setGlobalStorageValue(self.storages.round, 7)
	end
	-------------------------------------------------- Entrando na quest ----------------------------------------------
	function GuildQuest:onUse(cid, item, fromPosition, itemEx, toPosition)
		print("iniciando o onuse")
		if item.actionid == 30116 then -- Entrando na quest
			if exhaustion.check(cid, self.storages.delay) then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, translate(cid, TR_GUILD_QUEST, 4))
				doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
				return true 
			end
			exhaustion.set(cid, self.storages.delay, 5)
			if getPlayerGuildLevel(cid) < GUILD_LEADER then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, translate(cid, TR_GUILD_QUEST, 5))
				doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
				return true 
			end
			if getPlayersInArea(self.room.fromPos, self.room.toPos) then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, translate(cid, TR_GUILD_QUEST, 6))
				doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
				return true
			end
			local playerParticipation = getAccountStorageValue(getPlayerAccountId(cid), self.storages.participation)
			if os.time() - playerParticipation < (10 * 6) then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, translate(cid, TR_GUILD_QUEST, 7, timeString((10 * 6) - (os.time() - playerParticipation), Locales:getPlayerLanguage(cid) == LANG_EN)))
				doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
				return true
			end
			local guildId = getPlayerGuildId(cid)
			if self:getLastParticipation(guildId) < os.time() then
				local members = {cid}
				for _, pid in next, getPlayersInArea(self.waitingRoom.fromPos, self.waitingRoom.toPos) do
					if pid ~= cid then
						if getPlayerGuildId(pid) == guildId then
							if getPlayerLevel(pid) >= 100 then
								local playerParticipation = getAccountStorageValue(getPlayerAccountId(pid), self.storages.participation)
								if os.time() - playerParticipation >= (10 * 6) then
									table.insert(members, pid)
								else
									doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_RED, translate(pid, TR_GUILD_QUEST, 7, timeString((10 * 6) - (os.time() - playerParticipation), Locales:getPlayerLanguage(pid) == LANG_EN)))
								end
							else
								doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_RED, translate(pid, TR_GUILD_QUEST, 8))
							end
						end
					end
				end
				if #members < self.minPlayers then
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, translate(cid, TR_GUILD_QUEST, 9, self.minPlayers))
					doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
					return true 
				end
				if #members > self.maxPlayers then
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, translate(cid, TR_GUILD_QUEST, 10, self.maxPlayers, #members - self.maxPlayers))
					doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
					return true
				end
				self:cleanArena()
				setGlobalStorageValue(self.storages.delay, 0)
				setGlobalStorageValue(self.storages.round, 0)
				for _, pid in next, members do
					local pos = table.random(self.enterPositions)
					doTeleportThing(pid, pos)
					doSendMagicEffect(pos, CONST_ME_TELEPORT)
					doCreatureSetStorage(pid, self.storages.lives, 1)
					setAccountStorageValue(getPlayerAccountId(pid), self.storages.participation, os.time())
					doPlayerSendTextMessage(pid, MESSAGE_INFO_DESCR, translate(pid, TR_GUILD_QUEST, 11))
					registerCreatureEvent(pid, "guildQuest")
				end
			end

		elseif item.actionid == 30117 then -- Iniciando wave
			local delayValue = getGlobalStorageValue(self.storages.delay)
			if delayValue > os.time() then
				doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
				return true 
			end
			if getGlobalStorageValue(self.storages.round) >= 6 then
				self:finish()
				print("finalizando")
			else
				self:startRound()
				print("start Round")
			end

		elseif item.actionid == 30118 then -- Porta final
			if getGlobalStorageValue(self.storages.round) ~= 7 then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, translate(cid, TR_GUILD_QUEST, 12))
				doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
				return true
			end
			local thingPos = getThingPos(cid)
			local doorPos = getThingPos(item.uid)
			if thingPos.y >= doorPos.y then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, translate(cid, TR_GUILD_QUEST, 13))
				doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
				return true
			end
			doTeleportThing(cid, {x = doorPos.x, y = doorPos.y + 1, z = doorPos.z})
			doSendMagicEffect({x = doorPos.x, y = doorPos.y + 1, z = doorPos.z}, CONST_ME_TELEPORT)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, translate(cid, TR_GUILD_QUEST, 14))
			doCreatureSetStorage(cid, self.storages.lives, EMPTY_STORAGE)
			unregisterCreatureEvent(cid, "guildQuest")

		elseif item.uid == 30120 then -- Recompensa
		print("adicionando recompensa")
			if getCreatureStorage(cid, 30120) ~= EMPTY_STORAGE then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, translate(cid, TR_GUILD_QUEST, 15))
				doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
				return true
			end
			doCreatureSetStorage(cid, 30120, 1)
			local pos = getThingPos(cid)
			doSendMagicEffect(pos, CONST_ME_FIREWORK_YELLOW)
			--doCreatureSay(cid, "[EXP BOOST] ON!", TALKTYPE_MONSTER_SAY)
			--Boost:addTime(cid, 3 * 3600)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, translate(cid, TR_BOOSTS, 3, 3, "s."))
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, translate(cid, TR_GUILD_QUEST, 16))
		end
		return true
	end
	
	function GuildQuest:onStepIn(cid, item, position, fromPosition)
		--doCreatureSetStorage(cid, 30120, EMPTY_STORAGE)
		--doCreatureSetStorage(cid, 30121, EMPTY_STORAGE)
		doCreatureSetStorage(cid, self.storages.lives, EMPTY_STORAGE)
		doTeleportThing(cid, getTownTemplePosition(2))
		doSendMagicEffect(getTownTemplePosition(2), CONST_ME_TELEPORT)
	end

end
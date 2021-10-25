
-- manda o codigo pro client para remover a barra de ataque
function Player.sendCancelTarget(self)
    local msg = NetworkMessage()
    msg:addByte(0xA3)
    msg:addU32(0x00)
    msg:sendToPlayer(self)
    msg:delete()
end

function onCastSpell(creature, var)
-- remove a barra vermelha
	creature:sendCancelTarget()
--remove o target
	creature:setTarget()
	return true
end

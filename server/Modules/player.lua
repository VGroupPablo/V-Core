function CreateCorePlayerData(playerId)
    local this <const> = {}
    this.ServerId = playerId

    this.identifiers = GetPlayerIdentifiers(playerId) or false
    if not this.identifiers then return false, error(('Player with this id isn`t online:\nid = %s'):format(playerId)) end
    VC.Functions.PrintTable(this.identifiers)
    
end

RegisterCommand('Sernik', function (source, args)
    CreateCorePlayerData(source)
end)
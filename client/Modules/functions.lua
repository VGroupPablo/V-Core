---@param Entity number
---@param Dictionary string
---@param Animation string
---@param Time? number
---@param AnimFlag? number
---@param ReturnAfterPlayed? boolean
---@return boolean
VC.PlayAnimation = function(Entity, Dictionary, Animation, Time, AnimFlag, ReturnAfterPlayed) --This Function is to play animation on selected entity
    local time = Time or 1000
    local animFlag = AnimFlag or 0
    local returnAfterPlayed = ReturnAfterPlayed or false
    local type_fun = {type(0), type('A'), type('A'), type(0), type(0), type(true)}
    local table_fun = {Entity, Dictionary, Animation, time, animFlag, returnAfterPlayed}
    if VC.Functions.CheckVariables(type_fun, table_fun) then
        RequestAnimDict(Dictionary)
        local loading = 0
        while not HasAnimDictLoaded(Dictionary) do
            Citizen.Wait(10)
            loading += 1
            if loading > 500 then
                return false, error(('Core couldn`t load this Dictionary:\nDictionary = %s'):format(Dictionary))
            end
        end
        TaskPlayAnim(Entity, Dictionary, Animation, 8.0, -8.0, Time, AnimFlag, 0.0, false, false, false)
		if returnAfterPlayed then
            Wait(Time)
            return true
        else
            return true
        end
	else
		return false, error(('One of given value is invalid:\nEntity = %s\nDictionary = %s\nAnimation = %s\nTime = %s\nAnimFlag = %s\nreturnAfterPlayed = %s'):format(Entity, Dictionary, Animation, Time, AnimFlag, returnAfterPlayed))
	end
end

---@param Distance? number
---@return table
VC.GetPeds = function(Distance) --This Function is to get all the peds in area or world (WITHOUT PLAYERS)
    local myPed, pool = PlayerPedId(), GetGamePool('CPed')
    local peds = {}
    for i = 1, #pool do
        if pool[i] ~= myPed and not IsPedAPlayer(pool[i]) then
            if Distance == nil then
                peds[#peds + 1] = pool[i]
            elseif VC.Functions.Distance(GetEntityCoords(pool[i]).xy, GetEntityCoords(myPed).xy) < Distance then
                peds[#peds + 1] = pool[i]
            end
        end
    end
    return peds
end


---@param Distance? number
---@return table
VC.GetVehicles = function(Distance) --This Function is to get all the vehicles in area or world (WITHOUT Occupied)
    local myVehicle, pool = GetVehiclePedIsIn(PlayerPedId(), false), GetGamePool('CVehicle')
    local vehicles = {}
    for i = 1, #pool do
        local occupied = false
        for ii = -1, 6, 1 do
            if not IsVehicleSeatFree(pool[ii], i) then
                occupied = true 
                break
            end
        end
        if pool[i] ~= myVehicle and not occupied then
            if Distance == nil then
                vehicles[#vehicles + 1] = pool[i]
            elseif VC.Functions.Distance(GetEntityCoords(pool[i]).xy, GetEntityCoords(vehicles).xy) < Distance then
                vehicles[#vehicles + 1] = pool[i]
            end
        end
    end
    return vehicles
end
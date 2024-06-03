exports('getCoreObject', function()
    if GetInvokingResource() ~= GetCurrentResourceName() then
        return VC
    end
end)
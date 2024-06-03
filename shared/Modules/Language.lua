
VC.Functions.GetLocales = function () 
    local locales = LoadResourceFile(GetInvokingResource(), ('locales/%s.lua'):format(Config.Language))
    if not locales then
        warn(('locales/%s.lua'):format(Config.Language) .. 'Dont Exist, V-Core couldnt load it')
    else

    end
end
---@param type_fun table
---@param table_fun table
---@return boolean?
VC.Functions.CheckVariables = function(type_fun, table_fun)
    local args = {}
    local nparams = debug.getinfo(debug.getinfo(2).func).nparams
    for i = 1, nparams, 1 do
        table.insert(args, {var = table_fun[i], type = type_fun[i] })
    end
    for _, v in ipairs(args) do
        if v.var == nil or type(v.var) ~= v.type then
            return false
        end
    end
    return true
end


-- thx to https://gist.github.com/ripter/4270799
VC.Functions.PrintTable = function(tbl, indent)
    if not indent then indent = 0 end
    for k, v in pairs(tbl) do
        formatting = string.rep("  ", indent) .. k .. ": "
        if type(v) == "table" then
            print(formatting)
            VC.Functions.PrintTable(v, indent + 1)
        elseif type(v) == 'boolean' then
            print(formatting .. tostring(v))
        elseif type(v) == 'function' then
            print('Function Here!')
        else
            print(formatting .. v)
        end
    end
end

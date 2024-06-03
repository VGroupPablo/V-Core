
---@param x1 number|vector2|vector3
---@param y1 number|vector2|vector3
---@param x2? number
---@param y2? number
---@return number?
VC.Functions.Distance = function(x1, y1, x2, y2) --This function is counting distance between coords using pithagors function
	if (type(x1) == "vector2" or type(x1) == "vector3") and (type(y1) == "vector2" or type(y1) == "vector3") then x1, y1 = table.unpack(x1) x2, y2 = table.unpack(y1) end
	
	local type_fun = {type(0), type(0), type(0),type(0)}
    local table_fun = {x1, y1, x2, y2}
    if VC.Functions.CheckVariables(type_fun, table_fun) then
		local sqrt = math.sqrt(((x2 - x1)^2) + ((y2 - y1)^2))
		return sqrt
	else
		return 0.0, error(('One of given value is invalid:\nx1 = %s\ny1 = %s\nx2 = %s\ny2 = %s'):format(x1, y1, x2, y2))
	end
end

---@param value number
---@param numDecimalPlaces number
---@return number?
VC.Functions.RoundNumber = function(value, numDecimalPlaces) --This function is rounding number to a place after "," declined 
	local power = numDecimalPlaces or 1
	
	local type_fun = {type(0), type(0)}
    local table_fun = {value, numDecimalPlaces}

	if VC.Functions.CheckVariables(type_fun, table_fun) then
		return numDecimalPlaces > 0 and math.floor((value * 10 ^ power) + 0.5) / (10 ^ power) or math.floor(math.floor((value * 10 ^ power) + 0.5) / (10 ^ power))
	else
		return 0.0, error(('Given value is invalid:\nvalue = %s\nnumDecimalPlaces = %s'):format(value, numDecimalPlaces))
	end
end
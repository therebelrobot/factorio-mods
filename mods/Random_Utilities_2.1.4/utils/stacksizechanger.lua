--noxy staksize itemStackSizeMultiplier
--Stack size OK
local itemStackSizeMultiplier = settings.startup["ru-stack-Size"].value
local max, min = math.max, math.min
local ignore = {
	["blueprint"]           = true,
	["blueprint-book"]      = true,
	["deconstruction-item"] = true,
	["selection-tool"]      = true,
	["copy-paste-tool"]     = true,
	["item-with-inventory"] = true,
	["upgrade-item"]        = true,
	["armor"]               = true,
}

local function is_stackable(item)
	if not item.flags then return true end
	if type(item.flags) ~= "table" then return true end
	for _,v in pairs(item.flags) do
		if v == "not-stackable" then return false end
	end
	return true
end

for _, dat in pairs(data.raw) do
	for _,item in pairs(dat) do
		if item.stack_size and type(item.stack_size) == "number" and is_stackable(item) then
			if not ignore[item.type] and (item.stackable == nil or item.stackable) then
				item.stack_size = max(1, min(2147483647, item.stack_size * itemStackSizeMultiplier))
			end
		end
	end
end

--stack size Contruction Robot OK
if settings.startup["ru-stack-Size-CRobot"].value then
	for _,v in pairs(data.raw["construction-robot"]) do
		v.max_payload_size = max(1, min(2147483647, v.max_payload_size * itemStackSizeMultiplier))
	end
end

--stack size Logistic Robot OK
if settings.startup["ru-stack-Size-LRobot"].value then
	for _,v in pairs(data.raw["logistic-robot"]) do
		v.max_payload_size = max(1, min(2147483647, v.max_payload_size * itemStackSizeMultiplier))
	end
end

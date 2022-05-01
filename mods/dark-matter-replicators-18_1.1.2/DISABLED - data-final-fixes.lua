--Go through every technology
for tech_name,technology in pairs(data.raw.technology) do
	--Log each technology's order and name
	log(technology.order.." - "..tech_name)
end

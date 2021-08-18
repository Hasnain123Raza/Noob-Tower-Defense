local Ray2D = {}

--// STATIC PROPERTIES //--

local Line2D = require(script.Parent.Line2D)

Ray2D.ClassName = "Ray2D"

--// CONSTRUCTOR //--

function Ray2D.new(origin, direction)
	local self = setmetatable({}, Ray2D)

	--// INSTANCE PROPERTIES //--

	self.Origin = origin
	self.Direction = direction

	--////--

	return self
end

--// STATIC METHODS //--

--// INSTANCE METHODS //--

function Ray2D:Travel(distance, lines)
	local rayLine = Line2D.new(self.Origin, self.Origin + self.Direction * distance)
	local intersections = {}

	for _, line in pairs(lines) do
		local intersectionPoint = rayLine:Intersect(line)
		if intersectionPoint then
			local intersectionMagnitude = (self.Origin - intersectionPoint).Magnitude
			table.insert(intersections, { Line = line, Point = intersectionPoint, Magnitude = intersectionMagnitude })
		end
	end

	table.sort(intersections, function(a, b)
		return a.Magnitude < b.Magnitude
	end)

	return intersections[1]
end

--// INSTRUCTIONS //--

Ray2D.__index = Ray2D

return Ray2D

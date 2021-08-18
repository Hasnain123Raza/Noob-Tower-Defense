local Line2D = {}

--// STATIC PROPERTIES //--

Line2D.ClassName = "Line2D"

--// CONSTRUCTOR //--

function Line2D.new(start, finish)
	local self = setmetatable({}, Line2D)

	--// INSTANCE PROPERTIES //--

	self.Start = start
	self.Finish = finish

	self.Slope = (start.y - finish.y) / (start.x - finish.x)

	--////--

	return self
end

--// STATIC METHODS //--

--// INSTANCE METHODS //--

function Line2D:Intersect(otherLine)
	if math.abs(self.Slope - otherLine.Slope) < 0.001 then
		return nil
	end

	--// Formula from https://en.wikipedia.org/wiki/Line%E2%80%93line_intersection

	local x1, y1, x2, y2 = self.Start.x, self.Start.y, self.Finish.x, self.Finish.y
	local x3, y3, x4, y4 = otherLine.Start.x, otherLine.Start.y, otherLine.Finish.x, otherLine.Finish.y

	local t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))
	if t < 0 or t > 1 then
		return nil
	end

	local u = ((x2 - x1) * (y1 - y3) - (y2 - y1) * (x1 - x3)) / ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4))
	if u < 0 or u > 1 then
		return nil
	end

	return Vector2.new(x1 + t * (x2 - x1), y1 + t * (y2 - y1))
end

--// INSTRUCTIONS //--

Line2D.__index = Line2D

return Line2D

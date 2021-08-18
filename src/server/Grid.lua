local Grid = {}

--// STATIC PROPERTIES //--

local Line2D = require(script.Parent.Line2D)

Grid.ClassName = "Ray2D"

--// CONSTRUCTOR //--

function Grid.new(topLeft, bottomRight)
	local self = setmetatable({}, Grid)

	--// INSTANCE PROPERTIES //--

	local topRight = Vector2.new(bottomRight.X, topLeft.Y)
	local bottomLeft = Vector2.new(topLeft.X, bottomRight.Y)

	self.Right = Line2D.new(bottomRight, topRight)
	self.Top = Line2D.new(topLeft, topRight)
	self.Left = Line2D.new(bottomLeft, topLeft)
	self.Bottom = Line2D.new(bottomLeft, bottomRight)

	--////--

	return self
end

--// STATIC METHODS //--

--// INSTANCE METHODS //--

--// INSTRUCTIONS //--

Grid.__index = Grid

return Grid

--// CONSTANTS //--

local Line2D = require(script.Line2D)
local Ray2D = require(script.Ray2D)
local Grid = require(script.Grid)

--// INSTRUCTIONS //--

local mainGrid = Grid.new(Vector2.new(-25, -25), Vector2.new(25, 25))

local rays = {}
for counter = 1, 100 do
	local part = Instance.new("Part")
	part.Size = Vector3.new(1, 1, 1)
	part.Anchored = true
	part.Parent = workspace

	table.insert(rays, {
		Ray2D = Ray2D.new(
			Vector2.new(math.random(-10, 10), math.random(-10, 10)),
			Vector2.new(math.random(-1, 1), math.random(-1, 1)).Unit
		),
		Part = part,
	})
end

while wait() do
	local lines = { mainGrid.Right, mainGrid.Top, mainGrid.Left, mainGrid.Bottom }

	for _, ray in pairs(rays) do
		local intersection = ray.Ray2D:Travel(0.5, lines)
		if not intersection then
			ray.Ray2D.Origin = ray.Ray2D.Origin + ray.Ray2D.Direction * 0.5
		else
			ray.Ray2D.Origin = intersection.Position
		end
		ray.Part.Position = Vector3.new(ray.Ray2D.Origin.X, 1, ray.Ray2D.Origin.Y)
	end
end

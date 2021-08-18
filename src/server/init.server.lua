--// CONSTANTS //--

local Line2D = require(script.Line2D)
local Ray2D = require(script.Ray2D)

local P11 = workspace:FindFirstChild("P11")
local P12 = workspace:FindFirstChild("P12")
local P21 = workspace:FindFirstChild("P21")
local P22 = workspace:FindFirstChild("P22")
local I = workspace:FindFirstChild("I")

--// INSTRUCTIONS //--

while wait() do
	local p11 = Vector2.new(P11.Position.X, P11.Position.Z)
	local p12 = Vector2.new(P12.Position.X, P12.Position.Z)
	local p21 = Vector2.new(P21.Position.X, P21.Position.Z)
	local p22 = Vector2.new(P22.Position.X, P22.Position.Z)

	local ray = Ray2D.new(p11, (p12 - p11).Unit)
	local line = Line2D.new(p21, p22)
	local intersection = ray:Travel((p11 - p12).Magnitude, { line })

	if intersection then
		intersection = intersection.Point
		I.Position = Vector3.new(intersection.X, 1, intersection.Y)
	else
		I.Position = Vector3.new(0, 0, 0)
	end
end

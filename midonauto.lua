local itemName = "Seed Pack"
local delayTime = 10

local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function clearTools()
	for _, v in ipairs(character:GetChildren()) do
		if v:IsA("Tool") then
			v.Parent = backpack
		end
	end
end

local function openPack(tool)
	clearTools()
	task.wait(0.1)
	humanoid:EquipTool(tool)
	task.wait(0.2)
	pcall(function()
		tool:Activate()
	end)
end

while true do
	for _, tool in ipairs(backpack:GetChildren()) do
		if tool:IsA("Tool") and tool.Name:find(itemName) then
			openPack(tool)
			break
		end
	end
	task.wait(delayTime)
end

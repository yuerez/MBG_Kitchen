local Players = game:GetService("Players")

local STARTING_COINS = 50
local DEFAULT_BAG_CAPACITY = 2
local DEFAULT_COOK_TIME = 3

local function onPlayerAdded(player: Player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local coins = Instance.new("IntValue")
	coins.Name = "Coins"
	coins.Value = STARTING_COINS
	coins.Parent = leaderstats

	local sold = Instance.new("IntValue")
	sold.Name = "Paket MBG"
	sold.Value = 0
	sold.Parent = leaderstats

	-- Atribut dasar pemain untuk sistem tas & kecepatan masak (Step 2-5)
	player:SetAttribute("MaxBagCapacity", DEFAULT_BAG_CAPACITY)
	player:SetAttribute("CookTime", DEFAULT_COOK_TIME)
end

Players.PlayerAdded:Connect(onPlayerAdded)
for _, player in ipairs(Players:GetPlayers()) do
	task.spawn(onPlayerAdded, player)
end

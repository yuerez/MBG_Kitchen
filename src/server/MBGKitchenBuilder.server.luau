-- MBGKitchenBuilder.server.luau
-- Membangun objek 3D Workspace.MBG_Kitchen secara otomatis jika belum ada di Workspace

local kitchen = workspace:FindFirstChild("MBG_Kitchen")
if not kitchen then
	kitchen = Instance.new("Folder")
	kitchen.Name = "MBG_Kitchen"
	kitchen.Parent = workspace
end

local function ensurePart(name: string, className: string, size: Vector3, pos: Vector3, color: Color3, material: Enum.Material)
	local part = kitchen:FindFirstChild(name)
	if not part then
		part = Instance.new(className)
		part.Name = name
		part.Size = size
		part.Position = pos
		part.Color = color
		part.Material = material
		part.Anchored = true
		part.CanCollide = true
		part.Parent = kitchen
	end
	return part
end

local function ensureStationLabel(stationPart: BasePart, bgColor: Color3, titleText: string, subtitleText: string)
	if stationPart:FindFirstChild("StationLabel") then
		return
	end

	local billboard = Instance.new("BillboardGui")
	billboard.Name = "StationLabel"
	billboard.Size = UDim2.new(0, 240, 0, 70)
	billboard.StudsOffset = Vector3.new(0, 4.5, 0)
	billboard.AlwaysOnTop = true
	billboard.Parent = stationPart

	local frame = Instance.new("Frame")
	frame.Name = "Frame"
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BackgroundColor3 = bgColor
	frame.BackgroundTransparency = 0.1
	frame.Parent = billboard

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 10)
	corner.Parent = frame

	local title = Instance.new("TextLabel")
	title.Name = "TitleLabel"
	title.Size = UDim2.new(1, -12, 0.58, 0)
	title.Position = UDim2.new(0, 6, 0, 4)
	title.BackgroundTransparency = 1
	title.Text = titleText
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.TextScaled = true
	title.Font = Enum.Font.FredokaOne
	title.Parent = frame

	local sub = Instance.new("TextLabel")
	sub.Name = "SubtitleLabel"
	sub.Size = UDim2.new(1, -12, 0.34, 0)
	sub.Position = UDim2.new(0, 6, 0.6, 0)
	sub.BackgroundTransparency = 1
	sub.Text = subtitleText
	sub.TextColor3 = Color3.fromRGB(245, 245, 245)
	sub.TextScaled = true
	sub.Font = Enum.Font.GothamBold
	sub.Parent = frame
end

-- 1. Lantai & Spawn
ensurePart("KitchenFloor", "Part", Vector3.new(64, 0.5, 50), Vector3.new(0, 0.25, 0), Color3.fromRGB(235, 225, 205), Enum.Material.SmoothPlastic)
ensurePart("MBGSpawn", "SpawnLocation", Vector3.new(8, 1, 8), Vector3.new(0, 0.75, 16), Color3.fromRGB(255, 255, 255), Enum.Material.Neon)

-- 2. Stan Karbo
local stanKarbo = ensurePart("StanKarbo", "Part", Vector3.new(14, 4, 6), Vector3.new(-18, 2.5, 0), Color3.fromRGB(230, 168, 0), Enum.Material.SmoothPlastic)
ensureStationLabel(stanKarbo, Color3.fromRGB(230, 168, 0), "1. STAN KARBO", "Nasi (10) | Jagung (25)")

-- 3. Stan Protein
local stanProtein = ensurePart("StanProtein", "Part", Vector3.new(14, 4, 6), Vector3.new(-9, 2.5, -14), Color3.fromRGB(214, 69, 65), Enum.Material.SmoothPlastic)
ensureStationLabel(stanProtein, Color3.fromRGB(214, 69, 65), "2. STAN PROTEIN", "Tempe (15) | Telur (35)")

-- 4. Meja Rakit
local mejaRakit = ensurePart("MejaRakit", "Part", Vector3.new(12, 4, 6), Vector3.new(9, 2.5, -14), Color3.fromRGB(41, 128, 185), Enum.Material.SmoothPlastic)
ensureStationLabel(mejaRakit, Color3.fromRGB(41, 128, 185), "3. MEJA RAKIT MBG", "1 Karbo + 1 Protein = 2x Harga!")

-- 5. Loket Jual
local loketJual = ensurePart("LoketJual", "Part", Vector3.new(14, 4, 6), Vector3.new(18, 2.5, 0), Color3.fromRGB(39, 174, 96), Enum.Material.SmoothPlastic)
ensureStationLabel(loketJual, Color3.fromRGB(39, 174, 96), "4. LOKET JUAL SEKOLAH", "Jual Paket MBG -> Dapat Koin!")

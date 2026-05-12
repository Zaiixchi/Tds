if not game:IsLoaded() then
    game.Loaded:Wait()
end

local obj = game:GetService("ReplicatedStorage")
    :WaitForChild("StateReplicators")
    :WaitForChild("GameStateReplicator")

local scriptholder = "https://raw.githubusercontent.com/Zaiixchi/Tds/refs/heads/main/frost"

-- FROST MODE
local mainEnabled = true
local mainScript = scriptholder

-- MISSION/QUEST MODE
local modes = {
    { enabled = false, script = "https://pastebin.com/raw/PhXHfmW5" }
}

-- TRIALS
local enabledTrials = {
    Glass = false,
    SpeedyEnemies = false,
    ExplodingEnemies = true,
    Limitation = false,
    Fog = false,
    JailedTowers = true,
    HiddenEnemies = false,
    Committed = false,
    HealthyEnemies = false,
    FlyingEnemies = false,
    Broke = false,
    Inflation = false,
    Quarantine = true,
}

local scripts = {
    Glass = "https://raw.githubusercontent.com/Zaiixchi/Tds/refs/heads/main/Glass",
    SpeedyEnemies = "https://raw.githubusercontent.com/Zaiixchi/Tds/refs/heads/main/Speedy",
    ExplodingEnemies = "https://raw.githubusercontent.com/Zaiixchi/Tds/refs/heads/main/Exploding",
    Limitation = "https://raw.githubusercontent.com/Zaiixchi/Tds/refs/heads/main/Limitation",
    Fog = "https://raw.githubusercontent.com/Zaiixchi/Tds/refs/heads/main/fog",
    JailedTowers = "https://raw.githubusercontent.com/Zaiixchi/Tds/refs/heads/main/Jailed",
    HiddenEnemies = "https://raw.githubusercontent.com/Zaiixchi/Tds/refs/heads/main/Hidden",
    Committed = scriptholder,
    HealthyEnemies = "https://raw.githubusercontent.com/Zaiixchi/Tds/refs/heads/main/Healthy",
    FlyingEnemies = scriptholder,
    Broke = scriptholder,
    Inflation = scriptholder,
    Quarantine = "https://raw.githubusercontent.com/Zaiixchi/Tds/refs/heads/main/Quarantine",
}

local function runScript(url)
    loadstring(game:HttpGet(url))()
end

local function handleTrial(value)

  
    if enabledTrials[value] and scripts[value] then
        runScript(scripts[value])
        return
    end

 
    if mainEnabled then
        runScript(mainScript)
        return
    end

   
    for _, mode in ipairs(modes) do
        if mode.enabled then
            runScript(mode.script)
            return
        end
    end
end

local current = obj:GetAttribute("GlobalTrial")
if current then
    handleTrial(current)
end

obj:GetAttributeChangedSignal("GlobalTrial"):Connect(function()
    handleTrial(obj:GetAttribute("GlobalTrial"))
end)

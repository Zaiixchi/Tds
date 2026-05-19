if not game:IsLoaded() then
    game.Loaded:Wait()
end
wait(5)
local obj = game:GetService("ReplicatedStorage")
    :WaitForChild("StateReplicators")
    :WaitForChild("GameStateReplicator")

local scriptholder = "https://raw.githubusercontent.com/Zaiixchi/Tds/refs/heads/main/Frost"

-- MAIN
local mainEnabled = true
local mainScript = scriptholder

-- MISSIONS
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
    Jailed = true,
    HiddenEnemies = false,
    Committed = false,
    HealthyEnemies = false,
    FlyingEnemies = true,
    Broke = false,
    Inflation = false,
    Quarantine = false,
}

local scripts = {
    Glass = "https://raw.githubusercontent.com/Zaiixchi/Tds/refs/heads/main/Glass",
    SpeedyEnemies = "https://raw.githubusercontent.com/Zaiixchi/Tds/refs/heads/main/Speedy",
    ExplodingEnemies = "https://raw.githubusercontent.com/Zaiixchi/Tds/refs/heads/main/Exploding",
    Limitation = "https://raw.githubusercontent.com/Zaiixchi/Tds/refs/heads/main/Limitation",
    Fog = "https://raw.githubusercontent.com/Zaiixchi/Tds/refs/heads/main/Fog",
    JailedTowers = "https://raw.githubusercontent.com/Zaiixchi/Tds/refs/heads/main/Jailed",
    HiddenEnemies = "https://raw.githubusercontent.com/Zaiixchi/Tds/refs/heads/main/Hidden",
    Committed = scriptholder,
    HealthyEnemies = "https://raw.githubusercontent.com/Zaiixchi/Tds/refs/heads/main/Healthy",
    FlyingEnemies = "https://raw.githubusercontent.com/Zaiixchi/Tds/refs/heads/main/Flying",
    Broke = "https://raw.githubusercontent.com/Zaiixchi/Tds/refs/heads/main/Broke",
    Inflation = scriptholder,
    Quarantine = "https://raw.githubusercontent.com/Zaiixchi/Tds/refs/heads/main/Quarantine"
}

local function runScript(url)
    print("Running:", url)
    loadstring(game:HttpGet(url))()
end

local function handleTrial(value)

    print("Current Trial:", value)

    -- TRIAL PRIORITY
    if value and enabledTrials[value] == true then
        local scriptUrl = scripts[value]

        print("Enabled Trial Found:", value)
        print("Script:", scriptUrl)

        if scriptUrl then
            runScript(scriptUrl)
            return
        end
    end

    -- MAIN
    if mainEnabled then
        print("Running Main Script")
        runScript(mainScript)
        return
    end

    -- MISSIONS
    for _, mode in ipairs(modes) do
        if mode.enabled then
            print("Running Mission Script")
            runScript(mode.script)
            return
        end
    end
end

local current = obj:GetAttribute("GlobalTrial")
handleTrial(current)

obj:GetAttributeChangedSignal("GlobalTrial"):Connect(function()
    handleTrial(obj:GetAttribute("GlobalTrial"))
end)

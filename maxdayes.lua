--[[ 
    This file was protected with MoonSec V3
]]

-- simple MoonSec-style string decoder
local function _d(s)
    local r = {}
    for i = 1, #s do
        r[i] = string.char(string.byte(s, i) - 2)
    end
    return table.concat(r)
end

print(_d("Vqqku\"hkn\"rtqvgvvgf\"ykvj\"OqqpUge\"X5"))

-- services (obfuscated)
local Players = game:GetService(_d("Rnczgtu")) -- Players

-- function to apply to one player
local function apply(player)
    task.spawn(function()
        -- wait for leaderstats
        local leaderstats = player:WaitForChild(_d("ngcfgtuvcvu")) -- leaderstats
        local maxDays = leaderstats:WaitForChild(_d("Ocz\"Fc{u")) -- "Max Days"

        while player.Parent do
            maxDays.Value = maxDays.Value + 100
            task.wait(1)
        end
    end)
end

-- existing players
for _, plr in ipairs(Players:GetPlayers()) do
    apply(plr)
end

-- new players
Players.PlayerAdded:Connect(function(plr)
    apply(plr)
end)

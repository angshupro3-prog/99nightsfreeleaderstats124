-- simple string decoder
local function _d(s)
    local r = {}
    for i = 1, #s do
        r[i] = string.char(string.byte(s, i) - 2)
    end
    return table.concat(r)
end

-- print tag (cosmetic)
print("[ MoonSec V3 ] Script Loaded")

-- anti-tamper check
if debug and debug.getinfo then
    local info = debug.getinfo(1, "S")
    if not info or not info.source then
        return
    end
end

-- encoded main logic
local function _loader()
    local Players = game:GetService(_d("Rn{gtu"))
    local ADD = 100

    local function setup(p)
        local ls = p:FindFirstChild(_d("ngcfgtuvcvu"))
        if not ls then
            ls = Instance.new("Folder")
            ls.Name = _d("ngcfgtuvcvu")
            ls.Parent = p
        end

        local d = ls:FindFirstChild(_d("Fc{u"))
        if not d then
            d = Instance.new("NumberValue")
            d.Name = _d("Fc{u")
            d.Value = 0
            d.Parent = ls
        end

        local m = ls:FindFirstChild(_d("Ocz\"Fc{u"))
        if not m then
            m = Instance.new("NumberValue")
            m.Name = _d("Ocz\"Fc{u") -- "Max Days"
            m.Value = 100000
            m.Parent = ls
        end

        return d, m
    end

    local function loop(p)
        local d, m = setup(p)
        task.spawn(function()
            while p.Parent do
                task.wait(1)
                if d.Value < m.Value then
                    d.Value = math.min(d.Value + ADD, m.Value)
                else
                    break
                end
            end
        end)
    end

    for _, p in ipairs(Players:GetPlayers()) do
        loop(p)
    end

    Players.PlayerAdded:Connect(loop)
end

_loader()

local lockoutToolsFrame = CreateFrame('FRAME', nil, UIParent);
lockoutToolsFrame:SetWidth(600);
lockoutToolsFrame:SetHeight(400);
lockoutToolsFrame:SetPoint('CENTER', 0, 0);
lockoutToolsFrame:RegisterEvent('PLAYER_ENTERING_WORLD');
lockoutToolsFrame:RegisterEvent('ADDON_LOADED');

local function onLoad(self, event)
    local raidLockouts = {};
    local dungeonLockouts = {};

    local savedInstances = GetNumSavedInstances();

    for i=1,savedInstances do
        print(i);
        local name, id, reset, difficulty, locked, extended,
        instanceIDMostSig, isRaid, maxPlayers, difficultyName,
        numEncounters, encounterProgress = GetSavedInstanceInfo(i);
        print(name .. ': ' .. difficulty) .. ', ' .. encounterProgress .. '/' .. numEncounters;
    end
    
end

lockoutToolsFrame:SetScript("OnEvent", onLoad);
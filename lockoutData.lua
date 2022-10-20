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
        local name, id, reset, difficulty, locked, extended,
        instanceIDMostSig, isRaid, maxPlayers, difficultyName,
        numEncounters, encounterProgress = GetSavedInstanceInfo(i);

        -- this gets weird when heroic raid lockouts happen
        -- 2 == heroic dungeon, except for when raids come out, then 2 == heroic dung norm 25 raid
        -- 3 == 10 man raid?
        -- 4 == 25 player raid?

        if difficulty == 2 then
            table.insert(dungeonLockouts, {id, name});
        elseif difficulty == 3 or difficulty == 4 then
            table.insert(raidLockouts, {tostring(id), name, difficultyName, tostring(reset), tostring(encounterProgress), tostring(numEncounters)});
        end

        AlgorLockoutTools.raidLockouts = raidLockouts;
        AlgorLockoutTools.dungeonLockouts = dungeonLockouts;
    end
end

lockoutToolsFrame:SetScript('OnEvent', onLoad);
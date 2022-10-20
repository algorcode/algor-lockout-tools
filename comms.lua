local commsFrame = CreateFrame('FRAME', nil, UIParent);
commsFrame:RegisterEvent('CHAT_MSG_ADDON');

local function saveLockoutData(player, data)
  local dataTable = stringToTable(data);
  local savedLockoutData = AlgorLockoutTools.savedLockoutData;
  -- do some logic to determine if this player already exists
    -- if they exist delete from table
  -- finally insert lockout data
end

local function sendLockoutDataToChannel(channel)
  local raidLockoutData = AlgorLockoutTools.raidLockouts;
  local dungeonLockoutData = AlgorLockoutTools.dungeonLockouts;
  local encodedRaidData = AlgorLockoutTools:tableToString(raidLockoutData);
  local encodedDungeonData = AlgorLockoutTools:tableToString(dungeonLockoutData);
  local outputData = encodedDungeonData .. '#' .. encodedRaidData;
  C_ChatInfo.SendAddonMessage('ALT_Data', outputData, channel);
end

local function commsHandler(self, event, filter, msg, channel, player)
  if filter ~= 'ALT_Data' then
    return nil;
  end

  -- uncomment to debug addon comms
  --print('*ALT* ' .. player .. '@' .. channel .. ': ' .. msg);

  -- Events to handle
  if msg == 'collect' then
    sendLockoutDataToChannel(channel);
  elseif msg == 'receive' then
    saveLockoutData(player, msg);
  end
end

commsFrame:SetScript('OnEvent', commsHandler);

-- you can use this code inside of a /run command in game to test comms
-- C_ChatInfo.SendAddonMessage('ALT_Data', 'collect', 'GUILD');
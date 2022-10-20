AlgorLockoutTools = {};
AlgorLockoutTools.raidLockouts = {};
AlgorLockoutTools.dungeonLockouts = {};
AlgorLockoutTools.savedLockoutData = {};

C_ChatInfo.RegisterAddonMessagePrefix('ALT_Data');

function AlgorLockoutTools:tableToString(t)
    local outputStr = '';
    for _, mt in pairs(t) do
      local str = '';
      local tableCount = 0;
      for _ in pairs(mt) do tableCount = tableCount + 1; end
      for i, v in ipairs(mt) do
        if i ~= tableCount then
          str = str .. v .. ',';
        else
          str = str .. v .. ';';
        end
      end
      outputStr = outputStr .. str;
    end
    return outputStr
  end

  function AlgorLockoutTools:stringToTable(str)
    local t = {};
    for s in string.gmatch(str, '([^#]+)') do
      local ot = {};
      for c in string.gmatch(s, '([^,]+)') do
        table.insert(ot, c);
      end
      table.insert(t, ot);
    end
    return t;
  end
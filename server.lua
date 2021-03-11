function GetPlayerNeededIdentifiers(source)
		local ids = GetPlayerIdentifiers(source)
		for i,theIdentifier in ipairs(ids) do
			if string.find(theIdentifier,"license:") or -1 > -1 then
				license = theIdentifier
			elseif string.find(theIdentifier,"steam:") or -1 > -1 then
				steam = theIdentifier
			elseif string.find(theIdentifier,"discord:") or -1 > -1 then
				discord2 = theIdentifier
			end
		end
		if not steam then
			steam = "Not found"
		end
		if not discord2 then
			discord2 = "Not found"
		end
		return license, steam, discord2
	end


RegisterNetEvent("SuggestionUI:sendSuggestion")
AddEventHandler("SuggestionUI:sendSuggestion", function(data)

  discord = data['data'][1]
  description = data['data'][2]

	  local license, steam, discord2 = GetPlayerNeededIdentifiers(source)

if Config.displayidentifiers then
  PerformHttpRequest(Config.discordwebhooklink, function(err, text, headers) end, 'POST', json.encode(
    {
      username = "Suggestions",
      --avatar_url = Image,
      embeds = {
        {
          title = "New Suggestion",
          color = 16754176,
          description = "**User:** ".. GetPlayerName(source) .. " **[ID:** ".. source .."**]**\n**Suggestion:** ".. description .."\n**Steam:** ".. steam:gsub('steam:', '') .."\n**GameLicense:** ".. license:gsub('license:', '') .."\n**Discord UID:** ".. discord2:gsub('discord:', '') .."\n**Discord Tag:** <@!"..  discord2:gsub('discord:', '') .. ">",
        }
      },
    }), { ['Content-Type'] = 'application/json' })


  TriggerClientEvent("SuggestionUI:suggestionSent", source)
  TriggerClientEvent("pNotify:SendNotification", source,{text = "Your suggestion was successfully sent to our developers", type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_open", close = "gta_effects_fade_out"},killer = true})
else
  PerformHttpRequest(Config.discordwebhooklink, function(err, text, headers) end, 'POST', json.encode(
    {
      username = "Suggestions",
      --avatar_url = Image,
      embeds = {
        {
          title = "New Suggestion",
          color = 16754176,
          description = "**User:** ".. GetPlayerName(source) .. " **[ID:** ".. source .."**]**\n**Suggestion:** ".. description .."",
        }
      },
    }), { ['Content-Type'] = 'application/json' })


  TriggerClientEvent("SuggestionUI:suggestionSent", source)
  TriggerClientEvent("pNotify:SendNotification", source,{text = "Your Suggestion was successfully sent to our developers", type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_open", close = "gta_effects_fade_out"},killer = true})
  end
end)

RegisterNetEvent("SuggestionUI:emptyFields")
AddEventHandler("SuggestionUI:emptyFields", function(data)
	TriggerClientEvent("pNotify:SendNotification", source,{text = "Please fill in all the required fields", type = "error", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_open", close = "gta_effects_fade_out"},killer = true})
end)

Citizen.CreateThread(function()
	if (GetCurrentResourceName() ~= "SuggestionUI") then 
		print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named SuggestionUI for it to work properly!");
		print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named SuggestionUI for it to work properly!");
		print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named SuggestionUI for it to work properly!");
		print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named SuggestionUI for it to work properly!");
	end
end)

Citizen.CreateThread(function()
    if Config.discordwebhooklink == "WEBHOOK_HERE" then
        print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: You need to change the webhook link in server.lua for it to work properly");
        print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: You need to change the webhook link in server.lua for it to work properly");
        print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: You need to change the webhook link in server.lua for it to work properly");
        print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: You need to change the webhook link in server.lua for it to work properly");
    end
end)


versionChecker = true -- Set to false to disable version checker



-- Don't touch
resourcename = "SuggestionUI"
version = "1.0.1"
rawVersionLink = "https://raw.githubusercontent.com/Swqppingg/SuggestionUI/main/version.txt"


-- Check for version updates.
if versionChecker then
PerformHttpRequest(rawVersionLink, function(errorCode, result, headers)
    if (string.find(tostring(result), version) == nil) then
        print("\n\r[".. GetCurrentResourceName() .."] ^1WARNING: Your version of ".. resourcename .." is not up to date. Please make sure to update whenever possible.\n\r")
    else
        print("\n\r[".. GetCurrentResourceName() .."] ^2You are running the latest version of ".. resourcename ..".\n\r")
    end
end, "GET", "", "")
end

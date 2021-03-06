local show = false
function openGui()
  if show == false then
    show = true
    SetNuiFocus(true, true)

    SendNUIMessage(
      {
        show = true
      }
    )
  end
end

function closeGui()
  show = false
  SetNuiFocus(false)
  SendNUIMessage({show = false})
end

RegisterCommand('suggestion', function(source)
	openGui()
end)

RegisterNetEvent("SuggestionUI:openGui")
AddEventHandler("SuggestionUI:openGui", function(user_id)
	user_id = user_id
    openGui()
end)

RegisterNUICallback("sendSuggestion", function(data)
  discord = data['data'][1]
  description = data['data'][2]
  if (discord == "" or description == "") then

  else
    TriggerServerEvent("SuggestionUI:sendSuggestion", data)
  end

end)


RegisterNetEvent("SuggestionUI:suggestionSent")
AddEventHandler("SuggestionUI:suggestionSent", function(user_id)
	user_id = user_id
    closeGui()
end)


RegisterNUICallback("emptyFields", function()
  TriggerServerEvent("SuggestionUI:emptyFields")
end)

RegisterNUICallback("close", function()
	closeGui()
end)

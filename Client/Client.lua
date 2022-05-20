Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('xC:Shared', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do Citizen.Wait(0) end

	PlayerData = ESX.GetPlayerData()
end)
local menuOn = false

AddEventHandler("onKeyDown", function(key)
  if key == "i" then
	  menuOn = true
	  SendNUIMessage({type = 'init', resourceName = GetCurrentResourceName()})
	  SetCursorLocation(0.5, 0.5)
	  SetNuiFocus(true, true)
	  PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)
  end
end)

RegisterNUICallback('closemenu', function(data, cb)
  menuOn = false
  SetNuiFocus(false, false)
  SendNUIMessage({type = 'destroy'})
  PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)
  cb('ok')
end)

RegisterNUICallback('openmenu', function(data)
  menuOn = false
  SetNuiFocus(false, false)
  SendNUIMessage({type = 'destroy'})
  PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)
  if data.id == 'inventory' then
	TriggerEvent('OpenInventry:Open')
  elseif data.id == 'billing' then
	TriggerEvent("OpenBills:Open")
  elseif data.id == 'dance' then
	TriggerEvent("UseEmote:Open")
  elseif data.id == 'gang' then
	TriggerEvent('OpenGang:Open')
  elseif data.id == 'job' then
	OpenJobMenu()
  elseif data.id == 'phone' then
	TriggerEvent("UsePhone:Open")
  end
end)

function OpenJobMenu()
  if PlayerData.job.name == 'police' then
	TriggerEvent('OpenPolice:Open')
  elseif PlayerData.job.name == 'weazel' then
	TriggerEvent('OpenWeazel:Open')
  elseif PlayerData.job.name == 'mechanic' then
	TriggerEvent('OpenMechanic:Open')
  elseif PlayerData.job.name == 'ambulance' then
	TriggerEvent('OpenAmbulance:Open')
  elseif PlayerData.job.name == 'fbi' then
	TriggerEvent('OpenFBI:Open')
  elseif PlayerData.job.name == 'sheriff' then
	TriggerEvent('OpenSheriff:Open')
  else
	exports['xC_Notification']:notification('fa-solid fa-xmark text-primary text-info',' Error',"", 'Shoma Ozv Hich Jobi Nistid !', 3000)
  end
end
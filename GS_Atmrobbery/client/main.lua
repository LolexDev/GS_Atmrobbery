--────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
--─██████████████─████████████████───██████████████─██████──██████─██████████████────██████████████─██████████████─████████████████───██████████─██████████████─██████████████─██████████████─
--─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░░░░░██────██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─
--─██░░██████████─██░░████████░░██───██░░██████░░██─██░░██──██░░██─██░░██████████────██░░██████████─██░░██████████─██░░████████░░██───████░░████─██░░██████░░██─██████░░██████─██░░██████████─
--─██░░██─────────██░░██────██░░██───██░░██──██░░██─██░░██──██░░██─██░░██────────────██░░██─────────██░░██─────────██░░██────██░░██─────██░░██───██░░██──██░░██─────██░░██─────██░░██─────────
--─██░░██─────────██░░████████░░██───██░░██──██░░██─██░░██──██░░██─██░░██████████────██░░██████████─██░░██─────────██░░████████░░██─────██░░██───██░░██████░░██─────██░░██─────██░░██████████─
--─██░░██──██████─██░░░░░░░░░░░░██───██░░██──██░░██─██░░██──██░░██─██░░░░░░░░░░██────██░░░░░░░░░░██─██░░██─────────██░░░░░░░░░░░░██─────██░░██───██░░░░░░░░░░██─────██░░██─────██░░░░░░░░░░██─
--─██░░██──██░░██─██░░██████░░████───██░░██──██░░██─██░░██──██░░██─██░░██████████────██████████░░██─██░░██─────────██░░██████░░████─────██░░██───██░░██████████─────██░░██─────██████████░░██─
--─██░░██──██░░██─██░░██──██░░██─────██░░██──██░░██─██░░░░██░░░░██─██░░██────────────────────██░░██─██░░██─────────██░░██──██░░██───────██░░██───██░░██─────────────██░░██─────────────██░░██─
--─██░░██████░░██─██░░██──██░░██████─██░░██████░░██─████░░░░░░████─██░░██████████────██████████░░██─██░░██████████─██░░██──██░░██████─████░░████─██░░██─────────────██░░██─────██████████░░██─
--─██░░░░░░░░░░██─██░░██──██░░░░░░██─██░░░░░░░░░░██───████░░████───██░░░░░░░░░░██────██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██──██░░░░░░██─██░░░░░░██─██░░██─────────────██░░██─────██░░░░░░░░░░██─
--─██████████████─██████──██████████─██████████████─────██████─────██████████████────██████████████─██████████████─██████──██████████─██████████─██████─────────────██████─────██████████████─
--────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
local pljacka = false
local opljackao = false

if Config.KoristiBlipove == true then
    Citizen.CreateThread(function ()
      for i, v in pairs(Config.Blipovi) do
          local blip = AddBlipForCoord(v.Kordinate.x, v.Kordinate.y, v.Kordinate.z)
    
          SetBlipSprite(blip, v.Ikonica)
    
          if v.Boja ~= nil then
              SetBlipColour(blip, v.Boja)
          end
    
          SetBlipDisplay(blip, v.Pokazuj)
    
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(v.Ime)  -- Stavi ime blipu
          EndTextCommandSetBlipName(blip)
    
    
          local display = v.Pokazuj
    
          SetBlipDisplay(blip, display)
      end
    end)
    else
      TriggerServerEvent('GS_Atmrobbery:notUsingBlips')
end

Citizen.CreateThread(function()
    for _,v in pairs(Config.Diler) do
      RequestModel(GetHashKey(v.model))
      while not HasModelLoaded(GetHashKey(v.model)) do
        Wait(1)
      end
      PostaviPeda = CreatePed(4, v.model, vector3(v.coords.x, v.coords.y, v.coords.z - 1) , v.coords.w, false, true)
      TaskStartScenarioInPlace(PostaviPeda, "WORLD_HUMAN_STAND_MOBILE", 0, true)
      FreezeEntityPosition(PostaviPeda, true) 
      SetEntityInvincible(PostaviPeda, true)
      SetBlockingOfNonTemporaryEvents(PostaviPeda, true)
        exports.qtarget:AddBoxZone('zapocni', vector3(v.coords.x, v.coords.y, v.coords.z - 1), v.coords.w, 1.0, {
            name= 'zapocni',
            heading= v.coords.w,
            debugPoly= Config.Debug,
            minZ= v.coords.z -1,
            maxZ= v.coords.z +2,
            }, {
              options = {
                {
                  action = function()
                    lib.showContext('tabletlib')
                  end,
                  icon = "fa-solid fa-user-secret",
                  label = _U("dealernpctext"),
                },
              }
            })
    end
end)

exports.qtarget:AddTargetModel(Config.Propovi, {
  options = {
      {
          action = function ()
            if opljackao == false then
              ESX.TriggerServerCallback('GS_Atmrobbery:tabletChecker', function(ima)  
                if ima then
                    FreezeEntityPosition(PlayerPedId(), true)
                    local uspeo = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 1}, 'easy'}, {'w', 'a', 's', 'd'})
                    FreezeEntityPosition(PlayerPedId(), false)
                    if uspeo then
                      local kordinate = GetEntityCoords(PlayerPedId())
                      TriggerServerEvent('GS_Atmrobbery:zvanjePolicije', kordinate)
                        pljacka = true
                        TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_MOBILE", 0, true)
                        progressbar(_U('robprog'), Config.HackTime * 1000)
                        obavesti(_U('robsuccess'),_U('robsuccessd'),'success','top',7000)
                        TriggerServerEvent('GS_Atmrobbery:robbedAtm')
                        Wait(1000)
                        TriggerServerEvent('GS_Atmrobbery:fs')
                        ClearPedTasks(PlayerPedId())
                        pljacka = false
                        opljackao = true
                        Wait(Config.Cooldown * 1000)
                        opljackao = false
                    else
                      local kordinate = GetEntityCoords(PlayerPedId())
                        obavesti(_U("failed"),'','error','top')
                        TriggerServerEvent('GS_Atmrobbery:zvanjePolicije', kordinate)
                    end
                else
                    obavesti(_U('nohackingdevice'),'','error','top',5000)
                end
            end)
          else
            obavesti(_U('alreadyrobbed'),'','error','top',5000)
            end
          end,
          icon = 'fa-solid fa-tablet',
          label = _U('targettext'),
          prop = Config.Propovi,
      }
  },
  distance = 2.0
}) 

lib.registerContext({
    id = 'tabletlib',
    title = _U('tabletitle'),
    options = {
        {
            title = _U('buytitle'),
            description = _U('buyd'),
            icon = 'fa-solid fa-tablet',
            onSelect = function()
              ESX.TriggerServerCallback('GS_Atmrobbery:moneyChecker', function (ima)
                if ima then
                    TriggerServerEvent('GS_Atmrobbery:at')
                else
                    obavesti(_U('nocash'),'','error','top')
                end
              end)
            end,
            metadata = {
              {label = _U('price'), value = Config.CenaTableta},
            },
        }
    }
})

RegisterNetEvent('GS_Atmrobbery:upravoPljacka', function (pljackas,alert)
    local blipKordinate = GetEntityCoords(pljackas)
    local blip = AddBlipForRadius(blipKordinate.x, blipKordinate.y, blipKordinate.z, 5)

    SetBlipDisplay(blip, 6)
    SetBlipColour(blip, 6)

    obavesti(_U('robbery'),_U('robberyd'),'warning','top',5000)


end)
ESX = exports['es_extended']:getSharedObject()

CreateThread(function()

  for k, v in pairs(Config.Ped) do

		RequestModel(GetHashKey(v.Hash))
		while not HasModelLoaded(GetHashKey(v.Hash)) do
			Wait(1)
		end

		PostaviPeda = CreatePed(4, v.Hash, v.Coords, v.Heading, false, true)
		TaskStartScenarioInPlace(PostaviPeda, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, false)
		FreezeEntityPosition(PostaviPeda, true) 
		SetEntityInvincible(PostaviPeda, true)
		SetBlockingOfNonTemporaryEvents(PostaviPeda, true)

  	exports.qtarget:AddTargetModel(v.Hash, {
    	options = {
        {
          icon   = Config.QTarget["Icon"], 
      	  label  = Config.QTarget["Label"],
          job    = Config.QTarget["Posao"],
          action = function()
            lib.showContext('duty_context')
          end,
        },
      },
      distance = Config.QTarget["Distance"]
    })
  end
end)

lib.registerContext({
  id = 'duty_context',
  title = 'Duty',
  options = {
    {
      title = 'Upali duty',
      description = 'Da udjes na duty',
      icon = 'fa-solid fa-toggle-on',
      iconColor = "#008cffe3",
      event = 'eDuty:onDuty',
      arrow = true,
    },
    {
      title = 'Ugasi duty',
      description = 'Da izadjes sa duty',
      icon = 'fa-solid fa-toggle-off',
      iconColor = "#008cffe3",
      event = 'eDuty:offDuty',
      arrow = true,
    }
  }
})

AddEventHandler('eDuty:onDuty', function()

  local poslovi = {
    'offambulance',
    'offpolice',
  }

  for k,v in pairs(poslovi) do
    if ESX.PlayerData.job.name == v then
      TriggerServerEvent('eDuty:on')
      Duty = true
    end
  end

end)

AddEventHandler('eDuty:offDuty', function()

  local poslovi = {
    'police',
    'ambulance'
  }

  for k,v in pairs(poslovi) do
    if ESX.PlayerData.job.name == v then
      TriggerServerEvent('eDuty:off')
      Duty = false
    end
  end

end)

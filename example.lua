-- EXAMPLE WITH NOT COORDS

RegisterCommand("s", function(source, args)
    local data = {}
    table.insert(data, {text = "Open", toDo = [[ExecuteCommand("su")]]})
    table.insert(data, {text = "Close", toDo = [[ExecuteCommand("s")]]})
    table.insert(data, {text = "Delete", toDo = [[ExecuteCommand("car zentorno")]]})
    TriggerEvent("guille_cont:client:open", "Interaction menu" --[[Title of the menu]], data --[[Data of the script]], false, --[[Use coords = true, not using coords = false]] coords --[[The coords of the entity or place]])
end, false)

-- EXAMPLE WITH COORDS

RegisterCommand("su", function(source, args)
    local data = {}
    table.insert(data, {text = "Abrir/Cerrar", toDo = [[ExecuteCommand("me Hello everyone")]], icon = 'fa-key'})  --[[Icons from FontAwesome]]
    table.insert(data, {text = "Puertas", toDo = [[TriggerEvent("esx_carlock:closecar", nearestcar)]], icon = 'fa-car'})
    table.insert(data, {text = "Maletero", toDo = [[ExecuteCommand("car zentorno")]], icon = 'fa-car'})
    table.insert(data, {text = "Otros", toDo = [[ExecuteCommand("car zentorno")]]})
    local hash = GetHashKey("zentorno")
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(1)
    end
    veh = CreateVehicle(hash, GetEntityCoords(PlayerPedId()) + vector3(0, 1, 0), 100.00, false, false)
    local coords = GetEntityCoords(veh)
    TriggerEvent("guille_cont:client:open", "Vehículo" --[[Title of the menu]], data --[[Data of the script]], true, --[[Use coords = true, not using coords = false]] coords --[[The coords of the entity or place]])
end, false)


TriggerEvent("guille_cont:client:open", "Title of the menu", data --[[Data of the script]], true, --[[Use coords = true, not using coords = false]] coords --[[The coords of the entity or place]])
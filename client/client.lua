function log(ty, t)
    if ty == "error" then
        print("^3["..GetCurrentResourceName().."] ^1[ERROR] "..t)
    else
        print("^2["..GetCurrentResourceName().."] ^2[INFO]^8 "..t)
    end
end

RegisterNetEvent("guille_cont:client:open")
AddEventHandler("guille_cont:client:open", function(title, data, useCoords, coords)
    if title == nil then
        log("error", "Title does not exist")
        return
    end
    if useCoords == nil then
        log("error", "Using coords not set, it must be true or false")
        return
    end
    for k,v in pairs(data) do
        if v.toDo == nil then
            log("error", "The data toDo does not exist in table data, read the guille_contextmenu docs")
            return
        end
        v.toDo = v.toDo:gsub('"', "'")
    end
    if useCoords then
        log("info", "Menu created")
        local _, screenPox, ScreenPoy = GetScreenCoordFromWorldCoord(coords.x, coords.y, coords.z + 1.5)
        SendNUIMessage({
            title = title;
            data = data;
            x = screenPox * 100;
            y = ScreenPoy * 100;
            useCoords = useCoords;
        })
    else
        log("info", "Menu created")
        SendNUIMessage({
            title = title;
            data = data;
            useCoords = useCoords;
        })
    end 
    SetNuiFocus(true, true)
end)

RegisterNUICallback("interact", function(cb)
    assert(load(cb.execute))()
end)

RegisterNUICallback("close", function(cb)
    PlaySoundFrontend(-1, 'Highlight_Cancel','DLC_HEIST_PLANNING_BOARD_SOUNDS', 1)
    SetNuiFocus(false, false)
end)


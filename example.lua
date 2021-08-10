function openBossMenu()
    local data = {}
    if #gangData.members == 0 then
        return
    end
    local cb = "member"
    for k, v in pairs(gangData.members) do
        --
        table.insert(data, {text = v.member.name.. " - " ..v.member.rank, toDo = v.member.steam})
    end
    TriggerEvent("guille_cont:client:open", _U("click_to_ex"), data, cb, false)
end

RegisterNUICallback("member", function(cb)
    TriggerServerEvent("guille_gangs:server:removeGangMember", cb.execute, gangData.gang, true)
end)

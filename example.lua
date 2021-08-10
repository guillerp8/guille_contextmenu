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

-- Another example

function openShop()
    local data = {}
    if #gangData.shop == 0 then
        return
    end
    local cb = "item"
    for k, v in pairs(gangData.shop) do
        table.insert(data, {text = v.label.."<span style='color:green'>"..v.price.."$</span>", toDo = v.name})
    end
    TriggerEvent("guille_cont:client:open", _U("shop_menu"), data, cb, false)
end

RegisterNUICallback("item", function(cb)
    for k, v in pairs(gangData.shop) do
        if v.name == cb.execute then
            TriggerServerEvent("guille_gangs:server:buyItem", v.type, v.name, v.price)
            break
        end
    end
end)

CreateThread(function()
    for k,v in pairs(Items) do
        MySQL.insert('INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`, `desc`, `weight`) VALUES (?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE label = VALUES(label), limit = VALUES(limit), can_remove = VALUES(can_remove), type = VALUES(type), usable = VALUES(usable), desc = VALUES(desc), weight = VALUES(weight)', {
            k, v.label, v.limit, v.can_remove, v.type, v.usable, v.desc, v.weight
        })
    end
end)
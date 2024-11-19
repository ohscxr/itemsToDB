CreateThread(function()
    for k,v in pairs(Items) do
        MySQL.insert('INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`, `desc`, `weight`) VALUES (:item, :label, :limit, :can_remove, :type, :usable, :desc, :weight) ON DUPLICATE KEY UPDATE label = :label, limit = :limit, can_remove = :can_remove, type = :type, usable = :usable, desc = :desc, weight = :weight', {
            item = k,
            label = v.label,
            limit = v.limit,
            type = v.type,
            can_remove = v.can_remove,
            usable = v.usable,
            desc = v.desc,
            weight = v.weight,
        })
    end
end)
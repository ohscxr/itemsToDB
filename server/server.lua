CreateThread(function()
    local addedCount = 0
    local duplicates = {}

    for k, v in pairs(Items) do
        -- Attempt to insert the item
        local result = MySQL.insert.await([[
            INSERT INTO `items` 
            (`item`, `label`, `limit`, `can_remove`, `type`, `usable`, `desc`, `weight`) 
            VALUES (:item, :label, :limit, :can_remove, :type, :usable, :desc, :weight) 
            ON DUPLICATE KEY UPDATE 
                `label` = :label, 
                `limit` = :limit, 
                `can_remove` = :can_remove, 
                `type` = :type, 
                `usable` = :usable, 
                `desc` = :desc, 
                `weight` = :weight
        ]], {
            ['item'] = k,
            ['label'] = v.label,
            ['limit'] = v.limit,
            ['can_remove'] = v.can_remove,
            ['type'] = v.type,
            ['usable'] = v.usable,
            ['desc'] = v.desc,
            ['weight'] = v.weight,
        })

        -- Check the result of the query
        if result and result > 0 then
            addedCount = addedCount + 1
        else
            duplicates[#duplicates+1] = k -- Track duplicate item keys
        end
    end

    -- Print summary to console
    print(('[Items Insertion] Successfully added %d items to the database.'):format(addedCount))
    if #duplicates > 0 then
        print('[Items Insertion] The following duplicates were not added (already exist):')
        for _, item in ipairs(duplicates) do
            print('- ' .. item)
        end
    else
        print('[Items Insertion] No duplicates found.')
    end
end)
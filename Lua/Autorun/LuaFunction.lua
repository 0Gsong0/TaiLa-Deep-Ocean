Hook.Add("character.applyDamage", "LuaArmor.ApplyDamage", function (characterHealth, attackResult, hitLimb)
    if hitLimb.type ~= LimbType.Torso then return end

    local character = characterHealth.Character
    if character.Inventory == nil then return end
    local armor = character.Inventory.GetItemInLimbSlot(InvSlotType.OuterClothes)

    if armor == nil or armor.Prefab.Identifier ~= "luaarmor" then return end

    local damage = 0

    for aaaaa in attackResult.Afflictions do
        damage = damage + aaaaa.Strength
    end

    armor.Condition = armor.Condition - damage*0.1

    print(armor.Condition)

    if armor.Condition > 0 then
        return true
    else
        Entity.Spawner.AddEntityToRemoveQueue(armor)
    end
end)

Hook.Add("character.applyDamage", "BossLuaArmor.ApplyDamage", function (characterHealth, attackResult, hitLimb)

    local character = characterHealth.Character
    if character.Inventory == nil then return end
    local armor = character.Inventory.GetItemInLimbSlot(InvSlotType.OuterClothes)

    if armor == nil or armor.Prefab.Identifier ~= "Bossluaarmor" then return end
   
	for aaaaa in attackResult.Afflictions do 
	if aaaaa.Prefab.Identifier.Value ~= "damage_TL" then
	aaaaa.strength = 0 end
    end
end)

Hook.Add("luahuaqiang.onUse", "examples.xmlHooks", function(effect, deltaTime, item, targets, worldPosition)
    if targets[1] == nil then return end
    targets[1].Kill(CauseOfDeathType.Unknown)
end)

--Hook.Add("examples.givemoney", "examples.givemoney", function ()
 --local MoneyAmount = 50000;
 --local character
    --character = Character.Controlled

    --if character == nil then return end
 --character.GiveMoney(MoneyAmount);
--end)

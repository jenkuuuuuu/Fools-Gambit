function FG.is_alternate(card,table)
    for k, v in pairs(table) do
        if card == v then
            return "v"
		elseif card == tostring(k) then
			return "k"
        end
    end
    return "no"
end


--[[
key is the provided card key.
table is the reference table to look up.
passing key or value, and returns the other.
]]
function FG.get_equivalent(key,table,passing)
	local _passing = passing or FG.is_alternate(key,table)
	if _passing == "k" then -- passing key, returning value
		for k,v in pairs(table) do
			if k == key then return v end
		end
	elseif _passing == "v" then -- passing value, returning key
		for k,v in pairs(table) do
			if v == key then return k end
		end
	end
end

-- Alternates between this card and the associated alternative card.
-- key is the provided card key.
-- card is the card instance you are dealing with. 99% of the time it will be just card (the one provided you by the function)
-- table is the reference table to look up and compare.
function FG.alternate_card(args)
	-- Definitions (Sets all the default values)
	local args = args or {}
	if not args.key or args.card then sendWarnMessage("Missing card key and/or card instance!","Fool's Gambit/alternate_card") end
	local card = args.card -- can't provide default value
	local table = args.set or FG.joker_equivalents
	local edition = args.skip_edition or false -- Keep editions
	local enhancement = args.skip_enhancement or false -- Keep enhancements
	local seal = args.skip_seal or false -- Keep seals
	local sticker = args.skip_stickers or false -- Keep stickers
	-- Extra definitions (Other definitions that are not set by args)
	local key = card.config.center_key
	local set = table.meta.set "jokers"
	-- Function
	local convert_to = FG.get_equivalent(key,table,FG.is_alternate(key,table))
	local new_card = SMODS.add_card({
		set = set,
		skip_materialize = true,
		key = tostring(convert_to),
	})
	if card.edition and not edition then
		FG.update_edition(card,new_card)
	end
	card:start_dissolve(nil,false,0,true)
end

-- Allows to integrate original<>alternate entries to the mod's tables.
-- Target table: The table you are adding entries to.
-- Source table: The table you are taking entries from.
function FG.register_alternate(target_table, source_table)
	if not target_table or not source_table then
		sendWarnMessage("Missing or incorrect arguments: target_table [table], source_table [table]","Fool's Gambit/register_cards")
		return
    end
    for k,v in pairs(source_table) do
        target_table[k] = v
    end
end

-- card is the old card, that is being deleted
-- new_card is the new card created for alternating.
function FG.update_alternate_values(old_card,new_card)
		for k,v in ipairs(old_card.config.extra.alternating_values) do
	  	new_card.config.extra.alternating_values.k = v
  	end
end

-- Transfers the edition from the old card to the new card.
-- card is the card object of which the edition has to be updated.
function FG.update_edition(old_card,new_card)
	if old_card.edition then
		new_card:set_edition(tostring(old_card.edition.key),true,true)
	else
		new_card:set_edition(nil,true,true)
	end
end


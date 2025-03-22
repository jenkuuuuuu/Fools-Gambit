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
	local ref = args.ref or FG.joker_equivalents
	local edition = args.edition or 'keep' -- keep | alternate | ignore
	local edition_ref = args.edition_ref or FG.edition_equivalents

	-- Extra definitions (Other definitions that are not set by args)

	local key = card.config.center_key
	local set = ref.meta.set or "jokers"

	-- Function

	local convert_to = FG.get_equivalent(key,ref,FG.is_alternate(key,ref))
	local new_card = SMODS.add_card({
		set = set,
		skip_materialize = true,
		key = tostring(convert_to),
	})
	if edition == 'keep' then FG.update_edition(card,new_card) 
	elseif edition == 'alternate' then FG.alternate_edition(card,new_card,edition_ref)
	end
	card:start_dissolve(nil,false,0,true)
end

-- Transfers the edition from the old card to the new card.
function FG.update_edition(source,target)
	if source.edition then
		target:set_edition(source.edition.key,true,true)
	else
		target:set_edition(nil,true,true)
	end
end

function FG.alternate_edition(source,target,ref)
	if source.edition then
		target:set_edition(FG.get_equivalent(source.edition.key,ref),true,true)
	else
		target:set_edition(nil,true,true)
	end
end

-- WIP functions. Do nothing at the moment

function FG.update_enhancement(source,target) end
function FG.alternate_enhancement(source,target) end
function FG.update_seal(source,target) end
function FG.alternate_seal(source,target) end


-- card is the old card, that is being deleted
-- new_card is the new card created for alternating.
function FG.update_alternate_values(source,target,mode)
	for k,v in ipairs(source.config.extra.alternating_values) do
		target.config.extra.alternating_values[k] = v
	end
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
function FG.flip_editions(card)
	if card.edition then
		if card.edition.negative then
			card:set_edition(nil, true)
		elseif card.edition.polychrome then
			card:set_edition("e_fg_polished", true)
		elseif card.edition.fg_polished then
			card:set_edition("e_polychrome", true)
		elseif card.edition.holo then
			card:set_edition("e_foil", true)
		elseif card.edition.foil then
			card:set_edition("e_holo", true)
		end							
		if card.edition.negative then card:set_edition(nil, true)
		elseif card.edition.polychrome then card:set_edition("e_fg_polished", true)
		elseif card.edition.fg_polished then card:set_edition("e_polychrome", true)
		elseif card.edition.holo then card:set_edition("e_foil", true)
		elseif card.edition.foil then card:set_edition("e_holo", true)
		end
	else
		card:set_edition("e_negative", true)
	end
end

if FG.config.debug_mode then -- scary !!! broken!!!! (eats tags and is forced after reroll)
	function FG.replace_shop_joker(key, index)
		if G.shop_jokers then
			if G.shop_jokers.cards then
				local replacee = G.shop_jokers.cards[index]
				if replacee then
				G.shop_jokers:remove_card(replacee)
				replacee:remove()
				
	
				local replacement = SMODS.add_card({set = "Joker", area = G.shop_jokers, key = key})
				create_shop_card_ui(replacement, joker, G.shop_jokers)
				replacement:start_materialize()
				end
			end
		end
	end

	local shopref = create_card_for_shop

	function create_card_for_shop(area)
		local card = shopref(area)

		if G.shop_jokers and G.shop_jokers.cards and #G.shop_jokers.cards > 0 and  G.GAME.round == 3 - G.GAME.skips then
			FG.replace_shop_joker("j_fg_change_of_pace", 1)
		end

		return card
	end
end
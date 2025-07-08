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

--- Gets the key/value pair associated with the passing data.
---@param key string The provided card key.
---@param table table The reference table to look up.
---@param passing? "k"|"v" Key or value, and returns the other.
---@return string 
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
---@param args table Arguments for this function.
---@param args.key string The key of the card to be altered.
---@param args.card table|card The card instance itself.
---@param args.ref table The table to compare the card when alternating it.
---@param args.edition string Weather to keep, alternate, or ignore the card's edition,
---@param args.edition_ref table The table to compare the edition when alternating it.
---@param args.enhancement string Weather to keep, alternate or ignore the card's enhancement
---@param args.enhancement_ref string The table to compare the enhancement when alternating it.
function FG.alternate_card(args)
	-- Definitions (Sets all the default values)
	local args = args or {}
	if not args.key or args.card then sendWarnMessage("Missing card key and/or card instance!","Fool's Gambit/alternate_card") end
	local card = args.card -- can't provide default value
	local ref = args.ref or FG.joker_equivalents
	local edition = args.edition or 'keep' -- keep | alternate | ignore (other)
	local edition_ref = args.edition_ref or FG.edition_equivalents
	local enhancement = args.enhancement or 'keep' -- keep | alternate | ignore (other)
	local enhancement_ref = args.enhancement_ref or FG.enhancement_equivalents

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

	-- Edition management
	
	if edition == 'keep' then FG.update_edition(card,new_card) 
	elseif edition == 'alternate' then FG.alternate_edition(card,new_card,edition_ref)
	end
	card:start_dissolve(nil,false,0,true)

	-- Enhancement management
	if enhancement == 'keep' then FG.update_enhancement(card,new_card)
	elseif enhancement == 'alternate' then FG.alternate_enhancement(card,new_card,enhancement_ref)
	end
end

--- Transfers the edition from the old card to the new card.
---@param source table|card The card to be altered.
---@param target table|card - The card to be created. If not provided, it will be the same as source.
function FG.update_edition(source,target)
	target = target or source
	if source.edition then
		target:set_edition(source.edition.key,true,true)
	else
		target:set_edition(nil,true,true)
	end
end

--- Alternate card's editions.
---@param source table|card The card to be altered.
---@param target table|card The card to be created. If not provided, it will be the same as source.
---@param ref table The reference table to look up the edition. Defaults to `FG.edition_equivalents`.
function FG.alternate_edition(source,target,ref)
	ref = ref or FG.edition_equivalents
	target = target or source
	if source.edition then
		target:set_edition(FG.get_equivalent(source.edition.key,FG.edition_equivalents),true,true)
	else
		target:set_edition(nil,true,true)
	end
end

--- Update enhancement
---@param source table|card The card to be altered.
---@param target table|card The card to be created. If not provided, it will be the same as source.
function FG.update_enhancement(source,target)
	target = target or source
	local enhancement = nil
	if source.config.center.key then 
		enhancement = source.config.center.key 
	end
	target:set_ability(G.P_CENTERS[enhancement])
end

--- Alternate a card's enhancement
---@param source table|card The card to be altered.
---@param target table|card The card to be created. If not provided, it will be the same as source.
---@param ref table The reference table to look up the enhancement. Defaults to `FG.enhancement_equivalents`.
function FG.alternate_enhancement(source,target,ref)
	ref = ref or FG.enhancement_equivalents
	target = target or source
	local enhancement = FG.get_equivalent(source.config.center.key,ref)
	target:set_ability(G.P_CENTERS[enhancement])
end


function FG.update_seal(source,target) end
function FG.alternate_seal(source,target) end

--- Transfers and updates the values from any given card to any other card.
---@param source table|card is the old card, that is being deleted
---@param target table|card is the new card created for alternating.
function FG.update_alternate_values(source,target,mode)
	for k,v in ipairs(source.config.extra.alternating_values) do
		target.config.extra.alternating_values[k] = v
	end
end

--- Allows to integrate original<>alternate entries to the mod's tables.
---@param target_table table The table you are adding entries to.
---@param source_table table The table you are taking entries from.
function FG.register_alternate(target_table, source_table)
	if not target_table or not source_table then
		sendWarnMessage("Missing or incorrect arguments: target_table [table], source_table [table]","Fool's Gambit/register_cards")
		return
    end
    for k,v in pairs(source_table) do
        target_table[k] = v
    end
end


-- DEPRECATED
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

--- Allows to duplicate any given card and insert it into playing hand. Return value is the new card. Sourced from 'cryptid' (Spectral).
---@param card card The card that is being duplicated.
---@return card card The newly created card.
FG.duplicate_playing_card = function (card)
	local _first_dissolve = nil
	G.playing_card = (G.playing_card and G.playing_card + 1) or 1
	local _card = copy_card(card, nil, nil, G.playing_card)
	_card:add_to_deck()
	G.deck.config.card_limit = G.deck.config.card_limit + 1
	table.insert(G.playing_cards, _card)
	G.hand:emplace(_card)
	_card:start_materialize(nil, _first_dissolve)
	_first_dissolve = true
	return _card
end

-- CALLBACK FUNCTIONS FOR BUTTONS AND SHIT

-- Settings, special edition
G.FUNCS.FG_s_version = function (args)
	FG.test.s_version = args
	FG.config.s_version.selected = args.cycle_config.current_option
	FG.config.s_version.active = args.to_val
end

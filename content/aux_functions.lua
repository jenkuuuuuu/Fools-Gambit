function FG.FUNCS.is_alternate(card,table)
    for k, v in pairs(table) do
        if card == v then
            return "v"
		elseif card == tostring(k) then
			return "k"
        end
    end
    return "no"
end

--- Gets the key/value pair associated with the passing data. Returns `nil` if there is no alternate
---@param key string The provided card key.
---@param table table The reference table to look up.
---@param passing? string Key or value, and returns the other.
---@return string|boolean key The key of the alternate card, or `false` (boolean) if not found
function FG.FUNCS.get_alternate(key,table,passing)
	local _passing = passing or FG.FUNCS.is_alternate(key,table)
	if _passing == "k" then -- passing key, returning value
		for k,v in pairs(table) do
			if k == key then return v end
		end
	elseif _passing == "v" then -- passing value, returning key
		for k,v in pairs(table) do
			if v == key then return k end
		end
	else return false end
end

-- Alternates between this card and the associated alternative card.
---@param card table|card The card instance itself.
---@param ref table The table to compare the card when alternating it.
---@return table|card table A table containing the old card and the new card.
function FG.FUNCS.alternate_card(card,ref)
	local ref = ref or FG.ALTS.joker_equivalents
	local key = FG.FUNCS.get_card_info(card).key
	local convert_to = FG.FUNCS.get_alternate(key,ref,FG.FUNCS.is_alternate(key,ref))
	local new_card = SMODS.add_card({
		--set = 'Joker',
		skip_materialize = true,
		key = tostring(convert_to),
	})
	card:start_dissolve(nil,false,0,true)

	return {
		original = card,
		alternate = new_card
	}
end

--- Transfers the edition from the old card to the new card.
---@param source table|card The card to be altered.
---@param target? table|card - The card to be created. If not provided, it will be the same as source.
function FG.FUNCS.update_edition(source,target)
	target = target or source
	if source.edition then
		target:set_edition(FG.FUNCS.get_card_info(source).edition,true,true)
	else
		target:set_edition(nil,true,true)
	end
end

--- Alternate card's editions.
---@param source table|card The card to be altered.
---@param target? table|card The card to be created. If not provided, it will be the same as source.
---@param ref? table The reference table to look up the edition. Defaults to `FG.ALTS.edition_equivalents`.
function FG.FUNCS.alternate_edition(source,target,ref)
	ref = ref or FG.ALTS.edition_equivalents
	target = target or source
	if source.edition then
		target:set_edition(FG.FUNCS.get_alternate(FG.FUNCS.get_card_info(source).edition,FG.ALTS.edition_equivalents),true,true)
	else
		target:set_edition(nil,true,true)
	end
end

--- Update enhancement
---@param source table|card The card to be altered.
---@param target? table|card The card to be created. If not provided, it will be the same as source.
function FG.FUNCS.update_enhancement(source,target)
	target = target or source
	local enhancement = nil
	if FG.FUNCS.get_card_info(source).key then 
		enhancement = FG.FUNCS.get_card_info(source).key
	end
	target:set_ability(G.P_CENTERS[enhancement])
end

--- Alternate a card's enhancement
---@param source table|card The card to be altered.
---@param target? table|card The card to be created. If not provided, it will be the same as source.
---@param ref? table The reference table to look up the enhancement. Defaults to `FG.ALTS.enhancement_equivalents`.
function FG.FUNCS.alternate_enhancement(source,target,ref)
	ref = ref or FG.ALTS.enhancement_equivalents
	target = target or source
	local enhancement = FG.FUNCS.get_alternate(FG.FUNCS.get_card_info(source).key,ref)
	target:set_ability(G.P_CENTERS[enhancement])
end


function FG.FUNCS.update_seal(source,target) end
function FG.FUNCS.alternate_seal(source,target) end

--- Transfers and updates the values from any given card to any other card.
---@param source table|card is the old card, that is being deleted
---@param target table|card is the new card created for alternating.
function FG.FUNCS.update_alternate_values(source,target,mode)
	if not source.ability.fg_alternate then sendWarnMessage("This card lacks fg_alternate table inside it's ability table!","FG.FUNCS.update_alternate_values") return end
	if not target.ability.fg_alternate then sendWarnMessage("The target card lacks fg_alternate table") return end
	target.ability.fg_alternate = source.ability.fg_alternate
end

--- Allows to integrate original<>alternate entries to the mod's tables.
---@param target_table table The table you are adding entries to.
---@param source_table table The table you are taking entries from.
function FG.FUNCS.register_alternate(target_table, source_table)
	if not target_table or not source_table then
		sendWarnMessage("Missing or incorrect arguments: target_table [table], source_table [table]","Fool's Gambit/register_cards")
		return
    end
    for k,v in pairs(source_table) do
        target_table[k] = v
    end
end


---@deprecated
function FG.FUNCS.flip_editions(card)
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

--if FG.config.debug_mode then -- slightly less scary !!! still broken!!!! (eats tags) || buggy af, fix the UI please
	function FG.FUNCS.replace_shop_joker(key, index)
		if G.shop_jokers then
			if G.shop_jokers.cards then
				local replacee = G.shop_jokers.cards[index]
				if replacee then
					G.shop_jokers:remove_card(replacee)
					replacee:remove()
				else
					--G.E_MANAGER:add_event(Event({func = function()
					--change_shop_size(1)
					--return true end }))
				end
				local replacement = SMODS.add_card({set = "Joker", area = G.shop_jokers, key = key})
				create_shop_card_ui(replacement, 'joker', G.shop_jokers)
				replacement:start_materialize()
			end
		end
	end

	local shopref = create_card_for_shop
	local cop_reroll = false
	function create_card_for_shop(area)
		local card = shopref(area)

		if G.shop_jokers and G.shop_jokers.cards and #G.shop_jokers.cards > 0 and  G.GAME.round == 3 - G.GAME.skips and cop_reroll == false then
			
			FG.FUNCS.replace_shop_joker("j_fg_change_of_pace", #G.shop_jokers.cards+1)
			cop_reroll = true
			end

		return card
	end
--end

--- Allows to duplicate any given card and insert it into playing hand. Return value is the new card. Sourced from 'cryptid' (Spectral).
---@param card card The card that is being duplicated.
---@return card card The newly created card.
FG.FUNCS.duplicate_playing_card = function (card)
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

--- Wrapper function to not use card_eval_status_text (scroll down  [vvv])<br>
--- @param args {card:table,type?:string|"extra",category?:string|"FG",message?:string|"ERROR",mode?:"localize"|"literal",colour?:string,color?:string}
--- `card` table|card The card instance.<br>
--- `message` string The message. Can be literal or a key for translation.<br>
--- `category?` string Defaults to `FG`.<br>
--- `mode` string `literal` Display the raw text in `args.message`. `localize` Use `args.message` as a localization entry<br>
--- `colour|color` string Refer to `G.C.<colours>` for all available colours.<br>
function FG.FUNCS.card_eval_status_text (args)
	if not type(args) == "table" then return end
	local args = args or {}
	local card = args.card -- Target card
	local eval_type = args.type or "extra"
	local misc_cat = args.category or 'FG'
	local message = args.message or "ERROR"
	local mode = args.mode or "localize"
	local colour = args.colour or args.color or string.upper("orange") -- The color of the square background.
	colour = string.upper(colour)
	
	if not card then error("No target card selected!\nMake sure you specify the target card in the function arguments") return end

	if mode == "literal" then
		card_eval_status_text(card, eval_type, nil, nil, nil,
		{ message = message, colour = G.C[colour] })
	elseif mode == "localize" then
		card_eval_status_text(card, eval_type, nil, nil, nil,
		{ message = localize(message,misc_cat), colour = G.C[colour] })
	end
end
--- Retrieves useful data for the specified card
---@param card table|card  The target card to evaluate
---@return table|nil ret
--- Returns the card's `id`, `rank`, `suit`, if it's a face card, `key` (or enhancement), `edition`, `seal` 
--- and if it's `eternal`, `perishable` and how many rounds it has left, `rental`, buy and sell cost and
--- the `raw` data of the card, or `nil` if no card is passed.
function FG.FUNCS.get_card_info(card)
	if not card then sendWarnMessage("No card was passed.","FG.FUNCS.get_card_info") return nil end
	local ret = {
		id = false,
		rank = false,
		suit = false,
		is_face = false,
		key = false,
		edition = false,
		seal = card.seal or false,
		eternal = false,
		perishable = false,
		perish_tally = 0,
		rental = false,
		unchangeable = false,
		base_cost = card.base_cost or 0,
		cost = card.cost or 0,
		mod_cost = (card.cost - card.base_cost) or 0,
		sell_cost = card.sell_cost or 0,
		raw = card
	}
	
	if card.base then ret.id = card.base.id end
	if card.config then
		if card.config.card then ret.rank = card.config.card.value end
		if card.config.card then ret.suit = card.config.card.suit end
		if ret.id and ret.id >= 11 and ret.id <= 13 then ret.is_face = true end
		if card.config.center then ret.key = card.config.center.key end
	end
	if card.edition then ret.edition = card.edition.key end
	if card.ability then
		if card.ability.eternal then ret.eternal = true end
		if card.ability.perishable then
			ret.perishable = true
			ret.perish_tally = card.ability.perish_tally
		end
		if card.ability.rental then ret.rental = true end
		if card.ability.fg_unchangeable then ret.unchangeable = true end
	end
	return ret
end

---Simple function to check for any given chance.
---@param max number 1 in N chance, where N is `max`
---@return boolean success If the random chance succeeds
function FG.FUNCS.random_chance(max)
	return pseudorandom('mila', G.GAME.probabilities.normal, math.max(max,G.GAME.probabilities.normal,1)) <= G.GAME.probabilities.normal
end

function FG.FUNCS.allow_duplicate (card)
	if not G.jokers then sendWarnMessage("G.jokers doesn't exist!","FG.FUNCS.allow_duplicate") return end
	local found_showman = false
	local found_alternate = false
	for _,v in ipairs(G.jokers.cards) do
		if FG.FUNCS.get_card_info(v).key == "j_ring_master" then found_showman = true break end -- Find showman
		if FG.FUNCS.get_card_info(v).key == FG.FUNCS.get_alternate(FG.FUNCS.get_card_info(card).key,FG.ALTS.joker_equivalents) then found_alternate = true end -- Find alternate card
	end
	if FG.config.duplicated_jokers or found_showman or not found_alternate then return true else return false end
end

local start_run_ref = Game.start_run 

function Game:start_run(args)
	start_run_ref(self,args)
	if G.GAME.pool_flags.alternate_spawn then
		for k, v in pairs(G.P_CENTERS) do
			if string.find(k, 'j_') and not string.find(k, "_fg_") then
				G.P_CENTERS[k]['no_pool_flag'] = 'alternate_spawn'
			end
		end
	end
end

---Allows to easily create multi-line texts.
---@param args {text:table|string,colour:string,scale:number,padding:number,tooltip:{}|nil,align:"tl"|"tm"|"tr"|"cl"|"cm"|"cr"|"bl"|"bm"|"br",mode:"R"|"C"} The settings for the text.
---`text = {"No text"}` is a table (array), each string represents an entire line.
---`colour = "white` is the colour of the text.<br>
---`scale = 0.3` is the size of the text.<br>
---`padding = 0.05` is the distance between lines.<br>
---`tooltip` is a tooltip that will appear when hovering over the text.<br>
---`align = "cm"` sets the alignment of the text. `l`,`m`,`r` for horizontal, `t`,`m`,`b` for vertical alignment.<br>
---`mode = "R"` sets the container alignment for rows or colums.<br>
---
---@return table node The entire node structure. Do note it has a wrapper node.
function FG.FUNCS.UIBox_text (args)
	if not args or not type(args) == "table" then return 
	{ n = G.UIT.R, nodes = {{n = G.UIT.T, config = {text = "ERROR", scale = 0.3, colour = G.C.RED}}}} end
	
	local text = args.text or {"No text"}
	local colour = args.colour or "white"
	local scale = args.scale or 0.3
	local padding = args.padding or 0.05
	local hover = args.tooltip or nil
	local align = args.align or "cm"
	local mode = args.mode or "R"
	
	local ret = {n = G.UIT[string.upper(mode)], config = {padding = padding}, nodes = {}}
	
	if type(text) ~= "table" then return ret end
	for _,text in ipairs(text) do
		local tooltip = nil

		if hover then
			tooltip = {text = {}}
			for _,h_text in ipairs(hover) do
				if h_text == "" then h_text = " " end
				table.insert(tooltip.text,h_text)
			end
		end

		local cur_txt = {n = G.UIT.R, config = {align = align}, nodes = {
			{n = G.UIT.T, config = { text = text, colour = G.C[string.upper(colour)], scale = scale, tooltip = tooltip}}
		}}
		
		table.insert(ret.nodes,cur_txt)
	end

	return ret
end


--- Allows to search for any raw localization file, without formatting
---@param args table
---@return table|string
function FG.FUNCS.localize(args)
	local ret = G.localization
	local function recursive_find(dir,index)
		if index <= #args and dir ~= nil then
			ret = dir[args[index]]
			recursive_find(ret,index+1)
		end
	end
	recursive_find(ret,1)
	return ret
end

-- CALLBACK FUNCTIONS FOR BUTTONS AND SHIT

-- Settings, special edition
G.FUNCS.FG_s_version = function (args)
	FG.config.s_version.selected = args.cycle_config.current_option
	FG.config.s_version.active = args.to_val
end

G.FUNCS.FG_link_website = function(args)
	love.system.openURL(args.config.ref_table)
end
--FG.fuck = 1
function is_alternate(card,table)
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
function get_equivalent(key,table,passing)
	if passing == ("k" or "K" or "Key" or "key") then -- passing key, returning value
		for k,v in pairs(table) do
			if k == key then return v end
		end
	elseif passing == ("v" or "V" or "Value" or "value") then -- passing value, returning key
		for k,v in pairs(table) do
			if v == key then return k end
		end
	end
end

-- Alternates between this card and the associated alternative card.
-- key is the provided card key.
-- table is the reference table to look up.
function alternate_card(key,card,table) 
	local convert = get_equivalent(key,table,is_alternate(key,table))
	local new_card = create_card('Joker', G.jokers, false, nil, true, false, convert, nil)
	new_card:add_to_deck()
	G.jokers:emplace(new_card)
	print("New card generated")
	--local card_edition = card:get_edition()
	--[[if card_edition ~= nil then
		for k,v in pairs(card_edition) do
			print(tostring(k).." | "..tostring(v))
			card_edition = k
			if k == "chip_mod" then new_card:set_edition({foil = true},true,true)
			elseif k == "mult_mod" then new_card:set_edition({holo = true},true,true)
			elseif k == "x_mult_mod" then new_card:set_edition({polychrone = true},true,true) end
			break
		end
	end
	]]
	print(card.edition.key)
	if card.edition and card.edition.key == "e_foil" then new_card:set_edition({foil = true},true,true)
	elseif card.edition and card.edition.key == "e_holo" then new_card:set_edition({holo = true},true,true)
	elseif card.edition and card.edition.key == "e_polychrome" then new_card:set_edition({polychrome = true},true,true)
	elseif card.edition and card.edition.key == "e_negative" then new_card:set_edition({negative = true},true,true)
	elseif card.edition and card.edition.key == "e_fg_polished" then new_card:set_edition("e_fg_polished",true,true)
	else new_card:set_edition(nil,true,true)
	end
	card:start_dissolve(nil,false,0,true)
end
-- Missing: Delete original card, transfer all enhancements, editions, etc to the new card.

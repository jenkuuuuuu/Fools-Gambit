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
-- card is the card instance you are dealing with. 99% of the time it will be just card (the one provided you by the function)
-- table is the reference table to look up and compare.
function alternate_card(key,card,table) 
	local convert = get_equivalent(key,table,is_alternate(key,table))
	local new_card = create_card('Joker', G.jokers, false, nil, true, false, convert, nil)
	new_card:add_to_deck()
	G.jokers:emplace(new_card)
	if card.edition then
		new_card:set_edition(tostring(card.edition.key),true,true)
	end
	card:start_dissolve(nil,false,0,true)
end
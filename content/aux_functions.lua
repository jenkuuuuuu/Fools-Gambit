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
function alternate_card(card,table,passing) 
	local convert = get_equivalent(card.key,table,passing)
	local card = create_card('Joker', G.jokers, false, nil, true, false, convert, nil)
	card:add_to_deck()
	G.jokers:emplace(card)
end
-- Missing: Delete original card, transfer all enhancements, editions, etc to the new card.

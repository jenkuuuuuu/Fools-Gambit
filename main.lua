-- This is in preparation for file splitting. I'll do that later. - Jogla
-- im splitting jokers and stuff into sections to make this easier later - jenku
local mod_contents = {
	"jokers",
	"editions"
}

for k, v in pairs(mod_contents) do -- Load this mod's files
	assert(SMODS.load_file('/content/'..v..'.lua'))()
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
function alternate_card(card,table,passing) 
	local convert = get_equivalent(card.key,table,passing)
	local card = create_card('Joker', G.jokers, false, nil, true, false, convert, nil)
	card:add_to_deck()
	G.jokers:emplace(card)
end
-- Missing: Delete original card, transfer all enhancements, editions, etc to the new card.



local joker_equivalents = {
	["j_fg_t1"] = "j_fg_t2"
}


SMODS.Joker {
	key = 't1',
	loc_txt = {
		name = 'Test 1',
		text = {
			"Should become Test 2 when sold"
		}
	},
	config = { extra = {} },
	rarity = 1,
	atlas = 'jokers',
	pos = { x = 1, y = 0 },
	cost = 0,
	calculate = function(self, card, context)
		if context.selling_self then
			alternate_card(self,joker_equivalents,"k")
		end
	end
}

SMODS.Joker {
	key = 't2',
	loc_txt = {
		name = 'Test 2',
		text = {
			"Should become Test 1 when sold"
		}
	},
	config = { extra = {} },
	rarity = 1,
	cost = 0,
	calculate = function(self, card, context)
		if context.selling_self then
			alternate_card(self,joker_equivalents,"v")
		end
	end
}

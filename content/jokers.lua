SMODS.Atlas {
	key = "jokers",
	path = "jokers.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "jokers_alt",
	path = "jokers_alt.png",
	px = 71,
	py = 95
}

-- All joker equivalents. Format is: original <> alternate
joker_equivalents = {
	["j_fg_t1"] = "j_fg_t2",
	["j_fg_flippedscript"] = "j_fg_flippedscriptALT",
	["j_joker"] = "j_fg_joker"
}

--
-- Flipped Script (Normal and Alternate)
--

SMODS.Joker {
	key = 'flippedscript',
	loc_txt = {
		name = 'Flipped Script',
		text = {
			"When sold, changes all {C:purple}Alternate{}",
			"{C:attention}Jokers{} to their {C:red}Original{}"
		}
	},
	config = { extra = {} },
	rarity = 3,
	atlas = 'jokers',
	pos = { x = 0, y = 0 },
	cost = 8,
	calculate = function(self, card, context)
		if context.selling_self then
			G.E_MANAGER:add_event(Event({
				func = function()
					for i in ipairs(G.jokers.cards) do
						local currentCard = G.jokers.cards[i]
                        if is_alternate(currentCard.config.center_key, joker_equivalents) == "v" then
                            alternate_card(currentCard.config.center_key, joker_equivalents)
                            currentCard:start_dissolve(nil,false,0,true)
                        end
					end
					return true
				end
			}))
		end
	end
}


SMODS.Joker {
	key = 'flippedscriptALT',
	loc_txt = {
		name = 'Flipped Script',
		text = {
			"When sold, changes all {C:red}Original{}",
			"{C:attention}Jokers{} to their {C:purple}Alternate{}"
		}
	},
	config = { extra = {} },
	rarity = 2,
	atlas = 'jokers',
	pos = { x = 0, y = 0 },
	cost = 4,
	calculate = function(self, card, context)
		if context.selling_self then
			G.E_MANAGER:add_event(Event({
				func = function()
					for i in ipairs(G.jokers.cards) do
						local currentCard = G.jokers.cards[i]
                        if is_alternate(currentCard.config.center_key, joker_equivalents) == "k" then
                            alternate_card(currentCard.config.center_key, joker_equivalents)
                            currentCard:start_dissolve(nil,false,0,true)		
                        end
					end
					return true
				end
			}))
		end
	end
}

-- 
-- Script Flipped
--

SMODS.Joker {
	key = 'NOTflippedscript',
	loc_txt = {
		name = 'NOTFlipped Script',
		text = {
			"When sold, changes the edition of",
			"all other jokers to the opposite edition."
		}
	},
	config = { extra = {} },
	rarity = 3,
	atlas = 'jokers',
	pos = { x = 1, y = 0 },
	cost = 8,
	calculate = function(self, card, context)
		if context.selling_self then
			G.E_MANAGER:add_event(Event({
				func = function()
					
					sendInfoMessage("Should be changing if i did it right", "MyInfoLogger")
					for i in ipairs(G.jokers.cards) do
						local currentCard = G.jokers.cards[i]
						-- this kinda jank but it works (i couldnt figure out how to do this with an array :( )
						if currentCard.edition then
							if currentCard.edition.negative then
								currentCard:set_edition(nil, true)
							elseif currentCard.edition.polychrome then
								currentCard:set_edition("e_fg_polished", true)
							elseif currentCard.edition.fg_polished then
								currentCard:set_edition("e_polychrome", true)
							elseif currentCard.edition.holo then
								currentCard:set_edition("e_foil", true)
							elseif currentCard.edition.foil then
								currentCard:set_edition("e_holo", true)
							end							
						else
							currentCard:set_edition("e_negative", true)
                        end
						-- if wanting to add an edition to cards without one just add it as an else to the g.joker.cards[i].edition
					end
					return true
				end
			}))
		end
	end
}


-- Testing jokers. Will be removed in a future version.

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
			alternate_card(self.key,joker_equivalents)
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
			alternate_card(self.key,card,joker_equivalents)
		end
	end
}


SMODS.Joker {
	key = 'joker',
	loc_txt = {
		name = 'Joker?',
		text = {
			"???"
		}
	},
	config = { extra = {} },
	rarity = 1,
	cost = 0,
	calculate = function(self, card, context)
		if context.joker_main then
			
		end
		if context.selling_self then
			print(self.key)
			alternate_card(self.key,card,joker_equivalents)
		end
	end
}

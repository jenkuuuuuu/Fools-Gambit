SMODS.Atlas {
	key = "jokers",
	path = "jokers.png",
	px = 71,
	py = 95
}

-- 
-- NOT Flipped Script im SLOW 
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

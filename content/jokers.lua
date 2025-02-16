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
	["j_joker"] = "j_fg_joker",
	["j_misprint"] = "j_fg_misprint",
	["j_banner"] = "j_fg_banner",
	["j_scary_face"] = "j_fg_face",
	["j_mystic_summit"] = "j_fg_summit",
	["j_ceremonial"] = "j_fg_dagger",
	["j_fibonacci"] = "j_fg_fibonacci"
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
                            alternate_card(currentCard.config.center_key, card, joker_equivalents)
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
                            alternate_card(currentCard.config.center_key, card, joker_equivalents)
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

SMODS.Joker {
	key = 'joker',
	loc_txt = {
		name = 'Joker?',
		text = {
			"Every card played",
			"gives {C:mult}+#1#{} Mult."
		}
	},
	config = { extra = {mult = 0.5} },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	pos = { x = 0, y = 0 },
	cost = 2,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			return {
				mult_mod = card.ability.extra.mult,
				message = "+" .. card.ability.extra.mult,
				colour = G.C.MULT
			}
		end
	end
}

SMODS.Joker {
	key = 'dagger',
	loc_txt = {
		name = 'Ceremonial Dagger?',
		text = {
			 "When {C:attention}Blind{} is selected,",
             "destroy Joker to the left",
             "and permanently add {C:attention}X#2#",
             "its sell value to this {C:chips}Chips",
             "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
		}
	},
	config = { extra = {chips = 0, mult = 4} },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	pos = { x = 5, y = 5 },
	cost = 2,
	calculate = function(self, card, context)
		if context.setting_blind and not self.getting_sliced then
			 local my_pos = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then my_pos = i; break end
                end
                if my_pos and G.jokers.cards[my_pos-1] and not self.getting_sliced and not G.jokers.cards[my_pos-1].ability.eternal and not G.jokers.cards[my_pos-1].getting_sliced then 
                    local sliced_card = G.jokers.cards[my_pos-1]
                    sliced_card.getting_sliced = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.joker_buffer = 0
                        card.ability.extra.chips = card.ability.extra.chips + sliced_card.sell_cost*card.ability.extra.mult
                        card:juice_up(0.8, 0.8)
                        sliced_card:start_dissolve({HEX("57ecab")}, nil, 1.6)
                        play_sound('slice1', 0.96+math.random()*0.08)
                    return true end }))
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips+card.ability.extra.mult*sliced_card.sell_cost}}, colour = G.C.CHIPS, no_juice = true})
			end
		end
		if context.joker_main and card.ability.extra.chips > 0 then
		return {
		chip_mod = card.ability.extra.chips,
		colour = G.C.CHIPS,
		message = '+' .. card.ability.extra.chips
	}
	end
	end
}

SMODS.Joker {
	key = 'banner',
	loc_txt = {
		name = 'Banner?',
		text = {
		       "{C:red}+#2#{} discards",
			   "{C:chips}+#1#{} Chips for",
               "each remaining",
               "{C:attention}discard",
		}
	},
	config = { extra = {chips = 20, discards = 1} },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.discards } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	pos = { x = 1, y = 2 },
	cost = 2,
	calculate = function(self, card, context)
	if context.setting_blind then
	 G.E_MANAGER:add_event(Event({func = function()
                    ease_discard(card.ability.extra.discards)
                return true end }))
			end
		if context.joker_main and G.GAME.current_round.discards_left > 0 then
			return {
                    chips = G.GAME.current_round.discards_left*card.ability.extra.chips,
					colour = G.C.CHIPS
			}
		end
	end
}

SMODS.Joker {
	key = 'summit',
	loc_txt = {
		name = 'Mystic Summit?',
		text = {
		         "{C:red}-#2#{} discards",
				 "{C:mult}+#1#{} Mult when",
                 "{C:attention}#3#{} discards",
                 "remaining",
		}
	},
	config = { extra = {mult = 30, discards = 1, discards2 = 0} },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.discards, card.ability.extra.discards2 } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	pos = { x = 2, y = 2 },
	cost = 2,
	calculate = function(self, card, context)
	if context.setting_blind then
	 G.E_MANAGER:add_event(Event({func = function()
                    ease_discard(-card.ability.extra.discards)
                return true end }))
			end
		if context.joker_main and G.GAME.current_round.discards_left == card.ability.extra.discards2 then
			return {
                    mult_mod = card.ability.extra.mult,
					colour = G.C.MULT,
					message = "+" .. card.ability.extra.mult
			}
		end
	end
}

SMODS.Joker {
  key = 'misprint',
  rarity = 2,
  cost = 6,
  atlas = "jokers_alt",
  loc_txt = {
		name = 'Misprint?',
		text = {
		        "{X:mult,C:white}X#1#{} Mult"
		}
	},
  pos = { x = 6 , y = 2},
  config = {  extra = { 
    Xmult = 1,
    Xmult_min = 75,
    Xmult_max = 200,
            } },
  loc_vars = function(self, info_queue, card)
    return { vars = {
        card.ability.extra.Xmult,
        card.ability.extra.Xmult_min,
        card.ability.extra.Xmult_max
    } }
  end,
  calculate = function (self, card, context)
    if G.jokers then
    card.ability.extra.Xmult = (pseudorandom('misprint', card.ability.extra.Xmult_min, card.ability.extra.Xmult_max)/100)
	end
	if context.joker_main then
            return {
                     mult_mod = card.ability.extra.Xmult,
					 message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } }
                   }
    end
  end
}

SMODS.Joker {
  key = 'face',
  rarity = 1,
  cost = 2,
  atlas = 'jokers_alt',
  pos = { x = 2 , y = 3},
  config = {  extra = { chips = 0, chip_gain = 15 } },
  loc_txt = {
  name = 'Scary face?',
  text = {
  'Gains {C:chips}+#2#{} chips per scored {C:attention}face{} card',
  'Currently {C:chips}+#1#{} chips.'
  },
  },
  loc_vars = function(self, info_queue, card)
    return { vars = {
        card.ability.extra.chips,
		card.ability.extra.chip_gain
    } }
  end,
  calculate = function (self, card, context)
     if context.individual and context.cardarea == G.play and context.other_card:is_face() then
	card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
	end
	if context.joker_main and card.ability.extra.chips > 0 then
      return {
        chip_mod = card.ability.extra.chips,
        message = '+' .. card.ability.extra.chips
      }
    end
end
}

SMODS.Joker {
    key = 'fist',
    loc_txt = {
        name = 'Raised Fist?',
        text = {
            "Adds {C:attention}#1#{} the rank",
            "of {C:attention}highest{} ranked card",
            "held in hand to Mult",
        }
    },
    config = { extra = {mult = 0.5} },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    rarity = 1,
    atlas = 'jokers_alt',
    pos = { x = 8, y = 2 },
    cost = 2,
    calculate = function(self, card, context)
        if context.cardarea == G.hand then
            local temp_Mult = 1
			local temp_ID = 1
			local raised_card = nil
			for i=1, #G.hand.cards do
					if temp_ID <= G.hand.cards[i].base.id and G.hand.cards[i].ability.effect ~= 'Stone Card' then 
					temp_Mult = G.hand.cards[i].base.nominal
					temp_ID = G.hand.cards[i].base.id 
					raised_card = G.hand.cards[i]
				end
			end
			if raised_card and context.repetition and context.cardarea == G.play then
				return {
					h_mult = card.ability.extra.mult/2,
					card = card,
				}
        	end
    	end
	end
}

SMODS.Joker {
	key = 'fibonacci',
	rarity = 1,
	cost = 2,
	atlas = 'jokers_alt',
	pos = { x = 1 , y = 5 },
	config = { extra = { retriggers = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = {
		  card.ability.extra.retriggers
		  } }
	end,
	loc_txt = {
		name = 'Fibonacci?',
		text = {
			"Retrigger each played {C:attention}Ace{},",
			"{C:attention}2{}, {C:attention}3{}, {C:attention}5{}, or {C:attention}8{}",
			"{C:attention}1{} time and permanently",
			"upgrades to next rank when scored",
		},
	},
	calculate = function (self, card, context)
		if context.repetition and context.cardarea == G.play and
			(context.other_card:get_id() == 14 or -- ACE
			context.other_card:get_id() == 2 or
			context.other_card:get_id() == 3 or
			context.other_card:get_id() == 5 or
			context.other_card:get_id() == 8 or
			context.other_card:get_id() == 12) then
			return {
				repetitions = 1,
				card = card
			}
		end
		if context.after then
			for k,v in ipairs(context.scoring_hand) do
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = .1,
					func = function()
						if v.base.value == "Ace" then SMODS.change_base(v,v.base.suit,"2") v:flip() 
						elseif v.base.value == "2" then SMODS.change_base(v,v.base.suit,"3") v:flip()
						elseif v.base.value == "3" then SMODS.change_base(v,v.base.suit,"5") v:flip()
						elseif v.base.value == "5" then SMODS.change_base(v,v.base.suit,"8") v:flip()
						elseif v.base.value == "8" then v:flip()
						end
						return true
					end
				}))
			end
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = .4,
				func = function() return true end
			}))
			for _,v in ipairs(context.scoring_hand) do
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.1,
					func = function()
						if v.base.value == "Ace" or
						v.base.value == "2" or
						v.base.value == "3" or
						v.base.value == "5" or
						v.base.value == "8" then
							v:flip()
						end
						return true
					end
				}))
			end
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 1,
				func = function() return true end
			}))
		end
  	end
}

-- STILL NEEDS WORK. DO NOT UNCOMMENT -Jogla

--[[ 
SMODS.Joker {
	key = 'mr_bones',
	rarity = 3,
	cost = 2,
	atlas = 'jokers_alt',
	pos = { x = 3 , y = 4 },
	config = {  extra = {
		destroy_chance = 1,
		total_chance = 2,
	} },
	loc_txt = {
	name = 'Mr. Bones?',
	text = {
		"Gives {C:chips}+1{} hand and {C:mult}+1{} discard",
		"if chips scored are at least {C:attention}25%{} of",
		"required chips when playing final hand.",
		"{C:green}1 in 2{} chance this card ",
		"gets destroyed when triggered."
	},
	},
	calculate = function (self, card, context)
		if context.joker_main and G.GAME.current_round.hands_left == 0 then
			print("TEST!")
			G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + 1
			G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 1
			return {
				message = localize('k_saved_ex'),
				colour = G.C.RED
			}
		end
		if context.after and context.cardarea == G.jokers and G.GAME.chips < G.GAME.blind.chips then
			print(G.GAME.chips)
			print(G.GAME.blind.chips)
			local dissolve = 2
			dissolve = pseudorandom('sans', 1, 2)
			print (dissolve)
			if dissolve == 1 then card:start_dissolve() end
		end
		if context.end_of_round and G.GAME.chips < G.GAME.blind.chips then
		end
  	end
}
]]
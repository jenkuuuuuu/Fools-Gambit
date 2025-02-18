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

SMODS.Atlas {
    key = 'deathmodereal',
	path = 'deathmodereal2.png',
	px = 71,
	py = 95
}

SMODS.Atlas {
    key = 'deathmoderealalt',
	path = 'deathmodereal2a.png',
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
	["j_fibonacci"] = "j_fg_fibonacci",
	["j_8_ball"] = "j_fg_8ball",
	["j_abstract"] = "j_fg_abstract",
	["j_fg_deathmodereal"] = "j_fg_deathmoderealalt",
	["j_jolly"] = "j_fg_jolly",
	["j_zany"] = "j_fg_zany",
	["j_mad"] = "j_fg_mad",
	["j_crazy"] = "j_fg_crazy",
	["j_droll"] = "j_fg_droll",
	["j_sly"] = "j_fg_sly",
	["j_wily"] = "j_fg_wily",
	["j_clever"] = "j_fg_clever",
	["j_devious"] = "j_fg_devious",
	["j_crafty"] = "j_fg_crafty",
	["j_duo"] = "j_fg_duo",
	["j_trio"] = "j_fg_trio",
	["j_family"] = "j_fg_family",
	["j_order"] = "j_fg_order",
	["j_loyalty_card"] = "j_fg_loyalty",
	["j_greedy_joker"] = "j_fg_greedy",
	["j_lusty_joker"] = "j_fg_lusty",
	["j_wrathful_joker"] = "j_fg_wrathful",
	["j_gluttenous_joker"] = "j_fg_gluttenous",
	["j_egg"] = "j_fg_egg"
}

-- wouldnt it be funny if instead of having a big ass table we just. found the alternate by swapping out j_ with j_fg_
-- i will work on that later
-- i want to do more. better. i am Tweaking



SMODS.Joker {
	key = 'changeofpace',
	loc_txt = {
		name = 'Change of Pace',
		text = {
			"After being sold, change {C:red}everything{}",
			"to it's {C:purple}Alternate{} form."
		}
	},
	config = { extra = {} },
	rarity = "fg_rare",
	atlas = 'jokers',
	pos = { x = 0, y = 0 }, -- havent added the sprite to the sheet yet 
	cost = 8,
	calculate = function(self, card, context)
		if context.selling_self then
			G.E_MANAGER:add_event(Event({
				func = function()
					change_pace() -- unfinished, should work for making alternates appear in shop but doesnt make original cards stop (i cant figure out how to change the weight of the rarities)
					return true
				end
			}))
		end
	end
}

SMODS.Joker {
	key = 'changeofpacealt',
	loc_txt = {
		name = 'Change of Pace?',
		text = {
			"After being sold, change {C:purple}everything{}",
			"back to it's {C:red}Original{} form."
		}
	},
	config = { extra = {} },
	rarity = "fg_uncommon",
	atlas = 'jokers',
	pos = { x = 0, y = 0 }, -- read above
	cost = 8,
	calculate = function(self, card, context)
		if context.selling_self then
			G.E_MANAGER:add_event(Event({
				func = function()
					change_pace() -- read above
					return true
				end
			}))
		end
	end
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
	rarity = "fg_rare",
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
	rarity = "fg_rare",
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
						flip_editions(currentCard)
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
	rarity = "fg_common",
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
	rarity = "fg_common",
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
	rarity = "fg_common",
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
	rarity = "fg_common",
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
  rarity = "fg_uncommon",
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
  rarity = "fg_common",
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
  key = '8ball',
  rarity = "fg_common",
  cost = 2,
  atlas = 'jokers_alt',
  pos = { x = 0 , y = 5},
  config = {  extra = { chips = 0, chip_gain = 15 } },
  loc_txt = {
  name = '8 Ball?',
  text = {
                    "Each played {C:attention}8{} creates a",
                    "{C:tarot}Tarot{} card when scored",
                    "{C:inactive}(Must have room)",
  },
  },
  calculate = function (self, card, context)
     if context.cardarea == G.play and context.individual and (context.other_card:get_id() == 8) then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        return {
                            extra = {focus = card, message = localize('k_plus_tarot'), func = function()
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'before',
                                    delay = 0.0,
                                    func = (function()
                                            local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, '8ba')
                                            card:add_to_deck()
                                            G.consumeables:emplace(card)
                                            G.GAME.consumeable_buffer = 0
                                        return true
                                    end)}))
                            end},
                            colour = G.C.SECONDARY_SET.Tarot,
                            card = card
                        }
                    end
				end
}

SMODS.Joker {
  key = 'abstract',
  rarity = "fg_common",
  cost = 2,
  atlas = 'jokers_alt',
  pos = { x = 3 , y = 3},
  config = {  extra = { mult_gain = 10, mult = 0, sold = 0 } },
  loc_txt = {
  name = 'Abstract Joker?',
  text = {
  "{C:mult}+#1#{} Mult for",
  "each {C:attention}Joker{} card Sold",
  "{C:inactive}(Currently {C:red}+#2#{C:inactive} Mult)",
  },
  },
  loc_vars = function(self, info_queue, card)
    return { vars = {
        card.ability.extra.mult_gain,
		card.ability.extra.mult
    } }
  end,
  calculate = function (self, card, context)
    if context.selling_card and not context.repetition then
	card.ability.extra.sold = card.ability.extra.sold + 1
	card.ability.extra.mult = card.ability.extra.mult_gain * card.ability.extra.sold
	end
	if context.joker_main then
	return {
	mult = card.ability.extra.mult
	}
	end
end
}

SMODS.Joker {
	key = 'jolly',
	loc_txt = {
		 name = 'Jolly Joker?',
         text = {
     "{C:red}+#1#{} Mult and",
	 "retrigger scoring cards {C:attention}#3#{} time",
     "if played hand contains",
     "a {C:attention}#2#",
		}
	},
	config = {t_mult = 4, type = 'Pair', extra = { repetitions = 1}},
	  loc_vars = function(self, info_queue, card)
	return { vars = {card.ability.t_mult, localize(card.ability.type, 'poker_hands'), card.ability.extra.repetitions}}
	end,
	rarity = "fg_common",
	atlas = 'jokers_alt',
	pos = { x = 2, y = 0 },
	cost = 2,
	calculate = function(self, card, context)
	if context.repetition and context.cardarea == G.play then
	if (next(context.poker_hands[card.ability.type])) then
	return {
	message = localize('k_again_ex'),
    repetitions = card.ability.extra.repetitions,
    card = card
	}
	end
	end
	end
}

SMODS.Joker {
	key = 'zany',
	loc_txt = {
		 name = 'Zany Joker?',
         text = {
     "{C:red}+#1#{} Mult and",
	 "retrigger scoring cards {C:attention}#3#{} time",
     "if played hand contains",
     "a {C:attention}#2#",
		}
	},
	config = {t_mult = 6, type = 'Three of a Kind', extra = { repetitions = 1}},
	  loc_vars = function(self, info_queue, card)
	return { vars = {card.ability.t_mult, localize(card.ability.type, 'poker_hands'), card.ability.extra.repetitions}}
	end,
	rarity = "fg_common",
	atlas = 'jokers_alt',
	pos = { x = 3, y = 0 },
	cost = 2,
	calculate = function(self, card, context)
	if context.repetition and context.cardarea == G.play then
	if (next(context.poker_hands[card.ability.type])) then
	return {
	message = localize('k_again_ex'),
    repetitions = card.ability.extra.repetitions,
    card = card
	}
	end
	end
	end
}

SMODS.Joker {
	key = 'mad',
	loc_txt = {
		 name = 'Mad Joker?',
         text = {
     "{C:red}+#1#{} Mult and",
	 "retrigger scoring cards {C:attention}#3#{} time",
     "if played hand contains",
     "a {C:attention}#2#",
		}
	},
	config = {t_mult = 5, type = 'Two Pair', extra = { repetitions = 1}},
	  loc_vars = function(self, info_queue, card)
	return { vars = {card.ability.t_mult, localize(card.ability.type, 'poker_hands'), card.ability.extra.repetitions}}
	end,
	rarity = "fg_common",
	atlas = 'jokers_alt',
	pos = { x = 4, y = 0 },
	cost = 2,
	calculate = function(self, card, context)
	if context.repetition and context.cardarea == G.play then
	if (next(context.poker_hands[card.ability.type])) then
	return {
	message = localize('k_again_ex'),
    repetitions = card.ability.extra.repetitions,
    card = card
	}
	end
	end
	end
}

SMODS.Joker {
	key = 'crazy',
	loc_txt = {
		 name = 'Crazy Joker?',
         text = {
     "{C:red}+#1#{} Mult and",
	 "retrigger scoring cards {C:attention}#3#{} time",
     "if played hand contains",
     "a {C:attention}#2#",
		}
	},
	config = {t_mult = 6, type = 'Straight', extra = { repetitions = 1}},
	  loc_vars = function(self, info_queue, card)
	return { vars = {card.ability.t_mult, localize(card.ability.type, 'poker_hands'), card.ability.extra.repetitions}}
	end,
	rarity = "fg_common",
	atlas = 'jokers_alt',
	pos = { x = 5, y = 0 },
	cost = 2,
	calculate = function(self, card, context)
	if context.repetition and context.cardarea == G.play then
	if (next(context.poker_hands[card.ability.type])) then
	return {
	message = localize('k_again_ex'),
    repetitions = card.ability.extra.repetitions,
    card = card
	}
	end
	end
	end
}

SMODS.Joker {
	key = 'droll',
	loc_txt = {
		 name = 'Droll Joker?',
         text = {
     "{C:red}+#1#{} Mult and",
	 "retrigger scoring cards {C:attention}#3#{} time",
     "if played hand contains",
     "a {C:attention}#2#",
		}
	},
	config = {t_mult = 5, type = 'Flush', extra = { repetitions = 1}},
	  loc_vars = function(self, info_queue, card)
	return { vars = {card.ability.t_mult, localize(card.ability.type, 'poker_hands'), card.ability.extra.repetitions}}
	end,
	rarity = "fg_common",
	atlas = 'jokers_alt',
	pos = { x = 6, y = 0 },
	cost = 2,
	calculate = function(self, card, context)
	if context.repetition and context.cardarea == G.play then
	if (next(context.poker_hands[card.ability.type])) then
	return {
	message = localize('k_again_ex'),
    repetitions = card.ability.extra.repetitions,
    card = card
	}
	end
	end
	end
}

SMODS.Joker {
	key = 'sly',
	loc_txt = {
		 name = 'Sly Joker?',
         text = {
     "{C:chips}+#1#{} Chips and",
	 "retrigger scoring cards {C:attention}#3#{} time",
     "if played hand contains",
     "a {C:attention}#2#",
		}
	},
	config = {t_chips = 25, type = 'Pair', extra = { repetitions = 1}},
	  loc_vars = function(self, info_queue, card)
	return { vars = {card.ability.t_chips, localize(card.ability.type, 'poker_hands'), card.ability.extra.repetitions}}
	end,
	rarity = "fg_common",
	atlas = 'jokers_alt',
	pos = { x = 0, y = 14 },
	cost = 2,
	calculate = function(self, card, context)
	if context.repetition and context.cardarea == G.play then
	if (next(context.poker_hands[card.ability.type])) then
	return {
	message = localize('k_again_ex'),
    repetitions = card.ability.extra.repetitions,
    card = card
	}
	end
	end
	end
}

SMODS.Joker {
	key = 'wily',
	loc_txt = {
		 name = 'Wily Joker?',
         text = {
     "{C:chips}+#1#{} Chips and",
	 "retrigger scoring cards {C:attention}#3#{} time",
     "if played hand contains",
     "a {C:attention}#2#",
		}
	},
	config = {t_chips = 50, type = 'Three of a Kind', extra = { repetitions = 1}},
	  loc_vars = function(self, info_queue, card)
	return { vars = {card.ability.t_chips, localize(card.ability.type, 'poker_hands'), card.ability.extra.repetitions}}
	end,
	rarity = "fg_common",
	atlas = 'jokers_alt',
	pos = { x = 1, y = 14 },
	cost = 2,
	calculate = function(self, card, context)
	if context.repetition and context.cardarea == G.play then
	if (next(context.poker_hands[card.ability.type])) then
	return {
	message = localize('k_again_ex'),
    repetitions = card.ability.extra.repetitions,
    card = card
	}
	end
	end
	end
}

SMODS.Joker {
	key = 'clever',
	loc_txt = {
		 name = 'Clever Joker?',
         text = {
     "{C:chips}+#1#{} Chips and",
	 "retrigger scoring cards {C:attention}#3#{} time",
     "if played hand contains",
     "a {C:attention}#2#",
		}
	},
	config = {t_chips = 40, type = 'Two Pair', extra = { repetitions = 1}},
	  loc_vars = function(self, info_queue, card)
	return { vars = {card.ability.t_chips, localize(card.ability.type, 'poker_hands'), card.ability.extra.repetitions}}
	end,
	rarity = "fg_common",
	atlas = 'jokers_alt',
	pos = { x = 2, y = 14 },
	cost = 2,
	calculate = function(self, card, context)
	if context.repetition and context.cardarea == G.play then
	if (next(context.poker_hands[card.ability.type])) then
	return {
	message = localize('k_again_ex'),
    repetitions = card.ability.extra.repetitions,
    card = card
	}
	end
	end
	end
}

SMODS.Joker {
	key = 'devious',
	loc_txt = {
		 name = 'Devious Joker?',
         text = {
     "{C:chips}+#1#{} Chips and",
	 "retrigger scoring cards {C:attention}#3#{} time",
     "if played hand contains",
     "a {C:attention}#2#",
		}
	},
	config = {t_chips = 50, type = 'Straight', extra = { repetitions = 1}},
	  loc_vars = function(self, info_queue, card)
	return { vars = {card.ability.t_chips, localize(card.ability.type, 'poker_hands'), card.ability.extra.repetitions}}
	end,
	rarity = "fg_common",
	atlas = 'jokers_alt',
	pos = { x = 3, y = 14 },
	cost = 2,
	calculate = function(self, card, context)
	if context.repetition and context.cardarea == G.play then
	if (next(context.poker_hands[card.ability.type])) then
	return {
	message = localize('k_again_ex'),
    repetitions = card.ability.extra.repetitions,
    card = card
	}
	end
	end
	end
}

SMODS.Joker {
	key = 'crafty',
	loc_txt = {
		 name = 'Crafty Joker?',
         text = {
     "{C:chips}+#1#{} Chips and",
	 "retrigger scoring cards {C:attention}#3#{} time",
     "if played hand contains",
     "a {C:attention}#2#",
		}
	},
	config = {t_chips = 40, type = 'Flush', extra = { repetitions = 1}},
	  loc_vars = function(self, info_queue, card)
	return { vars = {card.ability.t_chips, localize(card.ability.type, 'poker_hands'), card.ability.extra.repetitions}}
	end,
	rarity = "fg_common",
	atlas = 'jokers_alt',
	pos = { x = 4, y = 14 },
	cost = 2,
	calculate = function(self, card, context)
	if context.repetition and context.cardarea == G.play then
	if (next(context.poker_hands[card.ability.type])) then
	return {
	message = localize('k_again_ex'),
    repetitions = card.ability.extra.repetitions,
    card = card
	}
	end
	end
	end
}

SMODS.Joker {
	key = 'duo',
	loc_txt = {
		 name = 'The Duo?',
         text = {
    "Gains {X:mult,C:white}X#1#{} Mult if played",
    "hand contains",
    "a {C:attention}#2#",
	"{C:inactive}(Currently {X:mult,C:white}X#3#{}{C:inactive} Mult)",
		}
	},
	config = {type = 'Pair', extra = { Xmult_mod = 0.1, Xmult = 1}},
	  loc_vars = function(self, info_queue, card)
	return { vars = {card.ability.extra.Xmult_mod, localize(card.ability.type, 'poker_hands'), card.ability.extra.Xmult}}
	end,
	rarity = "fg_common",
	atlas = 'jokers_alt',
	pos = { x = 5, y = 4 },
	cost = 2,
	calculate = function(self, card, context)
	if context.before and context.cardarea == G.jokers and not context.repetition then
	if (next(context.poker_hands[card.ability.type])) then
	card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
	end
	end
	if context.joker_main then
	if card.ability.extra.Xmult > 0 then
	return {
	Xmult = card.ability.extra.Xmult
	}
	end
	end
	end
}

SMODS.Joker {
	key = 'trio',
	loc_txt = {
		 name = 'The Trio?',
         text = {
    "Gains {X:mult,C:white}X#1#{} Mult if played",
    "hand contains",
    "a {C:attention}#2#",
	"{C:inactive}(Currently {X:mult,C:white}X#3#{}{C:inactive} Mult)",
		}
	},
	config = {type = 'Three of a Kind', extra = { Xmult_mod = 0.15, Xmult = 1}},
	  loc_vars = function(self, info_queue, card)
	return { vars = {card.ability.extra.Xmult_mod, localize(card.ability.type, 'poker_hands'), card.ability.extra.Xmult}}
	end,
	rarity = "fg_common",
	atlas = 'jokers_alt',
	pos = { x = 6, y = 4 },
	cost = 2,
	calculate = function(self, card, context)
	if context.before and context.cardarea == G.jokers and not context.repetition then
	if (next(context.poker_hands[card.ability.type])) then
	card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
	end
	end
	if context.joker_main then
	if card.ability.extra.Xmult > 0 then
	return {
	Xmult = card.ability.extra.Xmult
	}
	end
	end
	end
}

SMODS.Joker {
	key = 'family',
	loc_txt = {
		 name = 'The Family?',
         text = {
    "Gains {X:mult,C:white}X#1#{} Mult if played",
    "hand contains",
    "a {C:attention}#2#",
	"{C:inactive}(Currently {X:mult,C:white}X#3#{}{C:inactive} Mult)",
		}
	},
	config = {type = 'Four of a Kind', extra = { Xmult_mod = 0.2, Xmult = 1}},
	  loc_vars = function(self, info_queue, card)
	return { vars = {card.ability.extra.Xmult_mod, localize(card.ability.type, 'poker_hands'), card.ability.extra.Xmult}}
	end,
	rarity = "fg_common",
	atlas = 'jokers_alt',
	pos = { x = 7, y = 4 },
	cost = 2,
	calculate = function(self, card, context)
	if context.before and context.cardarea == G.jokers and not context.repetition then
	if (next(context.poker_hands[card.ability.type])) then
	card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
	end
	end
	if context.joker_main then
	if card.ability.extra.Xmult > 0 then
	return {
	Xmult = card.ability.extra.Xmult
	}
	end
	end
	end
}

SMODS.Joker {
	key = 'order',
	loc_txt = {
		 name = 'The Order?',
         text = {
    "Gains {X:mult,C:white}X#1#{} Mult if played",
    "hand contains",
    "a {C:attention}#2#",
	"{C:inactive}(Currently {X:mult,C:white}X#3#{}{C:inactive} Mult)",
		}
	},
	config = {type = 'Straight', extra = { Xmult_mod = 0.15, Xmult = 1}},
	  loc_vars = function(self, info_queue, card)
	return { vars = {card.ability.extra.Xmult_mod, localize(card.ability.type, 'poker_hands'), card.ability.extra.Xmult}}
	end,
	rarity = "fg_common",
	atlas = 'jokers_alt',
	pos = { x = 8, y = 4 },
	cost = 2,
	calculate = function(self, card, context)
	if context.before and context.cardarea == G.jokers and not context.repetition then
	if (next(context.poker_hands[card.ability.type])) then
	card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
	end
	end
	if context.joker_main then
	if card.ability.extra.Xmult > 0 then
	return {
	Xmult = card.ability.extra.Xmult
	}
	end
	end
	end
}

SMODS.Joker {
    key = 'loyalty',
    loc_txt = {
        name = 'Loyalty Card?',
        text = {
             "Every {C:attention}#1#{} items",
             "purchased from the {C:attention}shop{} makes",
             "the next one {C:money}free{}",
             "{C:inactive}#2#",
        }
    },
    config = { loyalty_remaining = 10, extra = {item_amount = 10} },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.item_amount, localize{type = 'variable', key = (card.ability.loyalty_remaining == 0 and 'loyalty_active' or 'loyalty_inactive'), vars = {card.ability.loyalty_remaining} } }}
    end,
    rarity = "fg_common",
    atlas = 'jokers_alt',
    pos = { x = 4, y = 2 },
    cost = 2,
    calculate = function(self, card, context)
        if context.buying_card then
         card.ability.loyalty_remaining = ((card.ability.loyalty_remaining - 1)%(card.ability.extra.item_amount+1))
         end
		if context.open_booster then
         card.ability.loyalty_remaining = ((card.ability.loyalty_remaining - 1)%(card.ability.extra.item_amount+1))
         end
         if G.jokers then
         if card.ability.loyalty_remaining == 0 then
		 local eval = function(card) return (card.ability.loyalty_remaining == 0) end
         juice_card_until(card, eval, true)
         G.E_MANAGER:add_event(Event({func = function()
         if G.shop_jokers and G.shop_booster then 
                        for k, v in pairs(G.shop_jokers.cards) do
                            v.ability.couponed = true
                            v:set_cost()
                        end
                        for k, v in pairs(G.shop_booster.cards) do
                            v.ability.couponed = true
                            v:set_cost()
                        end
                    end
                    return true
                end}))
        end
		if card.ability.extra.items_bought == card.ability.extra.item_amount then
		G.E_MANAGER:add_event(Event({func = function()
         if G.shop_jokers and G.shop_booster then 
                        for k, v in pairs(G.shop_jokers.cards) do
                            v.ability.couponed = false
                            v:set_cost()
                        end
                        for k, v in pairs(G.shop_booster.cards) do
                            v.ability.couponed = false
                            v:set_cost()
                        end
                    end
                    return true
                end}))
    end
 end
end
}

SMODS.Joker {
    key = 'greedy',
    loc_txt = {
        name = 'Greedy Joker?',
        text = {
            "Each played card with {C:diamonds}Diamond{} suit",
            "temporarily gains {C:mult}+#1#{} mult, resets",
            "when {C:attention}Boss Blind{} is defeated",
            "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
        }
    },
    config = { extra = { mult_gain = 1, currentMult = 0 } },
    rarity = "fg_common",
    cost = 0,
	atlas = 'jokers_alt',
    pos = { x = 6, y = 1 },
	loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.currentMult }}
    end,
    calculate = function(self, card, context)
            if context.cardarea == G.play and context.individual then
                playingCard = context.other_card
                if playingCard:is_suit('Diamonds') then
                    card.ability.extra.currentMult = card.ability.extra.currentMult + card.ability.extra.mult_gain
					return {
                    message = "Increased!"
					}
                end
            end
			if context.joker_main and card.ability.extra.currentMult > 0 then
			return {
                    mult = card.ability.extra.currentMult
				   }
			end
            if context.end_of_round and G.GAME.blind.boss and context.cardarea ~= G.hand then
                    card.ability.extra.currentMult = 0
                    card_eval_status_text(card, 'extra', nil, nil, nil, { message = "Reset!"})
            end
    end
}

SMODS.Joker {
    key = 'lusty',
    loc_txt = {
        name = 'Lusty Joker?',
        text = {
            "Each played card with {C:hearts}Heart{} suit",
            "temporarily gains {C:mult}+#1#{} mult, resets",
            "when {C:attention}Boss Blind{} is defeated",
            "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
        }
    },
    config = { extra = { mult_gain = 1, currentMult = 0 } },
    rarity = "fg_common",
    cost = 0,
	atlas = 'jokers_alt',
    pos = { x = 7, y = 1 },
	loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.currentMult }}
    end,
    calculate = function(self, card, context)
            if context.cardarea == G.play and context.individual then
                playingCard = context.other_card
                if playingCard:is_suit('Hearts') then
                    card.ability.extra.currentMult = card.ability.extra.currentMult + card.ability.extra.mult_gain
					return {
                    message = "Increased!"
					}
                end
            end
			if context.joker_main and card.ability.extra.currentMult > 0 then
			return {
                    mult = card.ability.extra.currentMult
				   }
			end
            if context.end_of_round and G.GAME.blind.boss and context.cardarea ~= G.hand then
                    card.ability.extra.currentMult = 0
                    card_eval_status_text(card, 'extra', nil, nil, nil, { message = "Reset!"})
            end
    end
}

SMODS.Joker {
    key = 'wrathful',
    loc_txt = {
        name = 'Wrathful Joker?',
        text = {
            "Each played card with {C:spades}Spade{} suit",
            "temporarily gains {C:mult}+#1#{} mult, resets",
            "when {C:attention}Boss Blind{} is defeated",
            "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
        }
    },
    config = { extra = { mult_gain = 1, currentMult = 0 } },
    rarity = "fg_common",
    cost = 0,
	atlas = 'jokers_alt',
    pos = { x = 8, y = 1 },
	loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.currentMult }}
    end,
    calculate = function(self, card, context)
            if context.cardarea == G.play and context.individual then
                playingCard = context.other_card
                if playingCard:is_suit('Spades') then
                    card.ability.extra.currentMult = card.ability.extra.currentMult + card.ability.extra.mult_gain
					return {
                    message = "Increased!"
					}
                end
            end
			if context.joker_main and card.ability.extra.currentMult > 0 then
			return {
                    mult = card.ability.extra.currentMult
				   }
			end
            if context.end_of_round and G.GAME.blind.boss and context.cardarea ~= G.hand then
                    card.ability.extra.currentMult = 0
                    card_eval_status_text(card, 'extra', nil, nil, nil, { message = "Reset!"})
            end
    end
}

SMODS.Joker {
    key = 'gluttenous',
    loc_txt = {
        name = "Gluttonous Joker?",
        text = {
            "Each played card with {C:clubs}Club{} suit",
            "temporarily gains {C:mult}+#1#{} mult, resets",
            "when {C:attention}Boss Blind{} is defeated",
            "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
        }
    },
    config = { extra = { mult_gain = 1, currentMult = 0 } },
    rarity = "fg_common",
    cost = 0,
	atlas = 'jokers_alt',
    pos = { x = 9, y = 1 },
	loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.currentMult }}
    end,
    calculate = function(self, card, context)
            if context.cardarea == G.play and context.individual then
                playingCard = context.other_card
                if playingCard:is_suit('Clubs') then
                    card.ability.extra.currentMult = card.ability.extra.currentMult + card.ability.extra.mult_gain
					return {
                    message = "Increased!"
					}
                end
            end
			if context.joker_main and card.ability.extra.currentMult > 0 then
			return {
                    mult = card.ability.extra.currentMult
				   }
			end
            if context.end_of_round and G.GAME.blind.boss and context.cardarea ~= G.hand then
                    card.ability.extra.currentMult = 0
                    card_eval_status_text(card, 'extra', nil, nil, nil, { message = "Reset!"})
            end
    end
}

----------- Collectives

SMODS.Joker {
  key = 'deathmodereal',
  rarity = "fg_collective",
  cost = 6,
  atlas = "deathmodereal",
  pos = { x = 0 , y = 0},
  config = {  extra = { Xmult = 20, blindchipmult = 2 } },
  loc_txt = {
  name = 'deathmodereal',
  text = {
  "He's {X:black,C:white}cool(ish){}",
  '{X:mult,C:white}X#1#{} mult.'
  },
  },
  loc_vars = function(self, info_queue, card)
    return { vars = {
        card.ability.extra.Xmult
    } }
  end,
  calculate = function (self, card, context)
  	if G.jokers then
              if context.before then
		G.E_MANAGER:add_event(Event({func = function()
	   	G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.blindchipmult
	    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
		G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
        G.HUD_blind:recalculate() 
		return true end }))
		return {
		message = "hehehehehe....",
		colour = G.C.WHITE
		}
		end
		end
     if context.joker_main then
      return {
        Xmult = card.ability.extra.Xmult
      }
    end
  end
}

SMODS.Joker {
	key = 'deathmoderealalt',
	loc_txt = {
		 name = 'deathmodereal',
         text = {
     "He's {X:white,C:black}cool{}",
     'each scored card gives',
	 '{X:mult,C:white}X#1#{} mult.'
		}
	},
	config = { extra = {Xmult = 1.25} },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult } }
	end,
	rarity = "fg_collective",
	atlas = 'deathmoderealalt',
	pos = { x = 0, y = 0 },
	cost = 2,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			return {
				Xmult = card.ability.extra.Xmult
			}
		end
	end
}

-- Testing jokers. Will be removed in a future version.


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
    rarity = "fg_common",
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
	rarity = "fg_common",
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
			"Retrigger each scored {C:attention}Ace{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{},",
			"{C:attention}8{} and {C:attention}King{}{C:attention}1{} time and permanently",
			"upgrades it to next rank when scored",
			"{C:inactive}(ex: 2 to 3, 5 to 8, King to Ace){}",
		},
	},
	calculate = function (self, card, context)
		local has_fired = false
		if context.before then has_fired = false end
		if context.repetition and context.cardarea == G.play and
			(context.other_card:get_id() == 14 or -- ACE
			context.other_card:get_id() == 2 or
			context.other_card:get_id() == 3 or
			context.other_card:get_id() == 5 or
			context.other_card:get_id() == 8 or
			context.other_card:get_id() == 13) then
			return {
				repetitions = 1,
				card = card
			}
		end
		if context.after and not has_fired then
			local sound_pitch = 0.8
			for k,v in ipairs(context.scoring_hand) do
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0,
					func = function()
						if v.base.value == "Ace" or
						v.base.value == "2" or
						v.base.value == "3" or
						v.base.value == "5" or
						v.base.value == "8" or
						v.base.value == "King" then
							v:flip()
							play_sound("tarot2",sound_pitch)
							sound_pitch = sound_pitch + 0.1
						end
						return true
					end
				}))
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = .25,
					func = function()
						if v.base.value == "Ace" then 
							SMODS.change_base(v,v.base.suit,"2")
						elseif v.base.value == "2" then 
							SMODS.change_base(v,v.base.suit,"3")
						elseif v.base.value == "3" then 
							SMODS.change_base(v,v.base.suit,"5")
						elseif v.base.value == "5" then
							SMODS.change_base(v,v.base.suit,"8")
						elseif v.base.value == "8" then
							SMODS.change_base(v,v.base.suit,"King")
						elseif v.base.value == "King" then
							SMODS.change_base(v,v.base.suit,"Ace")
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
					delay = 0.25,
					func = function()
						if v.base.value == "Ace" or
						v.base.value == "2" or
						v.base.value == "3" or
						v.base.value == "5" or
						v.base.value == "8" or
						v.base.value == "King" then
							v:flip()
							play_sound("tarot2",sound_pitch)
							sound_pitch = sound_pitch + 0.1
						end
						return true
					end
				}))
			end
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 2,
				func = function() return true end
			}))
		end
  	end
}

SMODS.Joker {
	key = 'egg',
	rarity = "fg_common",
	cost = 2,
	atlas = 'jokers_alt',
	pos = { x = 0 , y = 10 },
	config = { extra = { sell_value = 50, hands = -1, discards = -1} },
	loc_vars = function(self, info_queue, card)
		return { vars = {
		  card.ability.extra.sell_value,
		  card.ability.extra.hands,
		  card.ability.extra.discards
		  } }
	end,
	loc_txt = {
		name = 'Egg?',
		text = {
			"Has {C:money}$#1#{} sell value.",
			"when sold lose",
			"{C:mult}#2#{} hand and {C:mult}#3#{} discard"
		},
	},
	calculate = function (self, card, context)
		if context.selling_self then
			card.sell_cost = 50
			ease_hands_played(-card.ability.extra.hands)
			ease_discard(-card.ability.extra.discards)
		end
	end
}


-- STILL NEEDS WORK. DO NOT UNCOMMENT -Jogla

--[[ 
SMODS.Joker {
	key = 'mr_bones',
	rarity = "fg_rare",
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
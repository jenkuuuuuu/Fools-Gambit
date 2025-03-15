SMODS.Atlas {
	key = "jokers_alt",
	path = "jokers_alt.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = 'collective',
	path = 'collective.png',
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = 'newjokers',
	path = 'newjokers.png',
	px = 71,
	py = 95
}
-- All joker equivalents. Format is: original <> alternate
FG.joker_equivalents = {
	-- Mod jokers
	["j_fg_flipped_script"] = "j_fg_flipped_script_alt",
	["j_fg_concert"] = "j_fg_concertalt",
	["j_fg_delinquent"] = "j_fg_delinquentalt",
	["j_fg_conductor"] = "j_fg_conductoralt",
	-- Normal jokers
	["j_joker"] = "j_fg_joker",
	["j_greedy_joker"] = "j_fg_greedy",
	["j_lusty_joker"] = "j_fg_lusty",
	["j_wrathful_joker"] = "j_fg_wrathful",
	["j_gluttenous_joker"] = "j_fg_gluttenous",
	["j_jolly"] = "j_fg_jolly",
	["j_zany"] = "j_fg_zany",
	["j_mad"] = "j_fg_mad",
	["j_crazy"] = "j_fg_crazy",
	["j_droll"] = "j_fg_droll",
	["j_sly"] = "j_fg_sly",
	["j_wily"] = "j_fg_wily",
	["j_clever"] = "j_fg_clever",
	["j_devious"] = "j_fg_devious",
	["j_ceremonial"] = "j_fg_dagger",
	["j_banner"] = "j_fg_banner",
	["j_mystic_summit"] = "j_fg_summit",
	["j_loyalty_card"] = "j_fg_loyalty",
	["j_8_ball"] = "j_fg_8ball",
	["j_misprint"] = "j_fg_misprint",
	["j_fibonacci"] = "j_fg_fibonacci",
	["j_scary_face"] = "j_fg_face",
	["j_abstract"] = "j_fg_abstract",
	["j_crafty"] = "j_fg_crafty",
	["j_duo"] = "j_fg_duo",
	["j_trio"] = "j_fg_trio",
	["j_family"] = "j_fg_family",
	["j_order"] = "j_fg_order",
	["j_egg"] = "j_fg_egg",
	["j_rough_gem"] = "j_fg_gem",
	["j_bloodstone"] = "j_fg_bloodstone",
	["j_arrowhead"] = "j_fg_arrowhead",
	["j_onyx_agate"] = "j_fg_agate",
	-- COLLECTION
	["j_fg_deathmodereal"] = "j_fg_deathmoderealalt",
}
--------------------
---SPECIAL JOKERS---
--------------------
if FG.config.debug_mode then
	-- Change of pace
	SMODS.Joker {
		key = 'change_of_pace',
		config = { extra = {} },
		rarity = 3,
		atlas = 'newjokers',
		pos = { x = 5, y = 0 }, -- havent added the sprite to the sheet yet
		cost = 8,
		calculate = function(self, card, context)
			if context.selling_self then
				G.GAME.pool_flags.alternate = true
				for k, v in pairs(G.P_CENTERS) do
					if string.find(k, '^j_') and not string.find(k, "_fg_") then
						G.P_CENTERS[k]['no_pool_flag'] = 'alternate'
					end
				end
			end
		end
	}

	SMODS.Joker {
		key = 'change_of_pace_alt',
		config = { extra = {} },
		rarity = 2,
		atlas = 'newjokers',
		pos = { x = 5, y = 0 }, -- read above
		cost = 8,
		calculate = function(self, card, context)
			if context.selling_self then
				G.GAME.pool_flags.alternate = false
			end
		end
	}
	-- Flipped Script
	SMODS.Joker {
		key = 'flipped_script',
		config = { extra = {} },
		rarity = 3,
		atlas = 'newjokers',
		yes_pool_flag = 'alternate',
		pos = { x = 6, y = 0 },
		cost = 8,
		calculate = function(self, card, context)
			if context.selling_self then
				G.E_MANAGER:add_event(Event({
					func = function()
						for i in ipairs(G.jokers.cards) do
							local currentCard = G.jokers.cards[i]
							if FG.is_alternate(currentCard.config.center_key, FG.joker_equivalents) == "v" then
								FG.alternate_card(currentCard.config.center_key, card, FG.joker_equivalents)
								currentCard:start_dissolve(nil, false, 0, true)
							end
						end
						return true
					end
				}))
			end
		end
	}

	SMODS.Joker {
		key = 'flipped_script_alt',
		config = { extra = {} },
		rarity = 2,
		atlas = 'newjokers',
		yes_pool_flag = 'alternate',
		pos = { x = 6, y = 0 },
		cost = 4,
		calculate = function(self, card, context)
			if context.selling_self then
				G.E_MANAGER:add_event(Event({
					func = function()
						for i in ipairs(G.jokers.cards) do
							local currentCard = G.jokers.cards[i]
							if FG.is_alternate(currentCard.config.center_key, FG.joker_equivalents) == "k" then
								FG.alternate_card(currentCard.config.center_key, card, FG.joker_equivalents)
								currentCard:start_dissolve(nil, false, 0, true)
							end
						end
						return true
					end
				}))
			end
		end
	}
	-- Script Flipped
	SMODS.Joker {
		key = 'NOTflipped_script',
		config = { extra = {} },
		rarity = 3,
		atlas = 'newjokers',
		pos = { x = 7, y = 0 },
		cost = 8,
		calculate = function(self, card, context)
			if context.selling_self then
				G.E_MANAGER:add_event(Event({
					func = function()
						sendInfoMessage("Should be changing if i did it right", "MyInfoLogger")
						for i in ipairs(G.jokers.cards) do
							local currentCard = G.jokers.cards[i]
							FG.flip_editions(currentCard)
							-- if wanting to add an edition to cards without one just add it as an else to the g.joker.cards[i].edition
						end
						return true
					end
				}))
			end
		end
	}
	----------------
	---NEW JOKERS---
	----------------
	--Concert Ticket
	SMODS.Joker {
		key = 'concert',
		config = { extra = { item_amount = 15, item_amount2 = 0 } },
		loc_vars = function(self, info_queue, card)
			return { vars = { card.ability.extra.item_amount, card.ability.extra.item_amount2 } }
		end,
		rarity = 2,
		atlas = 'newjokers',
		pos = { x = 0, y = 0 },
		cost = 6,
		no_pool_flag = 'alternate',
		calculate = function(self, card, context)
			if context.buying_card then
				card.ability.extra.item_amount2 = (card.ability.extra.item_amount2 + context.card.cost)
			end
			if context.open_booster then
				card.ability.extra.item_amount2 = (card.ability.extra.item_amount2 + context.card.cost)
			end
			if context.reroll_shop then
				card.ability.extra.item_amount2 = (card.ability.extra.item_amount2 + (G.GAME.current_round.reroll_cost - 1))
			end
			if G.jokers then
				if card.ability.extra.item_amount2 >= card.ability.extra.item_amount then
					if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
						G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
						G.E_MANAGER:add_event(Event({
							trigger = 'before',
							delay = 0.0,
							func = (function()
								local card = create_card('abberation', G.consumeables, nil, nil, nil, nil, nil, '8ba')
								card:add_to_deck()
								G.consumeables:emplace(card)
								G.GAME.consumeable_buffer = 0
								return true
							end)
						}))
						card_eval_status_text(card, 'extra', nil, nil, nil,
							{ message = localize('k_plus_abberation'), colour = G.C.PURPLE })
					end
					card.ability.extra.item_amount2 = card.ability.extra.item_amount2 - card.ability.extra.item_amount
				end
			end
		end
	}

	SMODS.Joker {
		key = 'concertalt',
		config = {},
		rarity = 2,
		atlas = 'newjokers',
		pos = { x = 0, y = 0 },
		cost = 6,
		yes_pool_flag = 'alternate',
		calculate = function(self, card, context)
			if G.jokers then
				if context.buying_card then
					if context.card.ability.set == 'Voucher' then
						if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
							G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
							G.E_MANAGER:add_event(Event({
								trigger = 'before',
								delay = 0.0,
								func = (function()
									local card = create_card('abberation', G.consumeables, nil, nil, nil, nil, nil, '8ba')
									card:add_to_deck()
									G.consumeables:emplace(card)
									G.GAME.consumeable_buffer = 0
									return true
								end)
							}))
							card_eval_status_text(card, 'extra', nil, nil, nil,
								{ message = localize('k_plus_abberation'), colour = G.C.PURPLE })
						end
					end
				end
			end
		end
	}
	-- Delinquent
	SMODS.Joker {
		key = 'delinquent',
		rarity = 2,
		atlas = 'newjokers',
		pos = { x = 1, y = 0 },
		cost = 7,
		no_pool_flag = 'alternate',
		calculate = function(self, card, context)
			if context.skip_blind then
				for i = 1, #G.consumeables.cards do
					G.consumeables.cards[i]:start_dissolve(nil, true, 1, true)
					G.E_MANAGER:add_event(Event({
						trigger = 'before',
						delay = 0.0,
						func = (function()
							local card = create_card('abberation', G.consumeables, nil, nil, nil, nil, nil, '8ba')
							card:add_to_deck()
							G.consumeables:emplace(card)
							G.GAME.consumeable_buffer = 0
							return true
						end)
					}))
				end
				if #G.consumeables.cards > 0 then
					card_eval_status_text(card, 'extra', nil, nil, nil,
						{ message = localize('k_replaced'), colour = G.C.PURPLE })
				end
			end
		end
	}

	SMODS.Joker {
		key = 'delinquentalt',
		rarity = 2,
		atlas = 'newjokers',
		yes_pool_flag = 'alternate',
		pos = { x = 1, y = 0 },
		cost = 8,
		calculate = function(self, card, context)
			if context.end_of_round and context.individual then
				if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
					for i = 1, G.consumeables.config.card_limit - #G.consumeables.cards + G.GAME.consumeable_buffer do
						G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
						G.E_MANAGER:add_event(Event({
							trigger = 'before',
							delay = 0.0,
							func = (function()
								local card = create_card('abberation', G.consumeables, nil, nil, nil, nil, nil, '8ba')
								card:add_to_deck()
								G.consumeables:emplace(card)
								G.GAME.consumeable_buffer = 0
								return true
							end)
						}))
					end
					card_eval_status_text(card, 'extra', nil, nil, nil,
						{ message = localize('k_replenished'), colour = G.C.PURPLE })
				end
			end
		end
	}
	--Disc Joker
	SMODS.Joker {
		key = 'disc',
		config = { extra = { chips = 25 } },
		rarity = 1,
		atlas = 'newjokers',
		pos = { x = 2, y = 0 }, -- read above
		cost = 5,
		loc_vars = function(self, info_queue, card)
			return { vars = { card.ability.extra.chips } }
		end,
		calculate = function(self, card, context)
			if context.other_joker then
				if (context.other_joker.config.center.rarity == 1 or context.other_joker.config.center.rarity == 2 or context.other_joker.config.center.rarity == 3 or context.other_joker.config.center.rarity == 4 or context.other_joker.config.center.rarity == "fg_collective") then
					G.E_MANAGER:add_event(Event({
						func = function()
							context.other_joker:juice_up(0.5, 0.5)
							return true
						end
					}))
					return {
						chip_mod = card.ability.extra.chips,
						message = '+' .. card.ability.extra.chips,
						colour = G.C.CHIPS
					}
				end
			end
		end
	}
	--Orchestral Joker
	SMODS.Joker {
		key = 'orchestral',
		config = { extra = { mult = 10 } },
		rarity = 1,
		atlas = 'newjokers',
		pos = { x = 3, y = 0 }, -- read above
		cost = 5,
		loc_vars = function(self, info_queue, card)
			return { vars = { card.ability.extra.mult } }
		end,
		calculate = function(self, card, context)
			if context.other_joker then
				if (context.other_joker.config.center.rarity == "fg_common" or context.other_joker.config.center.rarity == "fg_uncommon" or context.other_joker.config.center.rarity == "fg_rare" or context.other_joker.config.center.rarity == "fg_legendary") then
					G.E_MANAGER:add_event(Event({
						func = function()
							context.other_joker:juice_up(0.5, 0.5)
							return true
						end
					}))
					return {
						mult_mod = card.ability.extra.mult,
						message = '+' .. card.ability.extra.mult,
						colour = G.C.MULT
					}
				end
			end
		end
	}
	--Conductor
	SMODS.Joker {
		key = 'conductor',
		rarity = 2,
		atlas = 'newjokers',
		pos = { x = 4, y = 0 }, -- read above
		cost = 5,
		config = { extra = { amount = 1 } },
		loc_vars = function(self, info_queue, card)
			return { vars = { card.ability.extra.amount } }
		end,
		calculate = function(self, card, context)
			if context.joker_main then
				local nofaces = false
				for i = 1, #context.scoring_hand do
					if not context.scoring_hand[i]:is_face() then
						nofaces = true
					end
				end
				if not nofaces then
					if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
						for i = 1, card.ability.extra.amount do
							G.E_MANAGER:add_event(Event({
								trigger = 'before',
								delay = 0.0,
								func = (function()
									local card = create_card('abberation', G.consumeables, nil, nil, nil, nil, nil, '8ba')
									card:add_to_deck()
									G.consumeables:emplace(card)
									G.GAME.consumeable_buffer = 0
									return true
								end)
							}))
							card_eval_status_text(card, 'extra', nil, nil, nil,
								{ message = localize('k_plus_abberation'), colour = G.C.PURPLE })
						end
					end
				end
			end
		end
	}

	SMODS.Joker {
		key = 'conductoralt',
		rarity = 2,
		atlas = 'newjokers',
		pos = { x = 4, y = 0 }, -- read above
		cost = 5,
		yes_pool_flag = 'alternate',
		config = { extra = { amount = 2 } },
		loc_vars = function(self, info_queue, card)
			return { vars = { card.ability.extra.amount } }
		end,
		calculate = function(self, card, context)
			if context.using_consumeable then
				if context.consumeable.ability.set == 'abberation' then
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = 0.7,
						func = function()
							local cards = {}
							for i = 1, card.ability.extra.amount do
								cards[i] = true
								local _suit, _rank = nil, nil
								_rank = pseudorandom_element({ 'J', 'Q', 'K' }, pseudoseed('familiar_create'))
								_suit = pseudorandom_element({ 'S', 'H', 'D', 'C' }, pseudoseed('familiar_create'))
								_suit = _suit or 'S'; _rank = _rank or 'A'
								create_playing_card({ front = G.P_CARDS[_suit .. '_' .. _rank], center = base }, G.deck,
									true, i ~= 1, { G.C.BLUE })
								card_eval_status_text(card, 'extra', nil, nil, nil,
									{ message = localize('k_card_added'), colour = G.C.BLUE })
							end
							return true
						end
					}))
				end
			end
		end
	}
end
---------------------
---STANDARD JOKERS---
---------------------
for k, v in ipairs(G.P_CENTERS) do

end

-- Joker
SMODS.Joker {
	key = 'joker',
	config = { extra = { mult = 0.5 } },
	loc_vars = function(self, info_queue, card)
		--info_queue[#info_queue + 1] = G.P_CENTERS['j_joker']
		return { vars = { card.ability.extra.mult } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
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
-- Greedy
SMODS.Joker {
	key = 'greedy',
	config = { extra = { mult_gain = 1, currentMult = 0 } },
	rarity = 1,
	cost = 0,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
	pos = { x = 6, y = 1 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult_gain, card.ability.extra.currentMult } }
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
			card_eval_status_text(card, 'extra', nil, nil, nil, { message = "Reset!" })
		end
	end
}
-- Lusty
SMODS.Joker {
	key = 'lusty',
	config = { extra = { mult_gain = 1, currentMult = 0 } },
	rarity = 1,
	cost = 0,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
	pos = { x = 7, y = 1 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult_gain, card.ability.extra.currentMult } }
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
			card_eval_status_text(card, 'extra', nil, nil, nil, { message = "Reset!" })
		end
	end
}
-- Wrathful
SMODS.Joker {
	key = 'wrathful',
	config = { extra = { mult_gain = 1, currentMult = 0 } },
	rarity = 1,
	cost = 0,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
	pos = { x = 8, y = 1 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult_gain, card.ability.extra.currentMult } }
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
			card_eval_status_text(card, 'extra', nil, nil, nil, { message = "Reset!" })
		end
	end
}
-- Gluttonous
SMODS.Joker {
	key = 'gluttenous',
	config = { extra = { mult_gain = 1, currentMult = 0 } },
	rarity = 1,
	cost = 0,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
	pos = { x = 9, y = 1 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult_gain, card.ability.extra.currentMult } }
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
			card_eval_status_text(card, 'extra', nil, nil, nil, { message = "Reset!" })
		end
	end
}
-- Jolly
SMODS.Joker {
	key = 'jolly',
	config = { t_mult = 4, type = 'Pair', extra = { repetitions = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_mult, localize(card.ability.type, 'poker_hands'), card.ability.extra.repetitions } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
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
-- Zany
SMODS.Joker {
	key = 'zany',
	config = { t_mult = 6, type = 'Three of a Kind', extra = { repetitions = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_mult, localize(card.ability.type, 'poker_hands'), card.ability.extra.repetitions } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
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
-- Mad
SMODS.Joker {
	key = 'mad',
	config = { t_mult = 5, type = 'Two Pair', extra = { repetitions = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_mult, localize(card.ability.type, 'poker_hands'), card.ability.extra.repetitions } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
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
-- Crazy
SMODS.Joker {
	key = 'crazy',
	config = { t_mult = 6, type = 'Straight', extra = { repetitions = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_mult, localize(card.ability.type, 'poker_hands'), card.ability.extra.repetitions } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
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
-- Droll
SMODS.Joker {
	key = 'droll',
	config = { t_mult = 5, type = 'Flush', extra = { repetitions = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_mult, localize(card.ability.type, 'poker_hands'), card.ability.extra.repetitions } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
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
-- Sly
SMODS.Joker {
	key = 'sly',
	config = { t_chips = 25, type = 'Pair', extra = { repetitions = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_chips, localize(card.ability.type, 'poker_hands'), card.ability.extra.repetitions } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
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
-- Wily
SMODS.Joker {
	key = 'wily',
	config = { t_chips = 50, type = 'Three of a Kind', extra = { repetitions = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_chips, localize(card.ability.type, 'poker_hands'), card.ability.extra.repetitions } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
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
-- Clever
SMODS.Joker {
	key = 'clever',
	config = { t_chips = 40, type = 'Two Pair', extra = { repetitions = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_chips, localize(card.ability.type, 'poker_hands'), card.ability.extra.repetitions } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
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
-- Devious
SMODS.Joker {
	key = 'devious',
	config = { t_chips = 50, type = 'Straight', extra = { repetitions = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_chips, localize(card.ability.type, 'poker_hands'), card.ability.extra.repetitions } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
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
-- Crafty
SMODS.Joker {
	key = 'crafty',
	config = { t_chips = 40, type = 'Flush', extra = { repetitions = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_chips, localize(card.ability.type, 'poker_hands'), card.ability.extra.repetitions } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
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
-- Dagger
SMODS.Joker {
	key = 'dagger',
	config = { extra = { chips = 0, mult = 4 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
	pos = { x = 5, y = 5 },
	cost = 2,
	calculate = function(self, card, context)
		if context.setting_blind and not self.getting_sliced then
			local my_pos = nil
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					my_pos = i; break
				end
			end
			if my_pos and G.jokers.cards[my_pos - 1] and not self.getting_sliced and not G.jokers.cards[my_pos - 1].ability.eternal and not G.jokers.cards[my_pos - 1].getting_sliced then
				local sliced_card = G.jokers.cards[my_pos - 1]
				sliced_card.getting_sliced = true
				G.GAME.joker_buffer = G.GAME.joker_buffer - 1
				G.E_MANAGER:add_event(Event({
					func = function()
						G.GAME.joker_buffer = 0
						card.ability.extra.chips = card.ability.extra.chips +
						sliced_card.sell_cost * card.ability.extra.mult
						card:juice_up(0.8, 0.8)
						sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
						play_sound('slice1', 0.96 + math.random() * 0.08)
						return true
					end
				}))
				card_eval_status_text(card, 'extra', nil, nil, nil,
					{ message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips + card.ability.extra.mult * sliced_card.sell_cost } }, colour =
					G.C.CHIPS, no_juice = true })
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
-- Banner
SMODS.Joker {
	key = 'banner',
	config = { extra = { chips = 20, discards = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.discards } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
	pos = { x = 1, y = 2 },
	cost = 2,
	calculate = function(self, card, context)
		if context.setting_blind then
			G.E_MANAGER:add_event(Event({
				func = function()
					ease_discard(card.ability.extra.discards)
					return true
				end
			}))
		end
		if context.joker_main and G.GAME.current_round.discards_left > 0 then
			return {
				chips = G.GAME.current_round.discards_left * card.ability.extra.chips,
				colour = G.C.CHIPS
			}
		end
	end
}
-- Summit
SMODS.Joker {
	key = 'summit',
	config = { extra = { mult = 30, discards = 1, discards2 = 0 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.discards, card.ability.extra.discards2 } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
	pos = { x = 2, y = 2 },
	cost = 2,
	calculate = function(self, card, context)
		if context.setting_blind then
			G.E_MANAGER:add_event(Event({
				func = function()
					ease_discard(-card.ability.extra.discards)
					return true
				end
			}))
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
-- Loyalty
SMODS.Joker {
	key = 'loyalty',
	config = { loyalty_remaining = 10, extra = { item_amount = 10 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.item_amount, localize { type = 'variable', key = (card.ability.loyalty_remaining == 0 and 'loyalty_active' or 'loyalty_inactive'), vars = { card.ability.loyalty_remaining } } } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	pos = { x = 4, y = 2 },
	cost = 2,
	calculate = function(self, card, context)
		if context.buying_card then
			card.ability.loyalty_remaining = ((card.ability.loyalty_remaining - 1) % (card.ability.extra.item_amount + 1))
		end
		if context.open_booster then
			card.ability.loyalty_remaining = ((card.ability.loyalty_remaining - 1) % (card.ability.extra.item_amount + 1))
		end
		if G.jokers then
			if card.ability.loyalty_remaining == 0 then
				local eval = function(card) return (card.ability.loyalty_remaining == 0) end
				juice_card_until(card, eval, true)
				G.E_MANAGER:add_event(Event({
					func = function()
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
					end
				}))
			end
			if card.ability.extra.items_bought == card.ability.extra.item_amount then
				G.E_MANAGER:add_event(Event({
					func = function()
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
					end
				}))
			end
		end
	end
}
-- 8 Ball
SMODS.Joker {
	key = '8ball',
	rarity = 1,
	cost = 2,
	atlas = 'jokers_alt',
	pos = { x = 0, y = 5 },
	config = { extra = { chips = 0, chip_gain = 15 } },
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual and (context.other_card:get_id() == 8) then
			G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
			return {
				extra = {
					focus = card,
					message = localize('k_plus_tarot'),
					func = function()
						G.E_MANAGER:add_event(Event({
							trigger = 'before',
							delay = 0.0,
							func = (function()
								local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, '8ba')
								card:add_to_deck()
								G.consumeables:emplace(card)
								G.GAME.consumeable_buffer = 0
								return true
							end)
						}))
					end
				},
				colour = G.C.SECONDARY_SET.Tarot,
				card = card
			}
		end
	end
}
-- Missprint
SMODS.Joker {
	key = 'misprint',
	rarity = 2,
	cost = 6,
	atlas = "jokers_alt",
	pos = { x = 6, y = 2 },
	config = { extra = {
		Xmult = 1,
		Xmult_min = 75,
		Xmult_max = 200,
	} },
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.Xmult,
				card.ability.extra.Xmult_min,
				card.ability.extra.Xmult_max
			}
		}
	end,
	calculate = function(self, card, context)
		if G.jokers then
			card.ability.extra.Xmult = (pseudorandom('misprint', card.ability.extra.Xmult_min, card.ability.extra.Xmult_max) / 100)
		end
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.Xmult,
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } }
			}
		end
	end
}
-- Fist
--Non existent!!
--[[
SMODS.Joker {
    key = 'fist',
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
]]
-- Fibonacci
SMODS.Joker {
	key = 'fibonacci',
	rarity = 1,
	cost = 2,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
	pos = { x = 1, y = 5 },
	config = { extra = { retriggers = 1 } },
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.retriggers
			}
		}
	end,
	loc_txt = {
	},
	calculate = function(self, card, context)
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
			for k, v in ipairs(context.scoring_hand) do
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
							play_sound("tarot2", sound_pitch)
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
							SMODS.change_base(v, v.base.suit, "2")
						elseif v.base.value == "2" then
							SMODS.change_base(v, v.base.suit, "3")
						elseif v.base.value == "3" then
							SMODS.change_base(v, v.base.suit, "5")
						elseif v.base.value == "5" then
							SMODS.change_base(v, v.base.suit, "8")
						elseif v.base.value == "8" then
							SMODS.change_base(v, v.base.suit, "King")
						elseif v.base.value == "King" then
							SMODS.change_base(v, v.base.suit, "Ace")
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
			for _, v in ipairs(context.scoring_hand) do
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
							play_sound("tarot2", sound_pitch)
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
-- Face
SMODS.Joker {
	key = 'face',
	rarity = 1,
	cost = 2,
	atlas = 'jokers_alt',
	pos = { x = 2, y = 3 },
	config = { extra = { chips = 0, chip_gain = 15 } },
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.chips,
				card.ability.extra.chip_gain
			}
		}
	end,
	calculate = function(self, card, context)
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
-- Abstract
SMODS.Joker {
	key = 'abstract',
	rarity = 1,
	cost = 2,
	atlas = 'jokers_alt',
	pos = { x = 3, y = 3 },
	config = { extra = { mult_gain = 10, mult = 0, sold = 0 } },
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.mult_gain,
				card.ability.extra.mult
			}
		}
	end,
	calculate = function(self, card, context)
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
-- Egg
SMODS.Joker {
	key = 'egg',
	rarity = 1,
	cost = 2,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
	pos = { x = 0, y = 10 },
	config = { extra = { sell_value = 50, hands = -1, discards = -1 } },
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.sell_value,
				card.ability.extra.hands,
				card.ability.extra.discards
			}
		}
	end,
	add_to_deck = function(self, card, from_debuff)
		card.sell_cost = 50
	end,
	calculate = function(self, card, context)
		if context.selling_self then
			ease_hands_played(card.ability.extra.hands)
			ease_discard(card.ability.extra.discards)
		end
	end
}
-- Duo
SMODS.Joker {
	key = 'duo',
	config = { type = 'Pair', extra = { Xmult_mod = 0.1, Xmult = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult_mod, localize(card.ability.type, 'poker_hands'), card.ability.extra.Xmult } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
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
-- Trio
SMODS.Joker {
	key = 'trio',
	config = { type = 'Three of a Kind', extra = { Xmult_mod = 0.15, Xmult = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult_mod, localize(card.ability.type, 'poker_hands'), card.ability.extra.Xmult } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
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
-- Family
SMODS.Joker {
	key = 'family',
	config = { type = 'Four of a Kind', extra = { Xmult_mod = 0.2, Xmult = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult_mod, localize(card.ability.type, 'poker_hands'), card.ability.extra.Xmult } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
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
-- Order
SMODS.Joker {
	key = 'order',
	config = { type = 'Straight', extra = { Xmult_mod = 0.15, Xmult = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult_mod, localize(card.ability.type, 'poker_hands'), card.ability.extra.Xmult } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
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
-- Rough Gem
SMODS.Joker {
	key = 'gem',
	config = { type = 'Flush', extra = { dollars = 10 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { localize(card.ability.type, 'poker_hands'), card.ability.extra.dollars } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
	pos = { x = 9, y = 7 },
	cost = 2,
	calculate = function(self, card, context)
		if context.joker_main then
			if (next(context.poker_hands[card.ability.type])) then
				for i = 1, #context.scoring_hand do
					if context.scoring_hand[i]:is_suit("Diamonds") then
						G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
						G.E_MANAGER:add_event(Event({ func = (function()
							G.GAME.dollar_buffer = 0; return true
						end) }))
						return {
							dollars = card.ability.extra.dollars,
							card = card
						}
					end
				end
			end
		end
	end
}
-- Bloodstone
SMODS.Joker {
	key = 'bloodstone',
	config = { type = 'Flush', extra = { Xmult_gain = 0.5, Xmult = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { localize(card.ability.type, 'poker_hands'), card.ability.extra.Xmult_gain, card.ability.extra.Xmult } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
	pos = { x = 0, y = 8 },
	cost = 2,
	calculate = function(self, card, context)
		if context.before then
			if (next(context.poker_hands[card.ability.type])) then
				for i = 1, #context.scoring_hand do
					if not context.scoring_hand[i]:is_suit("Hearts") then
						local extrasuit = true
					end
				end
				if not extrasuit then
					card.ability.extra.Xmult = card.ability.extra.Xmult_gain + card.ability.extra.Xmult
				end
			end
		end
		if context.joker_main then
			return {
				Xmult_mod = card.ability.extra.Xmult,
				message = 'X' .. card.ability.extra.Xmult
			}
		end
	end
}
-- Arrowhead
SMODS.Joker {
	key = 'arrowhead',
	config = { type = 'Flush', extra = { chip_gain = 25, chips = 0 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { localize(card.ability.type, 'poker_hands'), card.ability.extra.chip_gain, card.ability.extra.chips } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
	pos = { x = 1, y = 8 },
	cost = 2,
	calculate = function(self, card, context)
		if context.before then
			if (next(context.poker_hands[card.ability.type])) then
				for i = 1, #context.scoring_hand do
					if not context.scoring_hand[i]:is_suit("Spades") then
						local extrasuit = true
					end
				end
				if not extrasuit then
					card.ability.extra.chips = card.ability.extra.chip_gain + card.ability.extra.chips
				end
			end
		end
		if context.joker_main then
			return {
				chip_mod = card.ability.extra.chips,
				message = '+' .. card.ability.extra.chips
			}
		end
	end
}
-- Onyx Agate
SMODS.Joker {
	key = 'agate',
	config = { type = 'Flush', extra = { mult_gain = 20, mult = 0 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { localize(card.ability.type, 'poker_hands'), card.ability.extra.mult_gain, card.ability.extra.mult } }
	end,
	rarity = 1,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
	pos = { x = 2, y = 8 },
	cost = 2,
	calculate = function(self, card, context)
		if context.before then
			if (next(context.poker_hands[card.ability.type])) then
				for i = 1, #context.scoring_hand do
					if not context.scoring_hand[i]:is_suit("Clubs") then
						local extrasuit = true
					end
				end
				if not extrasuit then
					card.ability.extra.mult = card.ability.extra.mult_gain + card.ability.extra.mult
				end
			end
		end
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = '+' .. card.ability.extra.mult
			}
		end
	end
}
-- Bones
--[[
SMODS.Joker {
	key = 'mr_bones',
	rarity = 3,
	cost = 2,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate',
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
-----------------
---Collectives---
-----------------
if FG.config.debug_mode then
	-- Deathmodereal
	SMODS.Joker {
		key = 'deathmodereal',
		rarity = "fg_collective",
		cost = 6,
		atlas = "collective",
		pos = { x = 3, y = 0 },
		config = { extra = { Xmult = 20, blindchipmult = 2 } },
		loc_vars = function(self, info_queue, card)
			return {
				vars = {
					card.ability.extra.Xmult
				}
			}
		end,
		calculate = function(self, card, context)
			if G.jokers then
				if context.before then
					G.E_MANAGER:add_event(Event({
						func = function()
							G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.blindchipmult
							G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
							G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
							G.HUD_blind:recalculate()
							return true
						end
					}))
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
	-- Deathmodereal alt
	SMODS.Joker {
		key = 'deathmoderealalt',
		config = { extra = { Xmult = 1.25 } },
		loc_vars = function(self, info_queue, card)
			return { vars = { card.ability.extra.Xmult } }
		end,
		rarity = "fg_collective",
		atlas = 'collective',
		pos = { x = 4, y = 0 },
		cost = 2,
		calculate = function(self, card, context)
			if context.individual and context.cardarea == G.play then
				return {
					Xmult = card.ability.extra.Xmult
				}
			end
		end
	}
	-- Jogla
	SMODS.Joker {
		key = 'jogla',
		config = { extra = { initial_slots = 3, slots_increase = 1, secret = "Boss" } },
		loc_vars = function(self, info_queue, card)
			return {
				vars = {
					card.ability.extra.initial_slots,
					card.ability.extra.slots_increase,
					card.ability.extra.secret
				}
			}
		end,
		rarity = "fg_collective",
		atlas = 'collective',
		pos = { x = 2, y = 0 },
		soul_pos = { x = 2, y = 1 },
		cost = 5,
		add_to_deck = function(self, card, from_debuff)
			G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.initial_slots
		end,
		calculate = function(self, card, context)
			if context.setting_blind then
				local use_secret = pseudorandom("wizard", 1, 2)
				if use_secret == 1 then card.ability.extra.secret = "Boos" else card.ability.extra.secret = "Boss" end
			end
			if context.end_of_round and G.GAME.blind.boss and not context.repetition and not context.individual then
				G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.slots_increase
				card.ability.extra.initial_slots = card.ability.extra.initial_slots + card.ability.extra.slots_increase
				card.ability.extra.secret = "Boss"
				card_eval_status_text(card, 'extra', nil, nil, nil, { message = "Upgrade!" })
			end
		end
	}
end

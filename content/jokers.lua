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

SMODS.Atlas {
	key = 'oscillator_atlas',
	path = 'oscillator_joker.png',
	px = 71,
	py = 95,
}
-- All joker equivalents. Format is: original <> alternate
FG.ALTS.joker_equivalents = {
	meta = {
		set = "jokers"
	},
	-- Mod jokers
	j_fg_flipped_script = "j_fg_flipped_script_alt",
	j_fg_concert = "j_fg_concertalt",
	j_fg_delinquent = "j_fg_delinquentalt",
	j_fg_conductor = "j_fg_conductoralt",
	j_fg_oscillator = "j_fg_oscillator_alt",
	-- Normal jokers
	j_joker = "j_fg_joker",
	j_greedy_joker = "j_fg_greedy",
	j_lusty_joker = "j_fg_lusty",
	j_wrathful_joker = "j_fg_wrathful",
	j_gluttenous_joker = "j_fg_gluttenous",
	j_jolly = "j_fg_jolly",
	j_zany = "j_fg_zany",
	j_mad = "j_fg_mad",
	j_crazy = "j_fg_crazy",
	j_droll = "j_fg_droll",
	j_sly = "j_fg_sly",
	j_wily = "j_fg_wily",
	j_clever = "j_fg_clever",
	j_devious = "j_fg_devious",
	j_ceremonial = "j_fg_dagger",
	j_banner = "j_fg_banner",
	j_mystic_summit = "j_fg_summit",
	j_loyalty_card = "j_fg_loyalty",
	j_8_ball = "j_fg_8ball",
	j_misprint = "j_fg_misprint",
	j_fibonacci = "j_fg_fibonacci",
	j_scary_face = "j_fg_face",
	j_gros_michel = "j_fg_gros_michel",
	j_even_steven = "j_fg_even_steven",
	j_odd_todd = "j_fg_odd_todd",
	j_business = "j_fg_business",
	--j_supernova = "j_fg_supernova",
	j_ride_the_bus = "j_fg_ride_the_bus",
	j_abstract = "j_fg_abstract",
	j_crafty = "j_fg_crafty",
	j_duo = "j_fg_duo",
	j_trio = "j_fg_trio",
	j_family = "j_fg_family",
	j_order = "j_fg_order",
	j_egg = "j_fg_egg",
	j_ice_cream = "j_fg_ice_cream",
	j_faceless = "j_fg_faceless",
	j_baron = "j_fg_baron",
	j_cloud_9 = "j_fg_cloud_9",
	j_rocket = "j_fg_rocket",
	j_splash = "j_fg_splash",
	j_cavendish = "j_fg_cavendish",
	j_red_card = "j_fg_red_card",
	j_popcorn = "j_fg_popcorn",
	j_throwback = "j_fg_throwback",
	j_hanging_chad = "j_fg_hanging_chad",
	j_rough_gem = "j_fg_gem",
	j_bloodstone = "j_fg_bloodstone",
	j_arrowhead = "j_fg_arrowhead",
	j_onyx_agate = "j_fg_agate",
	j_hit_the_road = "j_fg_hit_the_road",
	j_invisible = "j_fg_invisible",
	j_bootstraps = "j_fg_bootstraps",
	-- Legendaries
	j_caino = "j_fg_caino",
	j_triboulet = "j_fg_triboulet",
	j_yorick = "j_fg_yorick",
	j_chicot = "j_fg_chicot",
	j_perkeo = "j_fg_perkeo",
	-- COLLECTION
	j_fg_jogla = "j_fg_jogla_alt",
	j_fg_deathmodereal = "j_fg_deathmoderealalt",
	j_fg_goldenleaf = "j_fg_goldenleafalt",
}
--------------------
---SPECIAL JOKERS---
--------------------
-- Change of pace
SMODS.Joker {
	key = 'change_of_pace',
	config = { extra = {} },
	rarity = 3,
	atlas = 'newjokers',
	eternal_compat = false,
	perishable_compat = false,
	pos = { x = 5, y = 0 }, -- havent added the sprite to the sheet yet
	cost = 8,
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	calculate = function(self, card, context)
		if context.selling_self and FG.config.extra_jokers then
			G.GAME.pool_flags.alternate_spawn = true
			for k, v in pairs(G.P_CENTERS) do
				if string.find(k, 'j_') and not string.find(k, "_fg_") then
					G.P_CENTERS[k]['no_pool_flag'] = 'alternate_spawn'
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
	eternal_compat = false,
	perishable_compat = false,
	pos = { x = 5, y = 0 }, -- read above
	cost = 8,
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	calculate = function(self, card, context)
		if context.selling_self and FG.config.extra_jokers then
			G.GAME.pool_flags.alternate_spawn = false
		end
	end
}
-- Flipped Script
SMODS.Joker {
	key = 'flipped_script',
	config = { extra = {} },
	rarity = 3,
	atlas = 'newjokers',
	yes_pool_flag = 'alternate_spawn',
	pos = { x = 6, y = 0 },
	cost = 8,
	eternal_compat = false,
	perishable_compat = false,
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	calculate = function(self, card, context)
		if context.selling_self then
			G.E_MANAGER:add_event(Event({
				func = function()
					for i in ipairs(G.jokers.cards) do
						local currentCard = G.jokers.cards[i]
						if FG.FUNCS.is_alternate(currentCard.config.center_key, FG.ALTS.joker_equivalents) == "v" then
							FG.FUNCS.alternate_card(currentCard,FG.ALTS.joker_equivalents)
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
	yes_pool_flag = 'alternate_spawn',
	pos = { x = 6, y = 0 },
	cost = 4,
	eternal_compat = false,
	perishable_compat = false,
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	calculate = function(self, card, context)
		if context.selling_self then
			G.E_MANAGER:add_event(Event({
				func = function()
					for i in ipairs(G.jokers.cards) do
						local currentCard = G.jokers.cards[i]
						if FG.FUNCS.is_alternate(currentCard.config.center_key, FG.ALTS.joker_equivalents) == "k" then
							FG.FUNCS.alternate_card(currentCard,FG.ALTS.joker_equivalents)
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
	key = 'script_flipped',
	config = { extra = {} },
	rarity = 3,
	atlas = 'newjokers',
	pos = { x = 7, y = 0 },
	cost = 8,
	eternal_compat = false,
	perishable_compat = false,
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	calculate = function(self, card, context)
		if context.selling_self then
			G.E_MANAGER:add_event(Event({
				func = function()
					sendInfoMessage("Should be changing if i did it right", "MyInfoLogger")
					for i in ipairs(G.jokers.cards) do
						local currentCard = G.jokers.cards[i]
						FG.FUNCS.flip_editions(currentCard)
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
	no_pool_flag = 'alternate_spawn',
	in_pool = function (self, args)
		if FG.config.extra_jokers and FG.FUNCS.allow_duplicate(self) and not G.GAME.pool_flags.alternate_spawn then return true else return false end
	end,
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
							local card = create_card('aberration', G.consumeables, nil, nil, nil, nil, nil, '8ba')
							card:add_to_deck()
							G.consumeables:emplace(card)
							G.GAME.consumeable_buffer = 0
							return true
						end)
					}))
					card_eval_status_text(card, 'extra', nil, nil, nil,
						{ message = localize('k_plus_aberration'), colour = G.C.PURPLE })
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
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args)
		if FG.config.extra_jokers and FG.FUNCS.allow_duplicate(self) and not G.GAME.pool_flags.alternate_spawn then return true else return false end
	end,
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
								local card = create_card('aberration', G.consumeables, nil, nil, nil, nil, nil, '8ba')
								card:add_to_deck()
								G.consumeables:emplace(card)
								G.GAME.consumeable_buffer = 0
								return true
							end)
						}))
						card_eval_status_text(card, 'extra', nil, nil, nil,
							{ message = localize('k_plus_aberration'), colour = G.C.PURPLE })
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
	no_pool_flag = 'alternate_spawn',
	in_pool = function (self, args)
		if FG.config.extra_jokers and FG.FUNCS.allow_duplicate(self) and not G.GAME.pool_flags.alternate_spawn then return true else return false end
	end,
	calculate = function(self, card, context)
		if context.skip_blind then
			for i = 1, #G.consumeables.cards do
				G.consumeables.cards[i]:start_dissolve(nil, true, 1, true)
				G.E_MANAGER:add_event(Event({
					trigger = 'before',
					delay = 0.0,
					func = (function()
						local card = create_card('aberration', G.consumeables, nil, nil, nil, nil, nil, '8ba')
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
	yes_pool_flag = 'alternate_spawn',
	pos = { x = 1, y = 0 },
	cost = 8,
	in_pool = function (self, args)
		if FG.config.extra_jokers and FG.FUNCS.allow_duplicate(self) and not G.GAME.pool_flags.alternate_spawn then return true else return false end
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.individual then
			if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
				for i = 1, G.consumeables.config.card_limit - #G.consumeables.cards + G.GAME.consumeable_buffer do
					G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
					G.E_MANAGER:add_event(Event({
						trigger = 'before',
						delay = 0.0,
						func = (function()
							local card = create_card('aberration', G.consumeables, nil, nil, nil, nil, nil, '8ba')
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
	in_pool = function (self, args)
		if FG.config.extra_jokers and FG.FUNCS.allow_duplicate(self) and not G.GAME.pool_flags.alternate_spawn then return true else return false end
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
	in_pool = function (self, args)
		if FG.config.extra_jokers and FG.FUNCS.allow_duplicate(self) and not G.GAME.pool_flags.alternate_spawn then return true else return false end
	end,
	calculate = function(self, card, context)
		if context.other_joker then
			if (context.other_joker.config.center.yes_pool_flag == "alternate") then
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
	in_pool = function (self, args)
		if FG.config.extra_jokers and FG.FUNCS.allow_duplicate(self) and not G.GAME.pool_flags.alternate_spawn then return true else return false end
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
								local card = create_card('aberration', G.consumeables, nil, nil, nil, nil, nil, '8ba')
								card:add_to_deck()
								G.consumeables:emplace(card)
								G.GAME.consumeable_buffer = 0
								return true
							end)
						}))
						card_eval_status_text(card, 'extra', nil, nil, nil,
							{ message = localize('k_plus_aberration'), colour = G.C.PURPLE })
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
	yes_pool_flag = 'alternate_spawn',
	config = { extra = { amount = 2 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.amount } }
	end,
	in_pool = function (self, args)
		if FG.config.extra_jokers and FG.FUNCS.allow_duplicate(self) and not G.GAME.pool_flags.alternate_spawn then return true else return false end
	end,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.using_consumeable then
			if context.consumeable.ability.set == 'aberration' then
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
-- Mango
SMODS.Joker {
	key = 'mango',
	rarity = 1,
	atlas = 'newjokers',
	pos = { x = 8, y = 0 },
	cost = 1,
	config = { extra = { mult = 15, lessmult = 2.5 } },
	in_pool = function (self, args)
		if FG.config.extra_jokers and FG.FUNCS.allow_duplicate(self) and not G.GAME.pool_flags.alternate_spawn then return true else return false end
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.lessmult } }
	end,
	calculate = function(self, card, context)
		if context.using_consumeable then
			if context.consumeable.ability.set == 'abberation' then
				card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.lessmult
				G.E_MANAGER:add_event(Event({
					func = function()
						card:juice_up(0.5, 0.5)
						return true
					end
				}))
			if card.ability.extra.mult <= -1 then
				card:start_dissolve(nil, true, 1, true)
				return {
						message = 'Eated!',
						colour = G.C.MULT
					}
				end
			end
		end
		if context.joker_main then 
			return {
				mult_mod = card.ability.extra.mult,
				message = '+' .. card.ability.extra.mult,
				colour = G.C.MULT
			}
		end
	end
}
-- Mango alt
SMODS.Joker {
	key = 'mangoalt',
	rarity = 1,
	atlas = 'newjokers',
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args)
		if FG.config.extra_jokers and FG.FUNCS.allow_duplicate(self) and not G.GAME.pool_flags.alternate_spawn then return true else return false end
	end,
	pos = { x = 8, y = 0 },
	cost = 1,
	config = { extra = { mult = 15, lessmult = 5 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.lessmult } }
	end,
	calculate = function(self, card, context)
		if context.buying_card then
			if card.ability.set == 'Joker' then
				card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.lessmult
				G.E_MANAGER:add_event(Event({
					func = function()
						card:juice_up(0.5, 0.5)
						return true
					end
				}))
				if card.ability.extra.mult <= -1 then
					card:start_dissolve(nil, true, 1, true)
					return {
						message = 'Eated!',
						colour = G.C.MULT
					}
				end
			end
		end
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = '+' .. card.ability.extra.mult,
				colour = G.C.MULT
			}
		end
	end
}
SMODS.Joker{
	key = "oscillator",
	atlas = "oscillator_atlas",
	pos = { x = 0, y = 1},
	rarity = 1,
	cost = 3,
	yes_pool_flag = 'alternate_spawn',
	config = {
		fg_alternate = {
			chips = 50
		},
		extra = {
			increase = 25,
			decrease = 25,
			frame = 0,
			y_frame = 1,
			delay = .5,
		}
	},
	add_to_deck = function (self, card, from_debuff)
		local c = pseudorandom('mila',1,100)
		if c >= 1 and c <= 33 then card.ability.extra.y_frame = 1
		elseif c >= 34 and c <= 66 then card.ability.extra.y_frame = 2
		elseif c >= 67 and c <= 99 then card.ability.extra.y_frame = 3
		else card.ability.extra.y_frame = 0 end
	end,
	update = function (self, card, dt)
		if not card.ability and not card.ability.extra then return end
		card.ability.extra.delay = card.ability.extra.delay - dt
		if card.ability.extra.delay <= 0 then -- Runs once the frame needs updating
			if card.ability.extra.frame >= 3 then card.ability.extra.frame = 0 end
			card.ability.extra.frame = card.ability.extra.frame + 1
			card.children.center:set_sprite_pos({x = card.ability.extra.frame or 0, y = card.ability.extra.y_frame or 1})
			card.ability.extra.delay = .5
		end
	end,
	loc_vars = function (self, info_queue, card)
		return {
			vars = {
				card.ability.fg_alternate.chips,
				card.ability.extra.increase,
				card.ability.extra.decrease
			}
		}
	end,
	in_pool = function (self, args)
		if FG.config.extra_jokers and FG.FUNCS.allow_duplicate(self) and not G.GAME.pool_flags.alternate_spawn then return true else return false end
	end,
	blueprint_compat = true,
	calculate = function (self, card, context)
		if context.setting_blind then
			card.ability.fg_alternate.chips = card.ability.fg_alternate.chips + card.ability.extra.increase
			FG.FUNCS.card_eval_status_text{
				card = card,
				message = "+"..card.ability.extra.increase,
				mode = "literal",
				colour = "chips"
			}
		end
		if context.end_of_round and context.cardarea == G.jokers then
			if card.ability.fg_alternate.chips > 0 then
					FG.FUNCS.card_eval_status_text{
					card = card,
					message = "-"..card.ability.extra.decrease,
					mode = "literal",
					colour = "chips"
				}
			end
			card.ability.fg_alternate.chips = card.ability.fg_alternate.chips - card.ability.extra.decrease
			if card.ability.fg_alternate.chips <= 0 then card.ability.fg_alternate.chips = 0 end
		end
		if context.joker_main and card.ability.fg_alternate.chips > 0 then return {chips = card.ability.fg_alternate.chips} end
	end
}

SMODS.Joker{
	key = "oscillator_alt",
	atlas = "oscillator_atlas",
	pos = { x = 0, y = 1},
	rarity = 1,
	cost = 3,
	yes_pool_flag = 'alternate_spawn',
	config = {
		fg_alternate = {
			chips = 50
		},
		extra = {
			increase = 25,
			decrease = 25,
			frame = 0,
			y_frame = 1,
			delay = .5,
		}
	},
	add_to_deck = function (self, card, from_debuff)
		local c = pseudorandom('mila',1,100)
		if c >= 1 and c <= 33 then card.ability.extra.y_frame = 1
		elseif c >= 34 and c <= 66 then card.ability.extra.y_frame = 2
		elseif c >= 67 and c <= 99 then card.ability.extra.y_frame = 3
		else card.ability.extra.y_frame = 0 end
	end,
	update = function (self, card, dt)
		if not card.ability and not card.ability.extra then return end
		card.ability.extra.delay = card.ability.extra.delay - dt
		if card.ability.extra.delay <= 0 then -- Runs once the frame needs updating
			if card.ability.extra.frame >= 3 then card.ability.extra.frame = 0 end
			card.ability.extra.frame = card.ability.extra.frame + 1
			card.children.center:set_sprite_pos({x = card.ability.extra.frame or 0, y = card.ability.extra.y_frame or 1})
			card.ability.extra.delay = .5
		end
	end,
	loc_vars = function (self, info_queue, card)
		return {
			vars = {
				card.ability.fg_alternate.chips,
				card.ability.extra.increase,
				card.ability.extra.decrease
			}
		}
	end,
	in_pool = function (self, args)
		if FG.config.extra_jokers and FG.FUNCS.allow_duplicate(self) and not G.GAME.pool_flags.alternate_spawn then return true else return false end
	end,
	calculate = function (self, card, context)
		if context.setting_blind then
			if card.ability.fg_alternate.chips > 0 then
				FG.FUNCS.card_eval_status_text{
					card = card,
					message = "-"..card.ability.extra.decrease,
					mode = "literal",
					colour = "chips"
				}				
			end
			card.ability.fg_alternate.chips = card.ability.fg_alternate.chips - card.ability.extra.decrease
			if card.ability.fg_alternate.chips <= 0 then card.ability.fg_alternate.chips = 0 end
		end
		if context.end_of_round and context.cardarea == G.jokers then
			card.ability.fg_alternate.chips = card.ability.fg_alternate.chips + card.ability.extra.increase
			FG.FUNCS.card_eval_status_text{
				card = card,
				message = "+"..card.ability.extra.increase,
				mode = "literal",
				colour = "chips"
			}
		end
		if context.joker_main and card.ability.fg_alternate.chips > 0 then return {chips = card.ability.fg_alternate.chips} end
	end
}
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
	yes_pool_flag = 'alternate_spawn',
	pos = { x = 0, y = 0 },
	cost = 2,
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			return {
				mult_mod = card.ability.extra.mult,
				message = "+" .. card.ability.extra.mult .. " Mult",
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
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	pos = { x = 6, y = 1 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult_gain, card.ability.extra.currentMult } }
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual then
			local playingCard = context.other_card
			if playingCard:is_suit('Diamonds') then
				card.ability.extra.currentMult = card.ability.extra.currentMult + card.ability.extra.mult_gain
				FG.FUNCS.card_eval_status_text{
					card = card,
					message = "Upgrade!",
					mode = "literal"
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
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	pos = { x = 7, y = 1 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult_gain, card.ability.extra.currentMult } }
	end,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual then
			local playingCard = context.other_card
			if playingCard:is_suit('Hearts') then
				card.ability.extra.currentMult = card.ability.extra.currentMult + card.ability.extra.mult_gain
				FG.FUNCS.card_eval_status_text{
					card = card,
					message = "Upgrade!",
					mode = "literal"
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
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	pos = { x = 8, y = 1 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult_gain, card.ability.extra.currentMult } }
	end,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual then
			local playingCard = context.other_card
			if playingCard:is_suit('Spades') then
				card.ability.extra.currentMult = card.ability.extra.currentMult + card.ability.extra.mult_gain
				FG.FUNCS.card_eval_status_text{
					card = card,
					message = "Upgrade!",
					mode = "literal"
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
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	pos = { x = 9, y = 1 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult_gain, card.ability.extra.currentMult } }
	end,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual then
			local playingCard = context.other_card
			if playingCard:is_suit('Clubs') then
				card.ability.extra.currentMult = card.ability.extra.currentMult + card.ability.extra.mult_gain
				FG.FUNCS.card_eval_status_text{
					card = card,
					message = "Upgrade!",
					mode = "literal"
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
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	pos = { x = 2, y = 0 },
	cost = 2,
	blueprint_compat = true,
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
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
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
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
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
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
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
	yes_pool_flag = 'alternate_spawn',
	pos = { x = 6, y = 0 },
	cost = 2,
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
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
	yes_pool_flag = 'alternate_spawn',
	pos = { x = 0, y = 14 },
	cost = 2,
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
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
	yes_pool_flag = 'alternate_spawn',
	pos = { x = 1, y = 14 },
	cost = 2,
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
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
	yes_pool_flag = 'alternate_spawn',
	pos = { x = 2, y = 14 },
	cost = 2,
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
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
	yes_pool_flag = 'alternate_spawn',
	pos = { x = 3, y = 14 },
	cost = 2,
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
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
	yes_pool_flag = 'alternate_spawn',
	pos = { x = 4, y = 14 },
	cost = 2,
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
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
	yes_pool_flag = 'alternate_spawn',
	pos = { x = 5, y = 5 },
	cost = 2,
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
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
					{
						message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips + card.ability.extra.mult * sliced_card.sell_cost } },
						colour =
							G.C.CHIPS,
						no_juice = true
					})
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
	yes_pool_flag = 'alternate_spawn',
	pos = { x = 1, y = 2 },
	cost = 2,
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
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
	yes_pool_flag = 'alternate_spawn',
	pos = { x = 2, y = 2 },
	cost = 2,
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
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
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
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
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
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

local function generateArrayMisprint(min, max) 
	local mults = {}
	for i = 1, 10 do
		local num = (pseudorandom('misprint', min, max) / 100)
		table.insert(mults, "X"..tostring(num))
	end
	return mults
end
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
			},
			main_end = {
				{n=G.UIT.R, nodes = {
					{n=G.UIT.C, config= {align="bm", padding = 0.02}, nodes={
						{n=G.UIT.C, config={align = "m", colour=G.C.RED, r=0.7, padding=0.05}, nodes={
							{
								n = G.UIT.O,
								config = {
									object = DynaText({
										string = generateArrayMisprint(card.ability.extra.Xmult_min,card.ability.extra.Xmult_max),
										colours = { G.C.WHITE },
										pop_in_rate = 9999999,
										silent = true,
										random_element = true,
										pop_delay = 0.30,
										scale = 0.32,
										min_cycle_time = 0,
									}),
								},
							},
						}}
					}},
					{n=G.UIT.C, config={align = "m", colour=G.C.WHITE, r=0.05, padding=0.05}, nodes={
						{n=G.UIT.T, config={text = "Mult", colour = G.C.UI.TEXT_DARK, scale=0.3}}
					}}
				}},
				
			}
		}
	end,
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
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
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
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
	yes_pool_flag = 'alternate_spawn',
	pos = { x = 1, y = 5 },
	config = { extra = { retriggers = 1 } },
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.retriggers
			}
		}
	end,
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	calculate = function(self, card, context)
		local found_card = false
		if context.repetition and context.cardarea == G.play and
		(context.other_card:get_id() == 14 or -- ACE
		context.other_card:get_id() == 2 or
		context.other_card:get_id() == 3 or
		context.other_card:get_id() == 5 or
		context.other_card:get_id() == 8 or
		context.other_card:get_id() == 13) then
			found_card = true
			return {
				repetitions = 1,
				card = card
			}
		end
		if context.after then
			local sound_pitch = 0.8
			for k, v in ipairs(context.scoring_hand) do
				if v.base.value == "Ace" or
				v.base.value == "2" or
				v.base.value == "3" or
				v.base.value == "5" or
				v.base.value == "8" or
				v.base.value == "King" then
					G.E_MANAGER:add_event(Event({
						func = function()	
							v:flip()
							play_sound("tarot2", sound_pitch)
							sound_pitch = sound_pitch + 0.1
							return true
						end
					}))
				end
				if v.base.value == "Ace" then
					G.E_MANAGER:add_event(Event({
					trigger = 'after', delay = .25, func = function()
						local card,msg = SMODS.change_base(v, v.base.suit, "2")
						return true
					end
					}))
				elseif v.base.value == "2" then
					G.E_MANAGER:add_event(Event({
					trigger = 'after', delay = .25, func = function()
						local card,msg = SMODS.change_base(v, v.base.suit, "3")
						return true
					end
					}))
				elseif v.base.value == "3" then
					G.E_MANAGER:add_event(Event({
					trigger = 'after', delay = .25, func = function()
						local card,msg = SMODS.change_base(v, v.base.suit, "5")
						return true
					end
					}))
				elseif v.base.value == "5" then
					G.E_MANAGER:add_event(Event({
					trigger = 'after', delay = .25, func = function()
						local card,msg = SMODS.change_base(v, v.base.suit, "8")
						return true
					end
					}))
				elseif v.base.value == "8" then
					G.E_MANAGER:add_event(Event({
					trigger = 'after', delay = .25, func = function()
						local card,msg = SMODS.change_base(v, v.base.suit, "King")
						return true
					end
					}))
				elseif v.base.value == "King" then
					G.E_MANAGER:add_event(Event({
					trigger = 'after', delay = .25, func = function()
						local card,msg = SMODS.change_base(v, v.base.suit, "Ace")
						return true
					end
					}))
				end
			end
			
			for _, v in ipairs(context.scoring_hand) do
				if v.base.value == "Ace" or
				v.base.value == "2" or
				v.base.value == "3" or
				v.base.value == "5" or
				v.base.value == "8" or
				v.base.value == "King" then
					found_card = true
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = 0.25,
						func = function()
							v:flip()
							play_sound("tarot2", sound_pitch)
							sound_pitch = sound_pitch + 0.1
							return true
						end
					}))
				end
			end
			if found_card then
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 2,
					func = function() return true end
				}))
			end
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
	yes_pool_flag = 'alternate_spawn',
	blueprint_compat = true,
	config = { extra = { chips = 0, chip_gain = 15 } },
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.chips,
				card.ability.extra.chip_gain
			}
		}
	end,
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and context.other_card:is_face() then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
			card_eval_status_text(card, 'extra', nil, nil, nil, { message = "Upgrade!" })

		end
		if context.joker_main and card.ability.extra.chips > 0 then
			return {
				chip_mod = card.ability.extra.chips,
				message = '+' .. card.ability.extra.chips
			}
		end
	end
}
-- Gros Michael
SMODS.Joker{
	key = "gros_michel",
	rarity = 1,
	cost = 4,
	atlas = "jokers_alt",
	pos = { x = 7, y = 6},
	yes_pool_flag = 'alternate_spawn',
	no_pool_flag = "fg_gros_michel_extinct",
	config = {
		extra = {
			xmult = 1.5,
			max_chance = 6
		}
	},
	loc_vars = function (self, info_queue, card)
		return {
			vars = {
				card.ability.extra.xmult,
				G.GAME.probabilities.normal or 1,
				card.ability.extra.max_chance
			}
		}
	end,
	blueprint_compat = true,
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	calculate = function (self, card, context)
		if context.joker_main then return {xmult = card.ability.extra.xmult} end
		if context.end_of_round and context.cardarea == G.jokers then
			if FG.FUNCS.random_chance(card.ability.extra.max_chance) then
			play_sound("tarot2",1.5,1)
			card:start_dissolve()
			G.GAME.pool_flags.fg_gros_michel_extinct = true
			return {
				message = "Extint?!"
			}
			end
			return {
				message = "Safe!?"
			}
		end
	end
}
-- Even Steven
SMODS.Joker{
	key = "even_steven",
	atlas = "jokers_alt",
	pos = { x = 8, y = 3},
	rarity = 1,
	cost = 2,
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	config = {
		extra = {
			mult_i = 2, -- Mult increase
			mult_t = 0  -- Mult total
		}
	},
	loc_vars = function (self, info_queue, card)
		return {
			vars = {
				card.ability.extra.mult_i,
				card.ability.extra.mult_t
			}
		}
	end,
	blueprint_compat = true,
	calculate = function (self, card, context)
		if context.individual and context.cardarea == G.play then
			local id = FG.FUNCS.get_card_info(context.other_card).id
			local value = FG.FUNCS.get_card_info(context.other_card).rank
			if (id == 2 or id == 4 or id == 6 or id == 8) then
				card.ability.extra.mult_t = card.ability.extra.mult_t + card.ability.extra.mult_i
				FG.FUNCS.card_eval_status_text{
					card = card,
					message = "Upgrade!",
					mode = "literal"
				}
			end
		end
		if context.joker_main then return {mult = card.ability.extra.mult_t} end
	end
}
-- Odd Todd
SMODS.Joker{
	key = "odd_todd",
	atlas = "jokers_alt",
	pos = { x = 9, y = 3},
	rarity = 1,
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	config = {
		extra = {
			chips_i = 13, -- Chips increase
			chips_t = 0  -- Chips total
		}
	},
	loc_vars = function (self, info_queue, card)
		return {
			vars = {
				card.ability.extra.chips_i,
				card.ability.extra.chips_t
			}
		}
	end,
	blueprint_compat = true,
	calculate = function (self, card, context)
		if context.individual and context.cardarea == G.play then
			local id = FG.FUNCS.get_card_info(context.other_card).id
			local value = FG.FUNCS.get_card_info(context.other_card).rank
			if (id == 1 or id == 3 or id == 5 or id == 7 or id == 9) then
				card.ability.extra.chips_t = card.ability.extra.chips_t + card.ability.extra.chips_i
				FG.FUNCS.card_eval_status_text{
					card = card,
					message = "Upgrade!",
					mode = "literal"
				}
			end
		end
		if context.joker_main then return {chips = card.ability.extra.chips_t} end
	end
}
-- Scholar
SMODS.Joker{
	key = "scholar",
	atlas = "jokers_alt",
	pos = { x = 3, y = 6},
	rarity = 2,
	cost = 4,
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	config = {
		extra = {
			xmult = 3,
			amount = 4,
			card = "Ace"
		}
	},
	loc_vars = function (self, info_queue, card)
		return {
			vars = {
				card.ability.extra.xmult,
				card.ability.extra.amount,
				card.ability.extra.card
			}
		}
	end,
	blueprint_compat = true,
	calculate = function (self, card, context)
		if context.joker_main then
			local count = 0
			for _,v in ipairs(G.play.cards) do
				if FG.FUNCS.get_card_info(v).rank == card.ability.extra.card then
					count = count + 1
				end
			end
			if count >= card.ability.extra.amount then return {xmult = card.ability.extra.xmult} end
		end
	end
}
-- Business Card
SMODS.Joker {
	key = "business",
	atlas = "jokers_alt",
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	pos = { x = 1, y = 4},
	rarity = 2,
	cost = 4,
	config = {
		extra = {
			max_chance = 4
		}
	},
	loc_vars = function (self, info_queue, card)
		return {
			vars = {
				G.GAME.probabilities.normal or 1,
				card.ability.extra.max_chance
			}
		}
	end,
	blueprint_compat = true,
	calculate = function (self, card, context)
		if context.after then
			for _,v in ipairs(context.scoring_hand) do
				if FG.FUNCS.get_card_info(v).is_face and FG.FUNCS.random_chance(card.ability.extra.max_chance) and FG.FUNCS.get_card_info(v).key == "c_base" then
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.2,
						func = function()
							v:set_ability(SMODS.poll_enhancement{guaranteed = true})
							v:juice_up()
							return true
						end
					}))
					FG.FUNCS.card_eval_status_text{
						card = card,
						message = "Enhanced!",
						mode = "literal"
					}
				end
			end
		end
	end
}
-- Supernova TBA

-- Ride the buss
SMODS.Joker{
	key = "ride_the_bus",
	atlas = "jokers_alt",
	pos = { x = 1, y = 6},
	rarity = 1,
	cost = 3,
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	config = {
		extra = {
			mult = 25,
			mult_d = 1,
		}
	},
	loc_vars = function (self, info_queue, card)
		return {
			vars = {
				card.ability.extra.mult_d,
				card.ability.extra.mult
			}
		}
	end,
	blueprint_compat = true,
	calculate = function (self, card, context)
		if context.before and not context.blueprint then
			
			local face = 0
			for _,v in ipairs(G.play.cards) do
				if FG.FUNCS.get_card_info(v).is_face then
					card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_d
					face = face + 1
				end
			end
			if face > 0 then FG.FUNCS.card_eval_status_text{card = card, message = "-"..face.." Mult!", mode = "literal", colour = "mult"} end
			if card.ability.extra.mult <= 0 then
				FG.FUNCS.card_eval_status_text{card = card, message = "Last stop!", mode = "literal", colour = "red"} 
				G.E_MANAGER:add_event(Event({
					func = function ()
						card:start_dissolve()
						return true
					end
				}))
				return {}
			end
		end
		if context.joker_main and card.ability.extra.mult > 0 then
			return {mult = card.ability.extra.mult}
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
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	config = { extra = { mult_gain = 4, mult = 0, sold = 0 } },
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.mult_gain,
				card.ability.extra.mult
			}
		}
	end,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.selling_card and not context.repetition and not context.blueprint then
			card.ability.extra.sold = card.ability.extra.sold + 1
			card.ability.extra.mult = card.ability.extra.mult_gain * card.ability.extra.sold
			return {
				message = "+"..card.ability.extra.mult_gain.." Mult"
			}
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
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
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
-- Ice cream
SMODS.Joker{
    key = "ice_cream",
    atlas = "jokers_alt",
    pos = { x = 4, y = 10},
    rarity = 1,
    cost = 2,
	yes_pool_flag = 'alternate_spawn',
    in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end, -- Custom logic for spawning
    config = {
        fg_alternate = {}, -- Kept between alternations
        extra = {
			chips = 120,
			chips_d = 15,
		}
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
				card.ability.extra.chips,
				card.ability.extra.chips_d
			}
        }
    end,
    blueprint_compat = true,
    calculate = function (self, card, context)
		if context.setting_blind and not context.blueprint then
			card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chips_d
			if card.ability.extra.chips <= 0 then
				FG.FUNCS.card_eval_status_text{
					card = card,
					message = "Melted!",
					mode = "literal",
					colour = "blue"
				}
				card:start_dissolve()
				return
			end
			FG.FUNCS.card_eval_status_text{
				card = card,
				message = "-"..card.ability.extra.chips_d,
				mode = "literal",
				colour = "blue"
			}
		end
		if context.joker_main then
			return {chips = card.ability.extra.chips}
		end
    end
}
-- Joker
SMODS.Joker{
    key = "faceless",
    atlas = "jokers_alt",
    pos = { x = 1, y = 11 },
    rarity = 1,
    cost = 2,
	yes_pool_flag = 'alternate_spawn',
    in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end, -- Custom logic for spawning
    config = {
        fg_alternate = {}, -- Kept between alternations
        extra = {
			xmult = 1.5
		}
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
				card.ability.extra.xmult
			}
        }
    end,
    blueprint_compat = true,
    calculate = function (self, card, context)
		if context.joker_main then
			local face = false
			for _,v in ipairs(G.play.cards) do
				if FG.FUNCS.get_card_info(v).is_face then
					face = true
				end
			end
			if not face then return {xmult = card.ability.extra.xmult} end
		end
    end
}
-- Joker
SMODS.Joker{
    key = "red_card",
    atlas = "jokers_alt",
    pos = { x = 7, y = 11},
    rarity = 1,
    cost = 2,
	yes_pool_flag = 'alternate_spawn',
    in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end, -- Custom logic for spawning
    config = {
        fg_alternate = {}, -- Kept between alternations
        extra = {
			mult = 0,
			mult_i = 15
		}
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
				card.ability.extra.mult,
				card.ability.extra.mult_i
			}
        }
    end,
    blueprint_compat = true,
    calculate = function (self, card, context)
		if context.skip_blind and not context.blueprint then
			card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_i
			FG.FUNCS.card_eval_status_text{
				card = card,
				message = "+"..card.ability.extra.mult.." Mult",
				mode = "literal",
				colour = "mult"
			}
		end
		if context.joker_main then return {mult = card.ability.extra.mult} end
    end
}
-- Joker
SMODS.Joker{
    key = "baron",
    atlas = "jokers_alt",
    pos = { x = 6, y = 12},
    rarity = 3,
    cost = 6,
	yes_pool_flag = 'alternate_spawn',
    in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end, -- Custom logic for spawning
    config = {
        fg_alternate = {}, -- Kept between alternations
        extra = {
			xmult = 1,
			xmult_i = 0.1
		}
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
				card.ability.extra.xmult,
				card.ability.extra.xmult_i
			}
        }
    end,
    blueprint_compat = true,
    calculate = function (self, card, context)
		if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
			for _,v in ipairs(G.hand.cards) do
				if FG.FUNCS.get_card_info(v).rank == "King" then
					card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_i
					G.E_MANAGER:add_event(Event({
						func = function ()
							v:juice_up()
							return true
						end
					}))
					FG.FUNCS.card_eval_status_text{
						card = card,
						message = "+X"..card.ability.extra.xmult_i.." Mult",
						mode = "literal",
						colour = "mult"
					}
				end
			end
		end
		if context.joker_main then return {xmult = card.ability.extra.xmult} end
    end
}
-- Joker
SMODS.Joker{
    key = "cloud_9",
    atlas = "jokers_alt",
    pos = { x = 7, y = 12},
    rarity = 1,
    cost = 2,
	yes_pool_flag = 'alternate_spawn',
    in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end, -- Custom logic for spawning
    config = {
        fg_alternate = {}, -- Kept between alternations
        extra = {
			dollars = 4
		}
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
				card.ability.extra.dollars
			}
        }
    end,
    blueprint_compat = false,
    calculate = function (self, card, context)
    end,
	calc_dollar_bonus = function (self, card)
		return card.ability.extra.dollars
	end
}
-- Joker
SMODS.Joker{
    key = "rocket",
    atlas = "jokers_alt",
    pos = { x = 8, y = 12},
    rarity = 1,
    cost = 2,
	yes_pool_flag = 'alternate_spawn',
    in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end, -- Custom logic for spawning
    config = {
        fg_alternate = {}, -- Kept between alternations
        extra = {
			payout = 10,
			payout_d = 2
		}
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
				card.ability.extra.payout,
				card.ability.extra.payout_d
			}
        }
    end,
    blueprint_compat = false,
    calculate = function (self, card, context)
		if context.skip_blind and not context.blueprint then
			card.ability.extra.payout = card.ability.extra.payout - card.ability.extra.payout_d
			FG.FUNCS.card_eval_status_text{
				card = card,
				message = "-$2",
				mode = "literal",
				colour = "gold"
			}
		end
    end,
	calc_dollar_bonus = function (self, card)
		return card.ability.extra.payout
	end
}
--[[-- Splash | does not work help
SMODS.Joker{
	key = "splash",
	atlas = "jokers_alt",
	pos = { x = 6, y = 10},
	rarity = 1,
	calculate = function (self, card, context)
		if context.before and context.cardarea == G.play then
			for i,v in ipairs(G.play.hand) do
				SMODS.debuff_card(v,false)
			end
		end
	end
}
]]
-- Cavendish
SMODS.Joker{
	key = "cavendish",
	atlas = "jokers_alt",
	pos = { x = 5, y = 11},
	yes_pool_flag = "fg_gros_michel_extinct",
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	rarity = 2,
	config = {
		extra = {
			xmult = 10,
			xmult_r = 1,
			xmult_c = 10
		}
	},
	loc_vars = function (self, info_queue, card)
		return {
			vars = {
				card.ability.extra.xmult,
				card.ability.extra.xmult_r,
				G.GAME.probabilities.normal or 1,
				card.ability.extra.xmult_c
			}
		}		
	end,
	blueprint_compat = true,
	calculate = function (self, card, context)
		if context.joker_main then return {xmult = card.ability.extra.xmult} end
		if context.end_of_round and context.cardarea == G.jokers then
			if FG.FUNCS.random_chance(card.ability.extra.xmult_c) then
				card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.xmult_r
				FG.FUNCS.card_eval_status_text{
					card = card,
					message = "-X1",
					mode = "literal",
					colour = "red"
				}
			else
				return {
					message = "Safe!?"
				}
			end
			if card.ability.extra.xmult <= 1 then
				card:start_dissolve()
				play_sound("tarot2",1.5,1)
				return {
					message = "Extint?!"
				}
			end	
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
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	pos = { x = 5, y = 4 },
	cost = 2,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.before and context.cardarea == G.jokers and not context.repetition and not context.blueprint then
			if (next(context.poker_hands[card.ability.type])) then
				card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
				FG.FUNCS.card_eval_status_text{
					card = card,
					message = "Upgrade!",
					mode = "literal"
				}
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
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	pos = { x = 6, y = 4 },
	cost = 2,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.before and context.cardarea == G.jokers and not context.repetition and not context.blueprint then
			if (next(context.poker_hands[card.ability.type])) then
				card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
				FG.FUNCS.card_eval_status_text{
					card = card,
					message = "Upgrade!",
					mode = "literal"
				}
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
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	pos = { x = 7, y = 4 },
	cost = 2,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.before and context.cardarea == G.jokers and not context.repetition and not context.blueprint then
			if (next(context.poker_hands[card.ability.type])) then
				card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
				FG.FUNCS.card_eval_status_text{
					card = card,
					message = "Upgrade!",
					mode = "literal"
				}
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
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	pos = { x = 8, y = 4 },
	cost = 2,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.before and context.cardarea == G.jokers and not context.repetition and not context.blueprint then
			if (next(context.poker_hands[card.ability.type])) then
				card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
				FG.FUNCS.card_eval_status_text{
					card = card,
					message = "Upgrade!",
					mode = "literal"
				}
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
--[[ Joker
SMODS.Joker{
    key = "ancient",
    atlas = "jokers_alt",
    pos = { x = 7, y = 15},
    rarity = 1,
    cost = 2,
      yes_pool_flag = 'alternate_spawn',
    in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end, -- Custom logic for spawning
    config = {
        fg_alternate = {}, -- Kept between alternations
        extra = {
			xmult = 1,
			xmult_i = 0.5,
		}
    },
    loc_vars = function (self, info_queue, card)
		local suit = pseudorandom_element(SMODS.Suits)
		suit = suit.name or "Spades"
        return {
            vars = {
				card.ability.extra.xmult,
				card.ability.extra.xmult_i,
				suit,
				colours = {
					G.C.SUITS.Spades
				}
			}
        }
    end,
    blueprint_compat = true,
    calculate = function (self, card, context)
    end
}]]
-- Joker
SMODS.Joker{
    key = "campfire",
    atlas = "jokers_alt",
    pos = { x = 5, y = 15},
    rarity = 3,
    cost = 6,
      yes_pool_flag = 'alternate_spawn',
    in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end, -- Custom logic for spawning
    config = {
        fg_alternate = {}, -- Kept between alternations
        extra = {
			xmult = 1,
			xmult_i = 0.04,
			xmult_d = 0.5,
			xmult_m = 0.75
		}
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
				card.ability.extra.xmult,
				card.ability.extra.xmult_i,
				card.ability.extra.xmult_d,
				card.ability.extra.xmult_m
			}
        }
    end,
    blueprint_compat = true,
    calculate = function (self, card, context)
		if context.discard and not context.blueprint then
			card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_i
			FG.FUNCS.card_eval_status_text{
				card = card,
				message = "+X"..card.ability.extra.xmult_i.." Mult",
				mode = "literal",
				colour = "mult"
			}
		end
		if context.end_of_round and context.cardarea == G.jokers and G.GAME.blind.boss and not context.blueprint then
			card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.xmult_d
			FG.FUNCS.card_eval_status_text{
				card = card,
				message = "-X"..card.ability.extra.xmult_d.." Mult",
				mode = "literal",
				colour = "mult"
			}
			if card.ability.extra.xmult < card.ability.extra.xmult_m then card.ability.extra.xmult = card.ability.extra.xmult_m end
		end
		if context.joker_main then return {xmult = card.ability.extra.xmult} end
    end
}
-- Throwback
SMODS.Joker{
	key = "throwback",
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	atlas = "jokers_alt",
	pos = { x = 5 , y = 7},
	rarity = 2,
	config = {
		extra = {
			xmult = 1,
			xmult_i = 0.35,
			u_shop = false,
		}
	},
	loc_vars = function (self, info_queue, card)
		return {
			vars = {
				card.ability.extra.xmult,
				card.ability.extra.xmult_i
			}
		}
	end,
	blueprint_compat = true,
	calculate = function (self, card, context)
		if context.end_of_round then card.ability.extra.u_shop = false and not context.blueprint end
		if context.buying_card or context.open_booster then
			card.ability.extra.u_shop = true
		end
		if context.ending_shop and not card.ability.extra.u_shop then
			card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_i
			return {
				message = "X"..card.ability.extra.xmult.."!"
			}
		end
		if context.joker_main and card.ability.extra.xmult ~= 1 then
			return {
				xmult = card.ability.extra.xmult
			}
		end

	end
}
-- Joker
SMODS.Joker{
    key = "popcorn",
    atlas = "jokers_alt",
    pos = { x = 1, y = 15},
    rarity = 1,
    cost = 2,
	yes_pool_flag = 'alternate_spawn',
    in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end, -- Custom logic for spawning
    config = {
        fg_alternate = {}, -- Kept between alternations
        extra = {
			mult = 25,
			mult_d = 1
		}
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
				card.ability.extra.mult,
				card.ability.extra.mult_d
			}
        }
    end,
    blueprint_compat = true,
    calculate = function (self, card, context)
		if context.before and not context.blueprint then
			card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_d
			if card.ability.extra.mult <= 0 then
				FG.FUNCS.card_eval_status_text{
					card = card,
					message = "Eaten!",
					mode = "literal",
					colour = "red"
				}
				card:start_dissolve()
				return
			end
			FG.FUNCS.card_eval_status_text{
				card = card,
				message = "-"..card.ability.extra.mult_d,
				mode = "literal",
				colour = "red"
			}
		end
		if context.joker_main then
			return {mult = card.ability.extra.mult}
		end
    end
}
-- Hanging chad
SMODS.Joker{
	key = "hanging_chad",
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	atlas = "jokers_alt",
	pos = { x = 9, y = 6},
	rarity = 3,
	config = {
		extra = {
			enhancement_max = 2,
			seal_max = 6,
			edition_max = 16,
		}
	},
	blueprint_compat = false,
	loc_vars = function (self, info_queue, card)
		return {
			vars = {
				G.GAME.probabilities.normal or 1,
				card.ability.extra.enhancement_max,
				G.GAME.probabilities.normal or 1,
				card.ability.extra.seal_max,
				G.GAME.probabilities.normal or 1,
				card.ability.extra.edition_max
			}
		}
	end,
	calculate = function (self, card, context)
		if context.after and not context.blueprint then
			for i,v in ipairs(context.scoring_hand) do
				if FG.FUNCS.get_card_info(v).key == "c_base" then
					if FG.FUNCS.random_chance(card.ability.extra.enhancement_max) then
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.2,
							func = function ()
								v:set_ability(SMODS.poll_enhancement{guaranteed = true})
								v:juice_up()
								card:juice_up()
								return true
								
							end
						}))
						FG.FUNCS.card_eval_status_text{card = card, message = "Enhanced!", mode = "literal"}	
					end
				elseif not FG.FUNCS.get_card_info(v).seal then	
					if FG.FUNCS.random_chance(card.ability.extra.seal_max) then	
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.2,
							func = function ()
								v.seal = SMODS.poll_seal{guaranteed = true}
								v:juice_up()
								card:juice_up()
								return true
							end
						}))
						FG.FUNCS.card_eval_status_text{card = card, message = "Seal!", mode = "literal"}
					end
				elseif not FG.FUNCS.get_card_info(v).edition then
					if FG.FUNCS.random_chance(card.ability.extra.edition_max) then
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0,2,
							func = function ()
								v:set_edition(poll_edition("mila",1,true,true),true,false)
								v:juice_up()
								card:juice_up()
								return true
							end
						}))
						FG.FUNCS.card_eval_status_text{card = card, message = "Edition!", mode = "literal"}
					end
				end
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
	rarity = 3,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	pos = { x = 9, y = 7 },
	cost = 2,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.joker_main then
			if (next(context.poker_hands[card.ability.type])) then
				for i = 1, #context.scoring_hand do
					if context.scoring_hand[i]:is_suit("Diamonds") then
						G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
						G.E_MANAGER:add_event(Event({
							func = (function()
								G.GAME.dollar_buffer = 0; return true
							end)
						}))
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
	config = { type = 'Flush', extra = { Xmult_gain = 0.4, Xmult = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { localize(card.ability.type, 'poker_hands'), card.ability.extra.Xmult_gain, card.ability.extra.Xmult } }
	end,
	rarity = 3,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate_spawn',
	pos = { x = 0, y = 8 },
	cost = 2,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.before and not context.blueprint then
			if (next(context.poker_hands[card.ability.type])) then
				local extra_suit = false
				for i = 1, #context.scoring_hand do
					if not context.scoring_hand[i]:is_suit("Hearts") then
						extra_suit = true
					end
				end
				if not extra_suit then
					card.ability.extra.Xmult = card.ability.extra.Xmult_gain + card.ability.extra.Xmult
					FG.FUNCS.card_eval_status_text{
						card = card,
						message = "Upgrade!",
						mode = "literal"
					}
				end
			end
		end
		if context.joker_main then
			if card.ability.extra.Xmult ~= 1 then
				return {
					Xmult_mod = card.ability.extra.Xmult,
					message = 'X' .. card.ability.extra.Xmult .. ' Mult'
				}
			end
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
	rarity = 3,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	pos = { x = 1, y = 8 },
	cost = 2,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.before and not context.blueprint then
			if (next(context.poker_hands[card.ability.type])) then
				local extra_suit = false
				for i = 1, #context.scoring_hand do
					if not context.scoring_hand[i]:is_suit("Spades") then
						extra_suit = true
					end
				end
				if not extra_suit then
					card.ability.extra.chips = card.ability.extra.chip_gain + card.ability.extra.chips
					return {
						message = "Upgrade!"
					}
				end
			end
		end
		if context.joker_main and card.ability.extra.chips ~= 0 then
			return {
				chip_mod = card.ability.extra.chips,
				message = '+' .. card.ability.extra.chips .. ' Chips'
			}
		end
	end
}
-- Onyx Agate
SMODS.Joker {
	key = 'agate',
	config = { type = 'Flush', extra = { mult_gain = 12, mult = 0 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { localize(card.ability.type, 'poker_hands'), card.ability.extra.mult_gain, card.ability.extra.mult } }
	end,
	rarity = 3,
	atlas = 'jokers_alt',
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	pos = { x = 2, y = 8 },
	cost = 2,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.before and not context.blueprint then
			if (next(context.poker_hands[card.ability.type])) then
				local extra_suit = false
				for i = 1, #context.scoring_hand do
					if not context.scoring_hand[i]:is_suit("Clubs") then
						extra_suit = true
					end
				end
				if not extra_suit then
					card.ability.extra.mult = card.ability.extra.mult_gain + card.ability.extra.mult
					FG.FUNCS.card_eval_status_text{
						card = card,
						message = "Upgrade!",
						mode = "literal",
					}
				end
			end
		end
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = '+' .. card.ability.extra.mult .. ' Mult'
			}
		end
	end
}
-- Joker
SMODS.Joker{
    key = "hit_the_road",
    atlas = "jokers_alt",
    pos = { x = 8, y = 5},
    rarity = 3,
    cost = 6,
    yes_pool_flag = 'alternate_spawn',
    in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end, -- Custom logic for spawning
    config = {
        fg_alternate = {}, -- Kept between alternations
        extra = {
			xmult = 1,
			xmult_i = 0.1
		}
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
				card.ability.extra.xmult,
				card.ability.extra.xmult_i
			}
        }
    end,
    blueprint_compat = true,
    calculate = function (self, card, context)
		if context.discard and not context.blueprint then
			if FG.FUNCS.get_card_info(context.other_card).rank == "Jack" then
				card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_i
				FG.FUNCS.card_eval_status_text{
					card = card,
					message = "+X"..card.ability.extra.xmult_i.." Mult",
					mode = "literal",
					colour = "mult"
				}
			end
		end
		if context.joker_main then return {xmult = card.ability.extra.xmult} end
    end
}

-- Invisible

FG.cards.invisible = {
	elegible_jokers = {},
	selected = {}
}

SMODS.Joker{
	key = "invisible",
	yes_pool_flag = 'alternate_spawn',
	in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end,
	atlas = "jokers_alt",
	pos = { x = 1, y = 7},
	rarity = 3,
	eternal_compat = false,
	loc_vars = function (self, info_queue, card)
		info_queue[#info_queue+1] = G.P_CENTERS.j_fg_invisible_memory
	end,
	calculate = function (self, card, context)
		if context.selling_self then
			FG.cards.invisible.elegible_jokers = {}
			for i,joker in ipairs(G.jokers.cards) do
				if not (joker.config.center.key == "j_fg_invisible_memory" or joker.config.center.key == "j_fg_invisible" or joker.ability.eternal) then
					table.insert(FG.cards.invisible.elegible_jokers,joker)
				end
			end
			if not FG.cards.invisible.elegible_jokers[1] then return {message = "Nope!"} end
			local selected = FG.cards.invisible.elegible_jokers[pseudorandom('mila',1,#FG.cards.invisible.elegible_jokers)]
			FG.cards.invisible.selected = selected
			SMODS.add_card{
				key = "j_fg_invisible_memory",
			}
			selected:start_dissolve()
		end
	end
}

SMODS.Joker{
	key = "invisible_memory",
	atlas = "jokers_alt",
	rarity = 3,
	no_collection = true,
	yes_pool_flag = "mila",
	pos = { x = 1, y = 7},
	config = {
		extra = {
			rounds = 6,
			copies = 2,
			name = "nil"
		}
	},
	loc_vars = function (self, info_queue, card)
		card.ability.extra.name = localize("k_fg_none")
		if card.ability.saved_ability then card.ability.extra.name = localize{type = "name_text",set = card.ability.saved_ability.set, key = card.ability.saved_key} end
		return {
			vars = {
				card.ability.extra.rounds,
				card.ability.extra.copies,
				card.ability.extra.name
			}
		}
	end,
	add_to_deck = function (self, card, from_debuff)
		if not card.ability then card.ability = {} end
		card.ability.saved_ability = FG.cards.invisible.selected.ability
		card.ability.saved_key = FG.cards.invisible.selected.config.center.key
		--FG.cards.invisible.elegible_jokers = {}
		--FG.cards.invisible.selected = {}
	end,
	calculate = function (self, card, context)
		if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
			if card.ability.extra.rounds == 1 then
				for i=1, card.ability.extra.copies do
					local c = SMODS.add_card { key = card.ability.saved_key, edition = "e_negative" }
					c.ability = card.ability.saved_ability
				end
				card:start_dissolve()
				return {
					message = localize("k_fg_active")
				}
			end
			card.ability.extra.rounds = card.ability.extra.rounds - 1
			return {
				message = card.ability.extra.rounds .. " left!"
			}
		end
	end
}
-- Bootstraps
SMODS.Joker{
    key = "bootstraps",
    atlas = "jokers_alt",
    pos = { x = 9, y = 8},
    rarity = 1,
    cost = 5,
      yes_pool_flag = 'alternate_spawn',
    in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end, -- Custom logic for spawning
    config = {
        fg_alternate = {}, -- Kept between alternations
        extra = {
			mult = 0,
			mult_i = 6,
			cost = 3,
		}
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
				card.ability.extra.mult,
				card.ability.extra.mult_i,
				card.ability.extra.cost
			}
        }
    end,
    blueprint_compat = true,
    calculate = function (self, card, context)
		if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
			FG.FUNCS.card_eval_status_text{
				card = card,
				message = "+"..card.ability.extra.mult_i.." Mult",
				mode = "literal",
				colour = "mult"
			}
			card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_i
			
			FG.FUNCS.card_eval_status_text{
				card = card,
				message = "-$"..card.ability.extra.cost,
				mode = "literal",
				colour = "red"
			}
			ease_dollars(-card.ability.extra.cost)
		end
		if context.joker_main then return {mult = card.ability.extra.mult} end
    end
}

-- Legendaries
-- Joker
SMODS.Joker{
    key = "caino",
    atlas = "jokers_alt",
    pos = { x = 3, y = 8},
	soul_pos = { x = 3, y = 9},
    rarity = 4,
    cost = 20,
    yes_pool_flag = 'alternate_spawn',
    in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end, -- Custom logic for spawning
    config = {
        fg_alternate = {}, -- Kept between alternations
        extra = {}
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {}
        }
    end,
    blueprint_compat = true,
    calculate = function (self, card, context)
    end
}
-- Joker
SMODS.Joker{
    key = "triboulet",
    atlas = "jokers_alt",
    pos = { x = 4, y = 8},
	soul_pos = { x = 4, y = 9},
    rarity = 4,
    cost = 20,
    yes_pool_flag = 'alternate_spawn',
    in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end, -- Custom logic for spawning
    config = {
        fg_alternate = {}, -- Kept between alternations
        extra = {}
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {}
        }
    end,
    blueprint_compat = true,
    calculate = function (self, card, context)
    end
}
-- Joker
SMODS.Joker{
    key = "yorick",
    atlas = "jokers_alt",
    pos = { x = 5, y = 8},
	soul_pos = { x = 5, y = 9},
    rarity = 4,
    cost = 20,
    yes_pool_flag = 'alternate_spawn',
    in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end, -- Custom logic for spawning
    config = {
        fg_alternate = {}, -- Kept between alternations
        extra = {}
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {}
        }
    end,
    blueprint_compat = true,
    calculate = function (self, card, context)
    end
}
-- Joker
SMODS.Joker{
    key = "chicot",
    atlas = "jokers_alt",
    pos = { x = 6, y = 8},
	soul_pos = { x = 6, y = 9},
    rarity = 4,
    cost = 20,
    yes_pool_flag = 'alternate_spawn',
    in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end, -- Custom logic for spawning
    config = {
        fg_alternate = {}, -- Kept between alternations
        extra = {}
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {}
        }
    end,
    blueprint_compat = true,
    calculate = function (self, card, context)
    end
}
-- Joker
SMODS.Joker{
    key = "perkeo",
    atlas = "jokers_alt",
    pos = { x = 7, y = 8},
	soul_pos = { x = 7, y = 9},
    rarity = 4,
    cost = 20,
    yes_pool_flag = 'alternate_spawn',
    in_pool = function (self, args) local ret = FG.FUNCS.allow_duplicate(self) return ret end, -- Custom logic for spawning
    config = {
        fg_alternate = {}, -- Kept between alternations
        extra = {}
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {}
        }
    end,
    blueprint_compat = true,
    calculate = function (self, card, context)
    end
}
-----------------
---Collectives---
-----------------
--if FG.config.debug_mode then
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
		cost = 16,
		calculate = function(self, card, context)
			if context.individual and context.cardarea == G.play then
				return {
					Xmult = card.ability.extra.Xmult
				}
			end
		end
	}
	-- Jogla (I was told he was op, but I decided to not change it lol)
	SMODS.Joker {
		key = 'jogla',
		config = { extra = { duplicate = 2, name = "None"} },
		loc_vars = function(self, info_queue, card)
			info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}}
			if G.consumeables then
				if G.consumeables.cards[1] then
					card.ability.extra.name = G.consumeables.cards[1].config.center.name
					info_queue[#info_queue+1] = G.consumeables.cards[1].config.center
					card.ability.extra.name = localize{type = "name_text", set = G.consumeables.cards[1].ability.set, key = G.consumeables.cards[1].config.center.key}
				else
					card.ability.extra.name = "None"
				end
			end
			return {
				vars = {
					card.ability.extra.duplicate,
					card.ability.extra.name
				}
			}
		end,
		rarity = "fg_collective",
		atlas = 'collective',
		pos = { x = 2, y = 0 },
		soul_pos = { x = 2, y = 1 },
		cost = 5,
		blueprint_compat = true,
		calculate = function(self, card, context)
			if context.ending_shop and G.consumeables.cards[1] then
				local target_card_key = G.consumeables.cards[1].config.center.key
				if target_card_key ~= nil then
					FG.FUNCS.card_eval_status_text{
						card = card,
						message = "k_duplicated_ex",
						mode = "localize",
						category = "dictionary"
					}
					for i=1, card.ability.extra.duplicate do
						local new_card = SMODS.add_card{
							key = target_card_key,
							edition = "e_negative"
						}
					end
				end
				--card_eval_status_text(card, 'extra', nil, nil, nil, { message = "Upgrade!" })
			end
		end
	}
	SMODS.Joker {
		key = 'jogla_alt',
		config = { extra = { increase = 1, extra_size = 2} },
		loc_vars = function(self, info_queue, card)
			return {
				vars = {
					card.ability.extra.increase,
					card.ability.extra.extra_size
				}
			}
		end,
		rarity = "fg_collective", 
		atlas = 'collective',
		pos = { x = 2, y = 0 },
		soul_pos = { x = 2, y = 1 },
		cost = 5,
		blueprint_compat = false,
		add_to_deck = function (self, card, from_debuff)
			G.hand:change_size(card.ability.extra.extra_size)
		end,
		remove_from_deck = function (self, card, from_debuff)
			G.hand:change_size(-card.ability.extra.extra_size)
		end,
		calculate = function(self, card, context)
			if context.setting_blind and not context.blueprint then
				card_eval_status_text(card, 'extra', nil, nil, nil, { message = "+"..card.ability.extra.extra_size.." hand size!" })
			end
			if context.end_of_round and not context.blueprint and G.GAME.blind.boss and not context.repetition and not context.individual then
				card.ability.extra.extra_size = card.ability.extra.extra_size + card.ability.extra.increase
				G.hand:change_size(card.ability.extra.increase)
				card_eval_status_text(card, 'extra', nil, nil, nil, { message = "Upgrade!" })
			end
		end
	}
	-- Jenku
	-- shes fucking op i will probably nerf her but its 4am
	SMODS.Joker {
		key = 'jenker',
		config = { extra = { repetitions = 1, increase = false } },
		loc_vars = function(self, info_queue, card)
			return {
				vars = {
					card.ability.extra.repetitions
				}
			}
		end,
		rarity = "fg_collective",
		atlas = 'collective',
		pos = { x = 1, y = 0 },
		soul_pos = { x = 1, y = 1 },
		cost = 5,
		calculate = function(self, card, context)
			if card.ability.extra.repetitions == 0 then
				card.ability.extra.repetitions = 1
			end
			if context.end_of_round and not context.repetition and not context.individual and G.GAME.blind.boss then
				card.ability.extra.repetitions = card.ability.extra.repetitions + 1
			end
			if context.retrigger_joker_check and not context.retrigger_joker and card ~= self then
				return { 
					repetitions = card.ability.extra.repetitions
				 } 
			   end
		end
	}
SMODS.Joker {
	key = 'goldenleaf',
	config = { extra = { Xmult = 3 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult } }
	end,
	rarity = 'fg_collective',
	atlas = 'collective',
	pos = { x = 0, y = 0 },
	soul_pos = { x = 0, y = 1 },
	cost = 5,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if FG.FUNCS.get_card_info(context.other_card).key == "m_gold" or FG.FUNCS.get_card_info(context.other_card).key == "m_fg_gold" then
				return{
					xmult = card.ability.extra.Xmult
				}
			end
		end
	end
}
	-- goldenleaf alt
	SMODS.Joker {
		key = 'goldenleafalt',
		config = { extra = { increase = 1, extra_size = 0} },
		loc_vars = function(self, info_queue, card)
			return {
				vars = {
					card.ability.extra.increase,
					card.ability.extra.extra_size
				}
			}
		end,
		rarity = "fg_collective", 
		atlas = 'collective',
		pos = { x = 0, y = 0 },
		soul_pos = { x = 0, y = 1 },
		cost = 5,
		blueprint_compat = false,
		calculate = function(self, card, context)
			if context.end_of_round and not context.blueprint and G.GAME.blind.boss and not context.repetition and not context.individual then
				card.ability.extra.extra_size = card.ability.extra.extra_size + card.ability.extra.increase
				G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.increase
				ease_hands_played(card.ability.extra.increase)
				card_eval_status_text(card, 'extra', nil, nil, nil, { message = "+"..card.ability.extra.extra_size.." hand(s)!" })
			end
		end
	}
	-- Jenku alt
	SMODS.Joker {
		key = 'jenkeralt',
		config = { extra = { retriggers = "jenku", repetitionsmax = 5, repetitionsmin=1 } },
		rarity = "fg_collective",
		atlas = 'collective',
		loc_txt = {
			name = "#1#",
			text = {""}
		},
		pos = { x = 1, y = 0 },
		soul_pos = { x = 1, y = 1 },
		cost = 5,
		loc_vars = function(self, info_queue, card)
			return {
				main_end = {
					{n=G.UIT.R, config= {align="bm", padding = 0.02}, nodes={
						{n=G.UIT.C, config={align = "m", colour=colour, r=0.05, padding=0.05}, nodes={
							{n=G.UIT.T, config={text = "Retriggers every", colour = G.C.UI.TEXT_DARK, scale=0.3}},
							{
								n = G.UIT.O,
								config = {
									object = DynaText({
										string = { "scORed Card", "scp]o}{d }ca", "Cscored ()'", "560$30 6470", "sd[]{;l''l;} a;'", "834934-230", "s{;} @:[ored]"},
										colours = { G.C.RED },
										pop_in_rate = 9999999,
										silent = true,
										random_element = true,
										pop_delay = 0.30,
										scale = 0.32,
										min_cycle_time = 0,
									}),
								},
							},
						}}
					}},
					{n=G.UIT.R, config= {align="bm", padding = 0.02}, nodes={
						{n=G.UIT.C, config={align = "m", colour=colour, r=0.05, padding=0.05}, nodes={
							{
								n = G.UIT.O,
								config = {
									object = DynaText({
										string = { "-1", "0", "1", "2", "3", "4", "5"},
										colours = { G.C.IMPORTANT },
										pop_in_rate = 9999999,
										silent = true,
										random_element = true,
										pop_delay = 0.30,
										scale = 0.32,
										min_cycle_time = 0,
									}),
								},
							},
							{n=G.UIT.T, config={text = "times.", colour = G.C.UI.TEXT_DARK, scale=0.3}},
							{n=G.UIT.T, config={text = "1/4", colour = G.C.IMPORTANT, scale=0.3}},
							{n=G.UIT.T, config={text = "chance to", colour = G.C.UI.TEXT_DARK, scale=0.3}},
							{n=G.UIT.T, config={text = "debuff", colour = G.C.UI.TEXT_DARK, scale=0.3}},
						}}
					}},
					{n=G.UIT.R, config= {align="bm", padding = 0.02}, nodes={
						{n=G.UIT.C, config={align = "m", colour=colour, r=0.05, padding=0.05}, nodes={
							{n=G.UIT.T, config={text = "every card in", colour = G.C.UI.TEXT_DARK, scale=0.3}},
							{
								n = G.UIT.O,
								config = {
									object = DynaText({
										string = { "scoring hand", "scp]as}ga }ha", "8Coirgng ad()'", "56$30 6470", "s[]{;l''l;} a;'", "834934-230", "s{;} @:[ored]"},
										colours = { G.C.RED },
										pop_in_rate = 9999999,
										silent = true,
										random_element = true,
										pop_delay = 0.30,
										scale = 0.32,
										min_cycle_time = 0,
									}),
								},
							},
						}}
					}},
					{n=G.UIT.R, config= {align="bm", padding = 0.02}, nodes={
						{n=G.UIT.C, config={align = "m", colour=colour, r=0.05, padding=0.05}, nodes={
							{n=G.UIT.T, config={text = "Uh, this one's kinda.. broken. You sure?", colour = G.C.UI.TEXT_INACTIVE, scale=0.25}},
						}}
					}},
				},
				vars = {card.ability.extra.name,card.ability.extra.repetitionsmin,card.ability.extra.repetitionsmax}
			}
		end,
		calculate = function(self, card, context)
			if context.before then
				local retriggers = (pseudorandom('jenker', card.ability.extra.repetitionsmin, card.ability.extra.repetitionsmax))
				if retriggers == 5 then
						card.ability.extra.name = "janku"
						card.children.center:set_sprite_pos({x = 5, y = 0})
						card.children.floating_sprite:set_sprite_pos({x = 5, y = 1})
						card_eval_status_text(card, 'extra', nil, nil, nil, { message = "Nope!" })
				end
			end
			if context.scoring_hand then
				if retriggers == 5 then
					for i in ipairs(context.scoring_hand) do
						SMODS.debuff_card(context.scoring_hand[i], true, "jenkerdebuff")
					end
				end
			end
			if context.cardarea == G.play and context.repetition and not context.repetition_only then
				card.ability.extra.name = "jenku"
				card.children.center:set_sprite_pos({x = 1, y = 0})
				card.children.floating_sprite:set_sprite_pos({x = 1, y = 1})
				return{
					message = "And again!",
					repetitions = retriggers
				}
			end
			if context.end_of_round then
				for i in ipairs(G.playing_cards) do
				SMODS.debuff_card(G.playing_cards[i], false, "jenkerdebuff")
				end
			end
		end
	}
--end

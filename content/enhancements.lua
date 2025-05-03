FG.enhancement_equivalents = {
	c_base = "c_base",
	m_bonus = "m_fg_bonus",
	m_mult = "m_fg_mult",
	m_glass = "m_fg_glass",
	m_steel = "m_fg_steel",
	m_lucky = "m_fg_lucky",
	m_gold = "m_fg_gold"
}
FG.cards = {
	steel_mult = 1
}
SMODS.Atlas {
key = 'enhanced',
path = 'Enhancers.png',
px = 71,
py = 95
}

SMODS.Enhancement{
	key = "bonus",
	atlas = "enhanced",
	pos = { x = 1, y = 1 },
	config = {
		extra = {
			grant_min = 1,
			grant_max = 2,
			grant_amount = 60,
			remove_min = 1,
			remove_max = 4,
			remove_amount = -15
		}
	},
	loc_vars = function (self, info_queue, card)
		card.ability.bonus = 0
		return {
			vars = {
				card.ability.extra.grant_min,
				card.ability.extra.grant_max,
				card.ability.extra.grant_amount,
				card.ability.extra.remove_min,
				card.ability.extra.remove_max,
				card.ability.extra.remove_amount
			}
		}
	end,
	calculate = function (self, card, context)
		card.ability.bonus = 0
		if pseudorandom("mila",card.ability.extra.grant_min,card.ability.extra.grant_max) <= card.ability.extra.grant_min then
			card.ability.bonus = card.ability.mult + card.ability.extra.grant_amount
		end
		if pseudorandom("mila",card.ability.extra.remove_min,card.ability.extra.remove_max) <= card.ability.extra.remove_min then
			card.ability.bonus = card.ability.mult + card.ability.extra.remove_amount
		end
	end
}

SMODS.Enhancement{
	key = "mult",
	atlas = "enhanced",
	pos = { x = 2, y = 1 },
	config = {
		extra = {
			grant_min = 1,
			grant_max = 2,
			grant_amount = 8,
			remove_min = 1,
			remove_max = 4,
			remove_amount = -2
		}
	},
	loc_vars = function (self, info_queue, card)
		return {
			vars = {
				card.ability.extra.grant_min,
				card.ability.extra.grant_max,
				card.ability.extra.grant_amount,
				card.ability.extra.remove_min,
				card.ability.extra.remove_max,
				card.ability.extra.remove_amount
			}
		}
	end,
	calculate = function (self, card, context)
		card.ability.mult = 0
		if pseudorandom("mila",card.ability.extra.grant_min,card.ability.extra.grant_max) <= card.ability.extra.grant_min then
			card.ability.mult = card.ability.mult + card.ability.extra.grant_amount
		end
		if pseudorandom("mila",card.ability.extra.remove_min,card.ability.extra.remove_max) <= card.ability.extra.remove_min then
			card.ability.mult = card.ability.mult - card.ability.extra.remove_amount
		end
	end
}

SMODS.Enhancement{
	key = "glass",
	atlas = "enhanced",
	pos = { x = 5, y = 1 },
	config = {
		extra = {
			bonus = 0,
			divide = .4
			},
		},
	loc_vars = function(self,info_queue, card)
		if G.jokers then
			card.ability.extra.bonus = G.GAME.blind.chips * card.ability.extra.divide
		else
			card.ability.extra.bonus = 0
		end
		return {vars = {
			card.ability.extra.bonus,
			card.ability.extra.divide
	}}
	end,
	replace_base_card = true,
	no_rank = true,
	no_suit = true,
	always_scores = true,
	calculate = function(self,card,context)
		if G.jokers then
			card.ability.bonus = card.ability.extra.bonus
		end
		if context.after and context.cardarea == G.play then
			G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 0.1,
			func = function() 
				card:shatter()
				return true 
			end }))
		end
	end
}

--display is broken please fix

--[[
SMODS.Enhancement{
	key = "stone",
	loc_txt = {
		name = "Stone Card?",
		text = {
			"Copies the {C:attention}rank{} and {C:attention}suit{}",
			"of a {C:attention}random card held in hand{}",
			"{C:green}#1# in #2#{} chance to give said card an {C:attention}enhancement{}",
			"{C:green}#3# in #4#{} chance to give said card an {C:attention}edition{}"
		}
	},
	atlas = "enhanced",
	pos = { x = 5, y = 0 },
	config = {
		extra = {
			enhancement_chance = 1,
			enhancement_max = 4,
			edition_chance = 1,
			edition_max = 6
			},
		},
	loc_vars = function(self,info_queue, card)
		return {vars = {
			card.ability.extra.enhancement_chance,
			card.ability.extra.enhancement_max,
			card.ability.extra.edition_chance,
			card.ability.extra.edition_max
	}}
	end,
	replace_base_card = false,
	calculate = function (self, card, context)
		if context.before and context.cardarea == G.play then
			FG.test.hand = G.hand.cards
			FG.test.card_pre = card
			-- select random card
			local n_cards = #G.hand.cards
			local choosen_card = pseudorandom("mila",1,n_cards)
			-- Change card's rank and suit
			local rank = G.hand.cards[choosen_card].config.card.value
			local suit = G.hand.cards[choosen_card].config.card.suit
			SMODS.change_base(card,suit,rank,"For some fucking reason the card didn't fully convert.")
			FG.test.card_post = card
			-- set target card's edition and enhancements
			local enhance_max = card.ability.extra.enhancement_max
			local edition_max = card.ability.extra.edition_max
			local enhance_chance = card.ability.extra.enhancement_chance
			local edition_chance = card.ability.extra.edition_chance
			local enhance_give = pseudorandom("mila",1,enhance_max)
			local edition_give = pseudorandom("mila",1,edition_max)
			--if enhance_give >= enhance_chance then SMODS.poll_enhancement{guaranteed = true} end
			--if edition_give >= edition_chance then choosen_card:poll_edition(nil,nil,true,true) end
		end
	end
}

]]

SMODS.Enhancement{
	key = "steel",
	atlas = "enhanced",
	pos = { x = 6, y = 1},
	config = {
		extra = {
			card_gain = 0.05, -- How much Xmult is gained per steel card.
			card_mult = 1 -- How much Xmult all steel cards give.
		}
	},
	loc_vars = function (self, info_queue, card)
		if G.jokers then
			FG.cards.steel_mult = 1
			card.ability.extra.card_mult = FG.cards.steel_mult
			--local i = 1
			for _,v in ipairs(G.deck.cards) do
				local enhancements = SMODS.get_enhancements(v)
				if enhancements.m_fg_steel then 
					FG.cards.steel_mult = FG.cards.steel_mult + card.ability.extra.card_gain
					--print("Fuck yeah!")
				end
				--print(SMODS.get_enhancements(v))
				--print(i)
				--i = i + 1
				--print(FG.cards.steel_mult)
			end
		end
		card.ability.extra.card_mult = FG.cards.steel_mult
		return {
			vars = {
				card.ability.extra.card_gain,
				card.ability.extra.card_mult
			}
		}
	end,
	calculate = function (self, card, context)
		card.ability.h_x_mult = FG.cards.steel_mult
	end
}

SMODS.Enhancement{
	key = "gold",
	atlas = "enhanced",
	pos = { x = 6, y = 0},
	config = {
		extra = {
			dollars = 0
		}
	},
	loc_vars = function (self, info_queue, card)
		if G.hand then
			card.ability.extra.dollars = math.ceil(#G.hand.cards/2)
		end
		return {
			vars = {
				card.ability.extra.dollars
			}
		}
	end,
	calculate = function (self, card, context)
		card.ability.h_dollars = card.ability.extra.dollars
	end
}

SMODS.Enhancement{
	key = "lucky",
	atlas = "enhanced",
	pos = {x = 4, y = 1},
	config = {
		extra = {
			chips_min = 1,
			chips_max = 3,
			chips = 30,
			money_min = 1,
			money_max = 30,
			money = 50
		}
	},
	loc_vars = function (self, info_queue, card)
		return { vars = {
			card.ability.extra.chips_min,
			card.ability.extra.chips_max,
			card.ability.extra.chips,
			card.ability.extra.money_min,
			card.ability.extra.money_max,
			card.ability.extra.money
		}}
	end,
	calculate = function (self, card, context)
		card.ability.bonus = 0
		if pseudorandom("mila",card.ability.extra.chips_min,card.ability.extra.chips_max) <= card.ability.extra.chips_min then
			card.ability.bonus = card.ability.extra.chips
		end
		local test_var = pseudorandom("mila",card.ability.extra.money_min,card.ability.extra.money_max)
		print(test_var)
		if test_var <= card.ability.extra.chips_min then
			card.ability.p_dollars = card.ability.extra.money
		else
			card.ability.p_dollars = 0
		end
	end
}

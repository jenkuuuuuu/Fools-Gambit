FG.enhancement_equivalents = {
	m_glass = "m_fg_glass",
}
SMODS.Atlas {
key = 'enhanced',
path = 'Enhancers.png',
px = 71,
py = 95
}
--[[
if FG.config.debug_mode then
SMODS.Enhancement{
	key = "glass",
	loc_txt = {
	name = "Glass Card?",
	text = {
           "Gives {C:attention}x#2#{} blind's chip requirements.",
		   "destroys after use",
           "no rank or suit",
		   }
	},
	atlas = "enhanced",
	pos = { x = 5, y = 1 },
	config = {
	    bonus = 0,
		extra = {
			divide = .4
			},
		},
	loc_vars = function(self,info_queue, card)
		if G.jokers then
			card.ability.bonus = G.GAME.blind.chips * card.ability.extra.divide
		else
			card.ability.bonus = 0
		end
		return {vars = {
			card.ability.bonus,
			card.ability.extra.divide
	}}
	end,
	replace_base_card = true,
	no_rank = true,
	no_suit = true,
	always_scores = true,
	calculate = function(self,card,context)
		if G.jokers then
			card.ability.bonus = G.GAME.blind.chips * card.ability.extra.divide
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
end
]]
--display is broken please fix

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


FG.enhancement_equivalents = {
	["m_glass"] = "m_fg_glass",
}

SMODS.Atlas {
key = 'enhanced',
path = 'Enhancers.png',
px = 71,
py = 95
}

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
--display is broken please fix
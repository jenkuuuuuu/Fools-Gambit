edition_equivalents = {
	["e_polychrome"] = "e_fg_polychrome",
	["e_negative"] = "e_fg_negative",
	["e_holographic"] = "e_fg_holographic",
	["e_foil"] = "e_fg_foil"
} -- use for alternating later

--
-- POLISHED
--

function polishChips()
	if hand_chips then
		hand_chips = hand_chips*1.5
		return 
	else
		return 0
	end
end

SMODS.Shader {
    key = 'polished',
    path = 'polished.fs'
}

SMODS.Edition({
    key = "polished",
    loc_txt = {
        name = "Polished",
        label = "polished",
        text = {
            "{X:chips,C:white}x1.5{} Chips"
        }
    },

    shader = "polished",
    discovered = true,
    unlocked = true,
    config = { chips = 200, mult = 10, x_mult = 2 },
    in_shop = true,
    weight = 8,
    extra_cost = 6,
    apply_to_float = true,
	calculate = function(self, card, context)
		if context.joker_main or context.cardarea == G.play and context.individual then
			update_hand_text({delay = 0}, {chips = hand_chips*1.5})
			polishChips()
            if context.joker_main then
                card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'Multiplied!' })
            else
                return{message = 'Multiplied!' }
            end
		end
	end,
    loc_vars = function(self)
        return { vars = { self.config.chips, self.config.mult, self.config.x_mult } }
    end
})


SMODS.Shader {
    key = 'negative',
    path = 'negative.fs'
}

SMODS.Edition({
    key = "negative",
    loc_txt = {
        name = "Negative",
        label = "Negative",
        text = {
            "{C:edition}+1{} Consumeable Slot",
            "{C:edition}+1{} Hand Size"
        }
    },
    -- this needs to be made to have different effects depending on whether its on a card or a consumeable
    shader = "negative",
    discovered = true,
    unlocked = true,
    config = { chips = 200, mult = 10, x_mult = 2 },
    in_shop = true,
    weight = 8,
    extra_cost = 6,
    apply_to_float = true,
    on_apply = function(card)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit+1
        G.hand.config.card_limit = G.hand.config.card_limit+1
    end,
    
    on_load = function(card)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit+1
        G.hand.config.card_limit = G.hand.config.card_limit+1
    end,
    on_remove = function(card)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit-1
        G.hand.config.card_limit = G.hand.config.card_limit-1
    end
})

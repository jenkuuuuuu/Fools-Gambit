FG.edition_equivalents = {
    meta = {},
	e_polychrome = "e_fg_polychrome",
	e_negative = "e_fg_negative",
	e_holographic = "e_fg_holographic",
	e_foil = "e_fg_foil"
} -- use for alternating later

--
-- POLISHED
--


SMODS.Shader {
    key = 'polished',
    path = 'polished.fs'
}
if FG.config.debug_mode then
SMODS.Edition({
    key = "polished",
    loc_txt = {
        name = "Polished",
        label = "Polished",
        text = {
            "{X:chips,C:white}x#1#{} Chips"
        }
    },

    shader = "polished",
    discovered = true,
    unlocked = true,
    config = { extra = { xchips = 1.5 } },
    in_shop = true,
    weight = 8,
    extra_cost = 6,
    apply_to_float = true,
	calculate = function(self, card, context)
		if context.final_scoring_step then
			update_hand_text({delay = 0}, {chips = hand_chips * self.config.extra.xchips})
            card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'Multiplied!' })
			if hand_chips then
			hand_chips = hand_chips * self.config.extra.xchips
			return
			else
			return 0
			end
            end
		end,
    loc_vars = function(self)
        return { vars = { self.config.extra.xchips } }
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
    config = { extra = { slots = 1 } },
    in_shop = true,
    weight = 8,
    extra_cost = 6,
    apply_to_float = true,
	loc_vars = function(self)
        return { vars = { self.config.extra.slots } }
    end,
    on_apply = function(self)
        if self.added_to_deck then
        G.consumeables.config.card_limit = G.consumeables.config.card_limit+1
        G.hand.config.card_limit = G.hand.config.card_limit+1
        end
	end,
	on_remove = function(self)
	    if self.remove_from_deck then
	  G.consumeables.config.card_limit = G.consumeables.config.card_limit-1
      G.hand.config.card_limit = G.hand.config.card_limit-1
	  end
	 end,
	 calculate = function(self, card, context)
	 if context.selling_self then
	 G.consumeables.config.card_limit = G.consumeables.config.card_limit-1
      G.hand.config.card_limit = G.hand.config.card_limit-1
	  end
	  end
})
end
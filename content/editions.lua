
--
-- POLISHED
--

function polishChips()
	sendInfoMessage("called polish chips yippe", "MyInfoLogger")
	if hand_chips then
		sendInfoMessage("hand_chips exists", "MyInfoLogger")
		hand_chips = hand_chips*1.5
		return 
	else
		sendInfoMessage("this vexes me", "MyInfoLogger")
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
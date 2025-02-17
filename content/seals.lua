
SMODS.Atlas {
    key = "seal_atlas",
    path = "seals.png",
    px = 71,
    py = 95
}

SMODS.Seal {
    name = "Tune",
    key = "Tune",
    badge_colour = HEX("1d4fd7"),
	config = { mult = 5, chips = 20, money = 1, x_mult = 1.5  },
    loc_txt = {
        label = 'Tune',
        name = 'Tune',
        text = {
            'Creates an {C:purple}Abberation{} Card',
            'when played but {C:attention}not{} scored'
        }
    },
    atlas = "seal_atlas",
    pos = {x=0, y=0},

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return create_card("abberation", G.consumeables, nil, nil, false, true, nil)
        end
        -- does not work, i cant get it to calculate without being scored
    end
}
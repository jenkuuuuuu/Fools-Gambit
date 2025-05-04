
SMODS.Atlas {
    key = "seal_atlas",
    path = "seals.png",
    px = 71,
    py = 95
}

SMODS.Seal{
    key = "red",
    atlas = "enhanced",
    pos = {x = 5, y = 4},
    loc_vars = {
        label = "Red?",
        name = "Red?",
        text = {
            "Retrigger this card {C:attention}1{} additional times",
            "Decreases by {C:attention}1{} when scored",
            "{C:inactive}(Removes seal when reaches zero)"
        }
    }
}

--[[
SMODS.Seal {
    name = "Tune",
    key = "Tune",
    badge_colour = HEX("1d4fd7"),
	config = { mult = 5, chips = 20, money = 1, x_mult = 1.5  },
    loc_txt = {
        label = 'Tune',
        name = 'Tune',
        text = {
            'Creates an {C:purple}aberration{} Card',
            'when played but {C:attention}not{} scored'
        }
    },
    atlas = "seal_atlas",
    pos = {x=0, y=0},

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return create_card("aberration", G.consumeables, nil, nil, false, true, nil)
        end
        -- does not work, i cant get it to calculate without being scored
    end
}
]]
SMODS.Stake{
    key = "pink",
    applied_stakes = {
        "stake_black"
    },
    above_stake = "stake_blue",
    loc_txt = {
        name = "Pink stake",
        text = {
            "Shop can have {C:attention}unchangeable{} jokers",
            "{C:inactive,s:0.8}(Can't be alternated)",
        }
    },
    modifiers = function ()
        
    end
}

SMODS.Atlas{
    key = "stickers",
    path = "stickers.png",
    px = 71,
    py = 95
}

SMODS.Sticker{
    key = "unchangeable",
    atlas = "stickers",
    pos = { x = 0, y = 0},
    badge_colour = HEX("e083b0"),
    sets = {Joker = true},
    rate = 10000
}
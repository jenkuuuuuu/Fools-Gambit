SMODS.Stake{
    key = "pink",
    applied_stakes = {
        "black"
    },
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
    default_compat = true,
    rate = 1,
    needs_enabled_flag = false
}

SMODS.Language{
    key = "sn_bos",
    label = "Sendien",
    font = {
        file = "SendienConlang.ttf",
        render_scale = G.TILESIZE*7.5,
        TEXT_HEIGHT_SCALE = 1,
        TEXT_OFFSET = {x=0,y=0},
        FONTSCALE = 0.08,
        squish = 1,
        DESCSCALE = 1
    },
    loc_key = "en_us"
}
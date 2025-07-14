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



--- 
--- Sound replacer
--- 
if FG.config.alternate_sfx then
    FG.sounds = {
        "ambientFire1",
        "ambientFire2",
        "ambientFire3",
        "ambientOrgan1",
        "button",
        "cancel",
        "card1",
        "card3",
        "cardFan2",
        "cardSlide1",
        "cardSlide2",
        "chips1",
        "chips2",
        "coin1",
        "coin2",
        "coin3",
        "coin4",
        "coin5",
        "coin6",
        "coin7",
        "crumple1",
        "crumple2",
        "crumple3",
        "crumple4",
        "crumple5",
        "crumpleLong1",
        "crumpleLong2",
        "explosion_buildup1",
        "explosion_release1",
        "explosion1",
        "foil1",
        "foil2",
        "generic1",
        "glass1",
        "glass2",
        "glass3",
        "glass4",
        "glass5",
        "glass6",
        "gold_seal",
        "gong",
        "highlight1",
        "highlight2",
        "holo1",
        "introPad1",
        "magic_crumple",
        "magic_crumple2",
        "magic_crumple3",
        "multhit1",
        "multhit2",
        "negative",
        "other1",
        "paper1",
        "polychrome1",
        "slice1",
        "splash_buildup",
        "tarot1",
        "tarot2",
        "timpani",
        "voice1",
        "voice2",
        "voice3",
        "voice4",
        "voice5",
        "voice6",
        "voice7",
        "voice8",
        "voice9",
        "voice10",
        "voice11",
        "whoosh_long",
        "whoosh",
        "whoosh1",
        "whoosh2",
        "win"
    }
    for _,sound in ipairs(FG.sounds) do
        print(sound)
        SMODS.Sound{
            key = sound,
            path = sound..".ogg",
            replace = sound
        }
    end
end
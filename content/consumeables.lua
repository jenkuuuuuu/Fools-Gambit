SMODS.Atlas {
	key = "abberations",
	path = "abberationcards.png",
	px = 71,
	py = 95
}

joker_equivalents = {
	["j_fg_t1"] = "j_fg_t2",
	["flippedscript"] = "flippedscriptALT",
	["scriptflipped"] = "scriptflipped"
}


SMODS.ConsumableType{
    key = "abberation",
    primary_colour = G.C.RED,
    secondary_colour = G.C.PURPLE,
    loc_txt ={
        name = "Abberation Cards",
        collection = "Abberation Cards",
        }
}

SMODS.Consumable{
    key = "tonal",
    set = "abberation",
    atlas = "abberations",
	pos = { x = 0, y = 0 },
    loc_txt ={
        name = "Tonal",
        text = {
            "Converts {C:attention}3{} selected Jokers",
            "to their {C:red}Original{} form"
        }
    },

    can_use = function(self, card)
        if G.STATE ~= G.STATES.HAND_PLAYED and G.STATE ~= G.STATES.DRAW_TO_HAND and G.STATE ~= G.STATES.PLAY_TAROT or
            any_state then
            if #G.jokers.highlighted == 1 and is_alternate(G.jokers.highlighted[1].config.center_key,joker_equivalents) == "v" then
                return true
            end
        end
    end,
    use = function(card, area, copier)
        local used_tarot = (copier or card)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                    alternate_card(G.jokers.highlighted[1].config.center_key,joker_equivalents)
                    G.jokers.highlighted[1]:start_dissolve(nil,false,0,true)
                return true
            end
        }))
    end
}

SMODS.Consumable{
    key = "atonal",
    set = "abberation",
    atlas = "abberations",
	pos = { x = 1, y = 0 },
    loc_txt ={
        name = "Atonal",
        text = {
            "Converts {C:attention}3{} selected Jokers",
            "to their {C:purple}Alternate{} form"
        }
    },

    can_use = function(self, card)
        if G.STATE ~= G.STATES.HAND_PLAYED and G.STATE ~= G.STATES.DRAW_TO_HAND and G.STATE ~= G.STATES.PLAY_TAROT or
            any_state then
            if #G.jokers.highlighted == 1 and is_alternate(G.jokers.highlighted[1].config.center_key,joker_equivalents) == "k" then
                return true
            end
        end
    end,
    use = function(card, area, copier)
        local used_tarot = (copier or card)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                    alternate_card(G.jokers.highlighted[1].config.center_key,joker_equivalents)
                    G.jokers.highlighted[1]:start_dissolve(nil,false,0,true)
                return true
            end
        }))
    end
}

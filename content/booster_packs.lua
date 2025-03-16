SMODS.Atlas {
	key = "pack",
	path = "boosters.png",
	px = 71,
	py = 95
}


abberation1 = SMODS.Booster {
    key = "abberation1",
    kind = "abberation",
    atlas = "pack",
    loc_txt = { 
        name = 'Abberation Pack',
        group_name = 'abberation',
        text = { "Choose {C:attention}#1#{} of up to ",
        " {C:attention}#2#{} {C:purple}Abberation{} cards to",
        "be used instantly." }
        },
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 1 },
    draw_hand = true,
    cost = 4,
    order = 1,
    weight = 0.96,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, self.config.extra or card.config.center.config.extra } }
    end,
    create_card = function(self, card)
        return create_card("abberation", G.pack_cards, nil, nil, true, true, nil)
    end
}


abberation2 = SMODS.Booster {
    key = "abberation2",
    kind = "abberation",
    atlas = "pack",
    loc_txt = { 
            name = 'Abberation Pack',
            group_name = 'abberation',
            text = { "Choose {C:attention}#1#{} of up to ",
            " {C:attention}#2#{} {C:purple}Abberation{} cards to",
            "be used instantly." }
            },
    pos = { x = 1, y = 0 },
    config = { extra = 3, choose = 1 },
    draw_hand = true,
    cost = 4,
    order = 1,
    weight = 0.96,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, self.config.extra or card.config.center.config.extra } }
    end,
    create_card = function(self, card)
        return create_card("abberation", G.pack_cards, nil, nil, true, true, nil)
    end
}
if FG.config.debug_mode then
jumbo_abberation = SMODS.Booster {
    key = "abberation3",
    kind = "abberation",
    atlas = "pack",
    loc_txt = { 
            name = 'Jumbo Abberation Pack',
            group_name = 'abberation',
            text = { "Choose {C:attention}#1#{} of up to ",
            " {C:attention}#2#{} {C:purple}Abberation{} cards to",
            "be used instantly." }
            },
    pos = { x = 2, y = 0 },
    config = { extra = 5, choose = 1 },
    draw_hand = true,
    cost = 4,
    order = 1,
    weight = 0.96,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, self.config.extra or card.config.center.config.extra } }
    end,
    create_card = function(self, card)
        return create_card("abberation", G.pack_cards, nil, nil, true, true, nil)
    end
}

mega_abberation = SMODS.Booster {
    key = "abberation4",
    kind = "abberation",
    atlas = "pack",
    loc_txt = { 
            name = 'Mega Abberation Pack',
            group_name = 'abberation',
            text = { "Choose {C:attention}#1#{} of up to ",
            " {C:attention}#2#{} {C:purple}Abberation{} cards to",
            "be used instantly." }
            },
    pos = { x = 3, y = 0 },
    config = { extra = 5, choose = 2 },
    draw_hand = true,
    cost = 4,
    order = 1,
    weight = 0.96,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, self.config.extra or card.config.center.config.extra } }
    end,
    create_card = function(self, card)
        return create_card("abberation", G.pack_cards, nil, nil, true, true, nil)
    end
}
end
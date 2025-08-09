SMODS.Atlas {
	key = "pack",
	path = "boosters.png",
	px = 71,
	py = 95
}

FG.boosters = {}

FG.boosters.aberration1 = SMODS.Booster {
    key = "aberration1",
    kind = "aberration",
    atlas = "pack",
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
        return create_card("aberration", G.pack_cards, nil, nil, true, true, nil)
    end
}


FG.boosters.aberration2 = SMODS.Booster {
    key = "aberration2",
    kind = "aberration",
    atlas = "pack",
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
        return create_card("aberration", G.pack_cards, nil, nil, true, true, nil)
    end
}
if FG.config.debug_mode then
FG.boosters.jumbo_aberration = SMODS.Booster {
    key = "aberration3",
    kind = "aberration",
    atlas = "pack",
    loc_txt = { 
            name = 'Jumbo aberration Pack',
            group_name = 'aberration',
            text = { "Choose {C:attention}#1#{} of up to ",
            " {C:attention}#2#{} {C:purple}aberration{} cards to",
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
        return create_card("aberration", G.pack_cards, nil, nil, true, true, nil)
    end
}

FG.boosters.mega_aberration = SMODS.Booster {
    key = "aberration4",
    kind = "aberration",
    atlas = "pack",
    loc_txt = { 
            name = 'Mega aberration Pack',
            group_name = 'aberration',
            text = { "Choose {C:attention}#1#{} of up to ",
            " {C:attention}#2#{} {C:purple}aberration{} cards to",
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
        return create_card("aberration", G.pack_cards, nil, nil, true, true, nil)
    end
}
end
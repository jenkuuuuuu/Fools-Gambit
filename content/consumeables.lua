SMODS.Atlas {
	key = "abberations",
	path = "abberationcards.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "PLACEHOLDERS",
	path = "abberationcardsPLACEHOLDERS.png",
	px = 71,
	py = 95
} -- added placeholder sprites before the actual ones are finished just so they can be differentiated in packs



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
    atlas = "PLACEHOLDERS",
	pos = { x = 0, y = 0 },
    loc_txt ={
        name = "Tonal",
        text = {
            "Converts {C:attention}1{} selected Jokers", -- should be 3, change this to 3 leftmost later
            "to their {C:red}Original{} form",
            "{C:inactive}Placeholder Sprite{}"
        }
    },

    can_use = function(self, card)
        if G.STATE ~= G.STATES.HAND_PLAYED and G.STATE ~= G.STATES.DRAW_TO_HAND and G.STATE ~= G.STATES.PLAY_TAROT or
            any_state then
            if #G.jokers.highlighted == 1 and FG.is_alternate(G.jokers.highlighted[1].config.center_key,FG.joker_equivalents) == "v" then
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
                    FG.alternate_card(G.jokers.highlighted[1].config.center_key, G.jokers.highlighted[1], FG.joker_equivalents)
                return true
            end
        }))
    end
}

SMODS.Consumable{
    key = "atonal",
    set = "abberation",
    atlas = "PLACEHOLDERS",
	pos = { x = 1, y = 0 },
    loc_txt ={
        name = "Atonal",
        text = {
            "Converts {C:attention}1{} selected Jokers", -- should be 3, change this to 3 leftmost later
            "to their {C:purple}Alternate{} form",
            "{C:inactive}Placeholder Sprite{}"
        }
    },

    can_use = function(self, card)
        if G.STATE ~= G.STATES.HAND_PLAYED and G.STATE ~= G.STATES.DRAW_TO_HAND and G.STATE ~= G.STATES.PLAY_TAROT or
            any_state then
            if #G.jokers.highlighted == 1 and FG.is_alternate(G.jokers.highlighted[1].config.center_key,FG.joker_equivalents) == "k" then
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
                    FG.alternate_card(G.jokers.highlighted[1].config.center_key, G.jokers.highlighted[1], FG.joker_equivalents)
                return true
            end
        }))
    end
}

SMODS.Consumable{
    key = "accelerando",
    set = "abberation",
    atlas = "PLACEHOLDERS",
	pos = { x = 2, y = 0 },
    loc_txt ={
        name = "Accelerando",
        text = {
            "Changes {C:attention}3{} selected cards",
            "and turns their editions, seals and,",
            "enhancements to their {C:purple}Alternate{} form",
            "{C:inactive}Placeholder Sprite{}"
        }
    },

    can_use = function(self, card)
        if G.STATE ~= G.STATES.HAND_PLAYED and G.STATE ~= G.STATES.DRAW_TO_HAND and G.STATE ~= G.STATES.PLAY_TAROT or
            any_state then
            if #G.hand.highlighted <= 3 then
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
                    for i in ipairs(G.hand.highlighted) do
                        FG.flip_editions(G.hand.highlighted[i]) -- change to alternate editions when theyre implemented
                    end
                return true
            end
        }))
    end
}



SMODS.Consumable{
    key = "treble",
    set = "abberation",
    atlas = "abberations",
	pos = { x = 2, y = 0 },
    loc_txt ={
        name = "Treble",
        text = {
            "Turns all Common Jokers in hand",
            "into their {C:purple}Alternate{} form"
        }
    },
    can_use = function(self, card)
        for i in ipairs(G.jokers.cards) do
            currentJoker = G.jokers.cards[i]
            if currentJoker.rarity == 1 then
                FG.alternate_card(currentJoker)
            end
        end
    return true
    end,
    use = function(card, area, copier)
			G.E_MANAGER:add_event(Event({
				func = function()
					for i in ipairs(G.jokers.cards) do
						local currentCard = G.jokers.cards[i]
                        if is_alternate(currentCard.config.center_key, FG.joker_equivalents) == "k" and currentCard.config.center.rarity == 1 then
                            FG.alternate_card(currentCard.config.center_key, currentCard, FG.joker_equivalents)
                        end
					end
                    return true
				end
			}))
        return true
    end
}

SMODS.Consumable{
    key = "bass",
    set = "abberation",
    atlas = "abberations",
	pos = { x = 0, y = 0 },
    loc_txt ={
        name = "Bass",
        text = {
            "Turns all Uncommon Jokers in hand",
            "into their {C:purple}Alternate{} form"
        }
    },
    can_use = function(self, card)
        for i in ipairs(G.jokers.cards) do
            currentJoker = G.jokers.cards[i]
            if currentJoker.rarity == 1 then
                FG.alternate_card(currentJoker)
            end
        end
    return true
    end,
    use = function(card, area, copier)
			G.E_MANAGER:add_event(Event({
				func = function()
					for i in ipairs(G.jokers.cards) do
						local currentCard = G.jokers.cards[i]
                        if is_alternate(currentCard.config.center_key, FG.joker_equivalents) == "k" and currentCard.config.center.rarity == 2 then
                            FG.alternate_card(currentCard.config.center_key, currentCard, FG.joker_equivalents)
                        end
					end
                    return true
				end
			}))
        return true
    end
}

SMODS.Consumable{
    key = "alto",
    set = "abberation",
    atlas = "abberations",
	pos = { x = 1, y = 0 },
    loc_txt ={
        name = "Alto",
        text = {
            "Turns all Rare Jokers in hand",
            "into their {C:purple}Alternate{} form"
        }
    },
    can_use = function(self, card)
        for i in ipairs(G.jokers.cards) do
            currentJoker = G.jokers.cards[i]
            if currentJoker.rarity == 1 then
                FG.alternate_card(currentJoker)
            end
        end
    return true
    end,
    use = function(card, area, copier)
			G.E_MANAGER:add_event(Event({
				func = function()
					for i in ipairs(G.jokers.cards) do
						local currentCard = G.jokers.cards[i]
                        if is_alternate(currentCard.config.center_key, FG.joker_equivalents) == "k" and currentCard.config.center.rarity == 3 then
                            FG.alternate_card(currentCard.config.center_key, currentCard, FG.joker_equivalents)
                        end
					end
                    return true
				end
			}))
        return true
    end
}

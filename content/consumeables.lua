
-- All joker equivalents. Format is: original <> alternate
joker_equivalents = {
	["j_fg_t1"] = "j_fg_t2",
	["j_fg_flippedscript"] = "j_fg_flippedscriptALT",
	["j_joker"] = "j_fg_joker",
	["j_misprint"] = "j_fg_misprint",
	["j_banner"] = "j_fg_banner",
	["j_scary_face"] = "j_fg_face",
	["j_mystic_summit"] = "j_fg_summit",
	["j_ceremonial"] = "j_fg_dagger",
	["j_fibonacci"] = "j_fg_fibonacci",
	["j_8_ball"] = "j_fg_8ball",
	["j_abstract"] = "j_fg_abstract",
	["j_fg_deathmodereal"] = "j_fg_deathmoderealalt",
	["j_jolly"] = "j_fg_jolly",
	["j_zany"] = "j_fg_zany",
	["j_mad"] = "j_fg_mad",
	["j_crazy"] = "j_fg_crazy",
	["j_droll"] = "j_fg_droll",
	["j_sly"] = "j_fg_sly",
	["j_wily"] = "j_fg_wily",
	["j_clever"] = "j_fg_clever",
	["j_devious"] = "j_fg_devious",
	["j_crafty"] = "j_fg_crafty",
	["j_duo"] = "j_fg_duo",
	["j_trio"] = "j_fg_trio",
	["j_family"] = "j_fg_family",
	["j_order"] = "j_fg_order",
	["j_loyalty_card"] = "j_fg_loyalty",
	["j_greedy_joker"] = "j_fg_greedy",
	["j_lusty_joker"] = "j_fg_lusty",
	["j_wrathful_joker"] = "j_fg_wrathful",
	["j_gluttenous_joker"] = "j_fg_gluttenous",
	["j_egg"] = "j_fg_egg"
}

SMODS.Atlas {
	key = "abberations",
	path = "abberationcards.png",
	px = 71,
	py = 95
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
                    alternate_card(G.jokers.highlighted[1].config.center_key, G.jokers.highlighted[1], joker_equivalents)
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
                    alternate_card(G.jokers.highlighted[1].config.center_key, G.jokers.highlighted[1], joker_equivalents)
                return true
            end
        }))
    end
}

SMODS.Consumable{
    key = "accelerando",
    set = "abberation",
    atlas = "abberations",
	pos = { x = 1, y = 0 },
    loc_txt ={
        name = "Accelerando",
        text = {
            "Changes {C:attention}3{} selected cards",
            "and turns their editions, seals and,",
            "enhancements to their {C:purple}Alternate{} form"
        }
    },

    can_use = function(self, card)
        if G.STATE ~= G.STATES.HAND_PLAYED and G.STATE ~= G.STATES.DRAW_TO_HAND and G.STATE ~= G.STATES.PLAY_TAROT or
            any_state then
            if #G.hand.highlighted == 3 then
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
                        flip_editions(G.hand.highlighted[i])
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
                alternate_card(currentJoker)
            end
        end
    return true
    end,
    use = function(card, area, copier)
			G.E_MANAGER:add_event(Event({
				func = function()
					for i in ipairs(G.jokers.cards) do
						local currentCard = G.jokers.cards[i]
                        if is_alternate(currentCard.config.center_key, joker_equivalents) == "k" and currentCard.config.center.rarity == 1 then
                            alternate_card(currentCard.config.center_key, currentCard, joker_equivalents)
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
                alternate_card(currentJoker)
            end
        end
    return true
    end,
    use = function(card, area, copier)
			G.E_MANAGER:add_event(Event({
				func = function()
					for i in ipairs(G.jokers.cards) do
						local currentCard = G.jokers.cards[i]
                        if is_alternate(currentCard.config.center_key, joker_equivalents) == "k" and currentCard.config.center.rarity == 2 then
                            alternate_card(currentCard.config.center_key, currentCard, joker_equivalents)
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
                alternate_card(currentJoker)
            end
        end
    return true
    end,
    use = function(card, area, copier)
			G.E_MANAGER:add_event(Event({
				func = function()
					for i in ipairs(G.jokers.cards) do
						local currentCard = G.jokers.cards[i]
                        if is_alternate(currentCard.config.center_key, joker_equivalents) == "k" and currentCard.config.center.rarity == 3 then
                            alternate_card(currentCard.config.center_key, currentCard, joker_equivalents)
                        end
					end
                    return true
				end
			}))
        return true
    end
}

SMODS.Atlas {
	key = "aberrations",
	path = "aberrationcards.png",
	px = 71,
	py = 95
}

SMODS.ConsumableType{
    key = "aberration",
    primary_colour = G.C.RED,
    secondary_colour = G.C.PURPLE,
}

SMODS.Consumable{
    key = "tonal",
    set = "aberration",
    atlas = "aberrations",
	pos = { x = 7, y = 0 },
    config = {extra = {cards = 1}},
    loc_vars = function (self, info_queue, card)
        if not G.jokers then return {vars = {math.ceil(card.ability.extra.cards)}} end
        for i=1, math.min(math.ceil(card.ability.extra.cards),#G.jokers.cards) do
            if not card.fake_card and #G.jokers.cards >= 1
            and FG.FUNCS.is_alternate(FG.FUNCS.get_card_info(G.jokers.cards[i]).key,FG.ALTS.joker_equivalents)
            and not FG.FUNCS.get_card_info(G.jokers.cards[i]).unchangeable then
                info_queue[#info_queue+1] = G.P_CENTERS[FG.FUNCS.get_alternate(FG.FUNCS.get_card_info(G.jokers.cards[i]).key,FG.ALTS.joker_equivalents)]
            end
        end
        return {vars = {math.ceil(card.ability.extra.cards)}}
    end,
    can_use = function(self, card)
        if G.jokers and #G.jokers.cards >= 1 then
            if not card.ability then card.ability = {extra = { cards = 1}} end
            for i=1, math.min(math.ceil(card.ability.extra.cards or 1),#G.jokers.cards) do
                if FG.FUNCS.is_alternate(FG.FUNCS.get_card_info(G.jokers.cards[i]).key,FG.ALTS.joker_equivalents)
                and not FG.FUNCS.get_card_info(G.jokers.cards[i]).unchangeable then return true end
            end
        end
    end,
    use = function(card, area, copier)
        local used_tarot = (copier or card)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                if not card.ability then card.ability = {extra = { cards = 1}} end
                for i=1, math.min(math.ceil(card.ability.extra.cards or 1),#G.jokers.cards) do
                    if FG.FUNCS.is_alternate(FG.FUNCS.get_card_info(G.jokers.cards[i]).key,FG.ALTS.joker_equivalents)
                    and not FG.FUNCS.get_card_info(G.jokers.cards[i]).unchangeable then
                        local c = FG.FUNCS.alternate_card(G.jokers.cards[i],FG.ALTS.joker_equivalents)
                        FG.FUNCS.update_edition(c.original,c.alternate)
                        FG.FUNCS.update_alternate_values(c.original,c.alternate)
                    end
                end
                return true
            end
        }))
    end
}

SMODS.Consumable{
    key = "atonal",
    set = "aberration",
    atlas = "aberrations",
	pos = { x = 5, y = 0 },
    config = {extra = {cards = 1}},
    loc_vars = function (self, info_queue, card)
        if not G.jokers then return {vars = {math.ceil(card.ability.extra.cards)}} end
        for i=1, math.min(math.ceil(card.ability.extra.cards),#G.jokers.cards) do
            if not card.fake_card and #G.jokers.cards >= 1
            and not FG.FUNCS.is_alternate(FG.FUNCS.get_card_info(G.jokers.cards[i]).key,FG.ALTS.joker_equivalents)
            and not FG.FUNCS.get_card_info(G.jokers.cards[i]).unchangeable then
                info_queue[#info_queue+1] = G.P_CENTERS[FG.FUNCS.get_alternate(FG.FUNCS.get_card_info(G.jokers.cards[i]).key,FG.ALTS.joker_equivalents)]
            end
        end
        return {vars = {math.ceil(card.ability.extra.cards)}}
    end,
    can_use = function(self, card)
        if G.jokers and #G.jokers.cards >= 1 then
            if not card.ability then card.ability = {extra = { cards = 1}} end
            for i=1, math.min(math.ceil(card.ability.extra.cards or 1),#G.jokers.cards) do
                if not FG.FUNCS.is_alternate(FG.FUNCS.get_card_info(G.jokers.cards[i]).key,FG.ALTS.joker_equivalents)
                and not FG.FUNCS.get_card_info(G.jokers.cards[i]).unchangeable then return true end
            end
        end
    end,
    use = function(card, area, copier)
        local used_tarot = (copier or card)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                if not card.ability then card.ability = {extra = { cards = 1}} end
                for i=1, math.min(math.ceil(card.ability.extra.cards or 1),#G.jokers.cards) do
                    if not FG.FUNCS.is_alternate(FG.FUNCS.get_card_info(G.jokers.cards[i]).key,FG.ALTS.joker_equivalents)
                    and not FG.FUNCS.get_card_info(G.jokers.cards[i]).unchangeable then
                        local c = FG.FUNCS.alternate_card(G.jokers.cards[i],FG.ALTS.joker_equivalents)
                        FG.FUNCS.update_edition(c.original,c.alternate)
                        FG.FUNCS.update_alternate_values(c.original,c.alternate)
                    end
                end
                return true
            end
        }))
    end
}
if FG.config.debug_mode then
SMODS.Consumable{
    key = "accelerando",
    set = "aberration",
    atlas = "aberrations",
	pos = { x = 6, y = 0 },
    can_use = function(self, card)
        if #G.hand.highlighted > 0 and #G.hand.highlighted <= 3 then return true else return false end
    end,
    use = function(card, area, copier)
        local pitch = 0.9
        play_sound("tarot1")
        for k,v in pairs(G.hand.highlighted) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                            v:flip()
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                    for k,v in pairs(G.hand.highlighted) do
                        -- FG.FUNCS.flip_editions(G.hand.highlighted[i]) -- change to alternate editions when theyre implemented
                        FG.FUNCS.alternate_enhancement(v)
                        FG.FUNCS.alternate_edition(v)
                    end
                return true
            end
        }))
        for k,v in pairs(G.hand.highlighted) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                            v:flip()
                            play_sound("tarot2",pitch)
                            pitch = pitch + 0.2
                    return true
                end
            }))
        end
    end
}
end


SMODS.Consumable{
    key = "treble",
    set = "aberration",
    atlas = "aberrations",
	pos = { x = 2, y = 0 },
    can_use = function(self, card)
        for _,v in pairs(G.jokers.cards) do
            if v.config.center.rarity == 1 then return true end
        end
    end,
    use = function(card, area, copier)
        G.E_MANAGER:add_event(Event({
            func = function()
                for i in ipairs(G.jokers.cards) do
                    local currentCard = G.jokers.cards[i]
                    if not FG.FUNCS.is_alternate(currentCard.config.center_key, FG.ALTS.joker_equivalents) and currentCard.config.center.rarity == 1 then
                        local c = FG.FUNCS.alternate_card(currentCard,FG.ALTS.joker_equivalents)
                        FG.FUNCS.update_edition(c.original,c.alternate)
                        FG.FUNCS.update_alternate_values(c.original,c.alternate)
                    end
                end
                return true
            end
        }))
    end
}

SMODS.Consumable{
    key = "bass",
    set = "aberration",
    atlas = "aberrations",
	pos = { x = 0, y = 0 },
    can_use = function(self, card)
        for _,v in pairs(G.jokers.cards) do
            if v.config.center.rarity == 2 then return true end
        end
    end,
    use = function(card, area, copier)
        G.E_MANAGER:add_event(Event({
            func = function()
                for i in ipairs(G.jokers.cards) do
                    local currentCard = G.jokers.cards[i]
                    if not FG.FUNCS.is_alternate(currentCard.config.center_key, FG.ALTS.joker_equivalents) and currentCard.config.center.rarity == 2 then
                        local c = FG.FUNCS.alternate_card(currentCard,FG.ALTS.joker_equivalents)
                        FG.FUNCS.update_edition(c.original,c.alternate)
                        FG.FUNCS.update_alternate_values(c.original,c.alternate)
                    end
                end
                return true
            end
        }))
    end
}

SMODS.Consumable{
    key = "alto",
    set = "aberration",
    atlas = "aberrations",
	pos = { x = 1, y = 0 },
    can_use = function(self, card)
        for _,v in pairs(G.jokers.cards) do
            if v.config.center.rarity == 3 then return true end
        end
    end,
    use = function(card, area, copier)
        G.E_MANAGER:add_event(Event({
            func = function()
                for i in ipairs(G.jokers.cards) do
                    local currentCard = G.jokers.cards[i]
                    if not FG.FUNCS.is_alternate(currentCard.config.center_key, FG.ALTS.joker_equivalents) and currentCard.config.center.rarity == 3 then
                        local c = FG.FUNCS.alternate_card(currentCard,FG.ALTS.joker_equivalents)
                        FG.FUNCS.update_edition(c.original,c.alternate)
                        FG.FUNCS.update_alternate_values(c.original,c.alternate)
                    end
                end
                return true
            end
        }))
    end
}

SMODS.Consumable{
    key = "stake",
    set = "aberration",
    atlas = "aberrations",
	pos = { x = 4, y = 0 },
	 config = {
        extra = {
            cards = 2
			
        }
    },
    can_use = function(self, card)
        if #G.consumeables.cards < G.consumeables.config.card_limit then
            return true
        end
    end,
	loc_vars = function(self,info_queue, card)
         return {vars = {card.ability.extra.cards}}
	end,
    use = function(card, area, copier)
			if #G.consumeables.cards < G.consumeables.config.card_limit then
			for i = 1, math.min(card.config.extra.cards, G.consumeables.config.card_limit - #G.consumeables.cards) do
			G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
			G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                        local card = create_card('aberration',G.consumeables, nil, nil, nil, nil, nil, '8ba')
                        card:add_to_deck()
                        G.consumeables:emplace(card)
					    G.GAME.consumeable_buffer = 0
						card:juice_up(0.3, 0.5)
                    return true
                end)}))
		end
	end
end
}

SMODS.Consumable{
    key = "fil_di_voce",
    set = "aberration",
    atlas = "aberrations",
	pos = { x = 3, y = 0 },
	 config = {
        extra = {
            dollars = 5
			
        }
    },
    can_use = function(self, card)
        for _,v in pairs(G.jokers.cards) do
            if (v.config.center.yes_pool_flag == "alternate_spawn") then 
                return true
            end
        end
    end,
	loc_vars = function(self,info_queue, card)
         return {vars = {card.ability.extra.dollars}}
	end,
    use = function(card, area, copier)
        for i = 1, #G.jokers.cards do
            if (G.jokers.cards[i].config.center.yes_pool_flag == "alternate_spawn") then
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                play_sound('timpani')
                G.jokers.cards[i]:juice_up(0.3, 0.5)
                ease_dollars(card.config.extra.dollars, true)
                return true end }))
                delay(0.2)
            end
        end
    end
}

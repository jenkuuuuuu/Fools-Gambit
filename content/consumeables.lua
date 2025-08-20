--[[
FG.ALTS.aberration_equivalents = {
    c_fg_tonal = "c_fg_tonal_alt",
    c_fg_atonal = "c_fg_atonal_alt",
    c_fg_treble = "c_fg_treble_alt",
    c_fg_alto = "c_fg_alto_alt",
    c_fg_bass = "c_fg_bass_alt"
}]]

SMODS.Atlas {
	key = "aberrations",
	path = "aberrationcards.png",
	px = 71,
	py = 95
}

SMODS.ConsumableType{
    key = "aberration",
    default = "c_fg_atonal",
    primary_colour = G.C.RED,
    secondary_colour = G.C.PURPLE,
    collection_rows = {7, 7}
}

---@param params {}
---@param extra {area:"jokers"|"consumeables"|string,alt:boolean,loc:string[]}
local function tonal_loc_vars (params,extra)
    local self = params[1]
    local info_queue = params[2]
    local card = params[3]
    local cardarea = extra.area

    local jk_txt = FG.FUNCS.localize{"FG","language_adaptations",extra.loc[1]}
    if card.ability.extra.cards == 1 then jk_txt = FG.FUNCS.localize{"FG","language_adaptations",extra.loc[1]} else jk_txt = FG.FUNCS.localize{"FG","language_adaptations",extra.loc[2]} end
    
    if not G[cardarea] then return {vars = {math.ceil(card.ability.extra.cards),jk_txt}} end
    for i=1, math.min(math.ceil(card.ability.extra.cards),#G[cardarea].cards) do
        if not card.fake_card and #G[cardarea].cards >= 1
        and G[cardarea].cards[i].ability.fg_data
        and G[cardarea].cards[i].ability.fg_data.is_alternate == extra.alt
        and not FG.FUNCS.get_card_info(G[cardarea].cards[i]).stickers.unchangeable then
            info_queue[#info_queue+1] = G.P_CENTERS[G[cardarea].cards[i].ability.fg_data.alternate_card]
        end
    end
    
    return {vars = {math.ceil(card.ability.extra.cards),jk_txt}}
end

---@param param {}
---@param extra {area:"jokers"|"consumeables"|string,alt:boolean}
local function tonal_can (param,extra)
    local self = param[1]
    local card = param[2]
    local cardarea = extra.area

    if G[cardarea] and #G[cardarea].cards >= 1 then
        if not card.ability then card.ability = {extra = { cards = 1}} end
        for i=1, math.min(math.ceil(card.ability.extra.cards or 1),#G[cardarea].cards) do
            if G[cardarea].cards[i].ability.fg_data and G[cardarea].cards[i].ability.fg_data.is_alternate == extra.alt
            and not FG.FUNCS.get_card_info(G[cardarea].cards[i]).stickers.unchangeable
            and FG.FUNCS.check_exists(G[cardarea].cards[i].ability.fg_data.alternate_card) then return true end
        end
    end
end

---@param param {}
---@param extra {area:"jokers"|"consumeables"|string,alt:boolean}
local function tonal_use (param,extra)
    local self = param[1]
    local card = param[2]
    local p_area = param[3]
    local copier = param[4]
    local cardarea = extra.area

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
            if not card.ability then card.ability = {extra = { cards = 1}} end
            for i=1, math.min(math.ceil(card.ability.extra.cards or 1),#G[cardarea].cards) do
                if G[cardarea].cards[i].ability.fg_data.is_alternate == extra.alt
                and not FG.FUNCS.get_card_info(G[cardarea].cards[i]).stickers.unchangeable
                and FG.FUNCS.check_exists(FG.FUNCS.get_card_info(G[cardarea].cards[i]).key) then
                    local c = FG.FUNCS.alternate_card(G[cardarea].cards[i])
                    FG.FUNCS.update_edition(c.original,c.alternate)
                    FG.FUNCS.update_alternate_values(c.original,c.alternate)
                    c.alternate:juice_up()
                end
            end
            return true
        end
    }))
end


---@param param {}
---@param extra {area:"jokers"|"consumeables"|string,alt:boolean,rarity:1|2|3|4|"fg_common_alt"|"fg_uncommon_alt"|"fg_rare_alt"|"fg_legendary_alt"|"fg_collective"|"fg_collective_alt"|string}
local function bulk_loc (param,extra)
    local self = param[1]
    local info_queue = param[2]
    local card = param[3]
    local cardarea = extra.area

    if not G[cardarea] then return end

    for _,v in ipairs(G[cardarea].cards) do
        if v.ability.fg_data and v.ability.fg_data.is_alternate == extra.alt
        and not FG.FUNCS.get_card_info(v).stickers.unchangeable
        and FG.FUNCS.get_card_info(v).rarity == extra.rarity then
            info_queue[#info_queue+1] = G.P_CENTERS[v.ability.fg_data.alternate_card]
        end
    end
end

---@param param {}
---@param extra {area:"jokers"|"consumeables"|string,alt:boolean,rarity:1|2|3|4|"fg_common_alt"|"fg_uncommon_alt"|"fg_rare_alt"|"fg_legendary_alt"|"fg_collective"|"fg_collective_alt"|string}
local function bulk_can (param,extra)
    local self = param[1]
    local card = param[2]
    local cardarea = extra.area

    for _,v in ipairs(G.jokers.cards) do
        if FG.FUNCS.get_card_info(v).rarity == extra.rarity
        and v.ability.fg_data and v.ability.fg_data.is_alternate == extra.alt
        and FG.FUNCS.check_exists(FG.FUNCS.get_card_info(v).key) then return true end
    end
end

---@param param {}
---@param extra {area:"jokers"|"consumeables"|string,alt:boolean,rarity:1|2|3|4|"fg_common_alt"|"fg_uncommon_alt"|"fg_rare_alt"|"fg_legendary_alt"|"fg_collective"|"fg_collective_alt"|string}
local function bulk_use (param,extra)
    local self = param[1]
    local card = param[2]
    local p_area = param[3]
    local copier = param[4]
    local cardarea = extra.area

    G.E_MANAGER:add_event(Event({
    func = function()
        for i,v in ipairs(G[cardarea].cards) do
            if v.ability.fg_data and v.ability.fg_data.is_alternate == extra.alt and FG.FUNCS.get_card_info(v).rarity == extra.rarity 
            and FG.FUNCS.check_exists(FG.FUNCS.get_card_info(v).key)then
                local c = FG.FUNCS.alternate_card(v)
                FG.FUNCS.update_edition(c.original,c.alternate)
                FG.FUNCS.update_alternate_values(c.original,c.alternate)
                c.alternate:juice_up()
            end
        end
        return true
        end
    }))
end


SMODS.Consumable{
    key = "tonal",
    set = "aberration",
    atlas = "aberrations",
	pos = { x = 7, y = 0 },
    config = {
        fg_data = {
            fg_data = {
                is_alternate = false,
                alternate_card = "c_fg_tonal_alt"
		    },
        },
        extra = {cards = 1
    }},
    loc_vars = function (self, info_queue, card) return tonal_loc_vars({self,info_queue,card},{area = "jokers", loc = {"w_joker_singular","w_joker_plural"}, alt = true}) end,
    can_use = function(self, card) return tonal_can({self,card},{area = "jokers", alt = true})end,
    use = function(self, card, area, copier) return tonal_use({self,card,area,copier},{area = "jokers", alt = true}) end
}

SMODS.Consumable{
    key = "atonal",
    set = "aberration",
    atlas = "aberrations",
	pos = { x = 5, y = 0 },
    config = {
        fg_data = {
            is_alternate = false,
            alternate_card = "c_fg_atonal_alt"
        },
        extra = {cards = 1
    }},
    loc_vars = function (self, info_queue, card) return tonal_loc_vars({self,info_queue,card},{area = "jokers", loc = {"w_joker_singular","w_joker_plural"}, alt = false}) end,
    can_use = function(self, card) return tonal_can({self,card},{area = "jokers", alt = false})end,
    use = function(self, card, area, copier) return tonal_use({self,card,area,copier},{area = "jokers", alt = false}) end
}

if FG.config.debug_mode then
SMODS.Consumable{
    key = "accelerando",
    set = "aberration",
    atlas = "aberrations",
	pos = { x = 6, y = 0 },
    config = {
        fg_data = {
            is_alternate = false,
            alternate_card = ""
        },
    },
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
    config = {
        fg_data = {
            is_alternate = true,
            alternate_card = "c_fg_treble_alt"
        },
    },
    loc_vars = function (self, info_queue, card) return bulk_loc({self,info_queue,card},{area = "jokers", alt = false, rarity = 1}) end,
    can_use = function(self, card) return bulk_can({self,card},{area = "jokers", alt = false, rarity = 1}) end,
    use = function(self, card, area, copier) return bulk_use({self,card,area,copier},{area = "jokers", alt = false, rarity = 1}) end
}

SMODS.Consumable{
    key = "bass",
    set = "aberration",
    atlas = "aberrations",
	pos = { x = 0, y = 0 },
    config = {
        fg_data = {
            is_alternate = true,
            alternate_card = "c_fg_bass_alt"
        },
    },
    loc_vars = function (self, info_queue, card) return bulk_loc({self,info_queue,card},{area = "jokers", alt = false, rarity = 2}) end,
    can_use = function(self, card) return bulk_can({self,card},{area = "jokers", alt = false, rarity = 2}) end,
    use = function(self, card, area, copier) return bulk_use({self,card,area,copier},{area = "jokers", alt = false, rarity = 2}) end
}

SMODS.Consumable{
    key = "alto",
    set = "aberration",
    atlas = "aberrations",
	pos = { x = 1, y = 0 },
    config = {
        fg_data = {
            is_alternate = true,
            alternate_card = "c_fg_alto_alt"
        },
    },
    loc_vars = function (self, info_queue, card) return bulk_loc({self,info_queue,card},{area = "jokers", alt = false, rarity = 3}) end,
    can_use = function(self, card) return bulk_can({self,card},{area = "jokers", alt = false, rarity = 3}) end,
    use = function(self, card, area, copier) return bulk_use({self,card,area,copier},{area = "jokers", alt = false, rarity = 3}) end
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
    use = function(self, card, area, copier)
        if #G.consumeables.cards < G.consumeables.config.card_limit then
        if not card.config.extra then card.config.extra = {cards = 2} end
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
    loc_vars = function(self,info_queue, card)
        local cur = 0
        if G.jokers and G.jokers.cards then for _,v in ipairs(G.jokers.cards) do if FG.FUNCS.is_alternate(v) then cur = cur + card.ability.extra.dollars end end end
        return {vars = {card.ability.extra.dollars, cur}}
	end,
    can_use = function(self, card)
        for _,v in pairs(G.jokers.cards) do
            if FG.FUNCS.is_alternate(v) then 
                return true
            end
        end
    end,
    use = function(self, card, area, copier)
        for _,v in ipairs(G.jokers.cards) do
            if v.ability.fg_data and FG.FUNCS.is_alternate(v) then
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                play_sound('timpani')
                card:juice_up()
                v:juice_up(0.3, 0.5)
                ease_dollars(card.ability.extra.dollars, true)
                return true end }))
                delay(0.2)
            end
        end
    end
}


-----------------------------
--- Alternate aberrations ---
-----------------------------

SMODS.Consumable{
    key = "tonal_alt",
    set = "aberration",
    atlas = "aberrations",
	pos = { x = 7, y = 0 },
    config = {
        fg_data = {
            is_alternate = true,
            alternate_card = "c_fg_tonal"
        },
        extra = {cards = 1}
    },
    loc_vars = function (self, info_queue, card) return tonal_loc_vars({self,info_queue,card},{area = "consumeables", loc = {"w_consumable_singular","w_consumable_plural"}, alt = true}) end,
    can_use = function(self, card) return tonal_can({self,card},{area = "consumeables", alt = true})end,
    use = function(self, card, area, copier) return tonal_use({self,card,area,copier},{area = "consumeables", alt = true}) end
}

SMODS.Consumable{
    key = "atonal_alt",
    set = "aberration",
    atlas = "aberrations",
	pos = { x = 5, y = 0 },
    config = {
        fg_data = {
            is_alternate = true,
            alternate_card = "c_fg_atonal_alt"
        },
        extra = {cards = 1}
    },
    loc_vars = function (self, info_queue, card) return tonal_loc_vars({self,info_queue,card},{area = "consumeables", loc = {"w_consumable_singular","w_consumable_plural"}, alt = false}) end,
    can_use = function(self, card) return tonal_can({self,card},{area = "consumeables", alt = false})end,
    use = function(self, card, area, copier) return tonal_use({self,card,area,copier},{area = "consumeables", alt = false}) end
}


SMODS.Consumable{
    key = "treble_alt",
    set = "aberration",
    atlas = "aberrations",
    config = {
        fg_data = {
            is_alternate = true,
            alternate_card = "c_fg_treble"
        },
    },
	pos = { x = 2, y = 0 },
    loc_vars = function (self, info_queue, card) return bulk_loc({self,info_queue,card},{area = "jokers", alt = true, rarity = "fg_common_alt"}) end,
    can_use = function(self, card) return bulk_can({self,card},{area = "jokers", alt = true, rarity = "fg_common_alt"}) end,
    use = function(self, card, area, copier) return bulk_use({self,card,area,copier},{area = "jokers", alt = true, rarity = "fg_common_alt"}) end
}

SMODS.Consumable{
    key = "bass_alt",
    set = "aberration",
    atlas = "aberrations",
    config = {
        fg_data = {
            is_alternate = true,
            alternate_card = "c_fg_bass"
        },
    },
	pos = { x = 0, y = 0 },
    loc_vars = function (self, info_queue, card) return bulk_loc({self,info_queue,card},{area = "jokers", alt = true, rarity = "fg_uncommon_alt"}) end,
    can_use = function(self, card) return bulk_can({self,card},{area = "jokers", alt = true, rarity = "fg_uncommon_alt"}) end,
    use = function(self, card, area, copier) return bulk_use({self,card,area,copier},{area = "jokers", alt = true, rarity = "fg_uncommon_alt"}) end
}

SMODS.Consumable{
    key = "alto_alt",
    set = "aberration",
    atlas = "aberrations",
    config = {
        fg_data = {
            is_alternate = true,
            alternate_card = "c_fg_tonal_alt"
        },
    },
	pos = { x = 1, y = 0 },
    loc_vars = function (self, info_queue, card) return bulk_loc({self,info_queue,card},{area = "jokers", alt = true, rarity = "fg_rare_alt"}) end,
    can_use = function(self, card) return bulk_can({self,card},{area = "jokers", alt = true, rarity = "fg_rare_alt"}) end,
    use = function(self, card, area, copier) return bulk_use({self,card,area,copier},{area = "jokers", alt = true, rarity = "fg_rare_alt"}) end
}
FG.test = {}

local function generate_alternate_label(key,before)
    if before then return
    else return key end
end

if FG.config.debug_mode then
    SMODS.Joker {
        key = "test",
        loc_txt = {
            name = "Test Joker",
            text = {
                "Testing"
            }
        },
        cost = 1,
        rarity = 1,
        loc_vars = function (self, info_queue, card)
        end,
        calculate = function (self, card, context)
        end
    }
end


-- Test any variables and functions here, under FG.test
FG.test = {}


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
        calculate = function (self, card, context)
            if context.repetition and context.cardarea == G.play then
                ----[[
                FG.test.enhancements = SMODS.get_enhancements(context.other_card)
                FG.test.enhancement_chosen = SMODS.poll_enhancement{
                    key = "mila",
                    guaranteed = true,
                    options = {"m_lucky"}
                }
                context.other_card:set_ability(G.P_CENTERS[FG.test.enhancement_chosen])
                --]]--
                --FG.alternate_enhancement(context.other_card,context.other_card)
            end
        end
    }
end


-- Test any variables and functions here, under FG.test
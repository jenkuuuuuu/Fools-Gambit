return {
    descriptions = {
        Back={},
        Blind={},
        Edition={},
        Enhanced={},
        Joker={
            -- Mod jokers
            j_fg_change_of_pace = {
                name = 'Change of Pace',
                text = {
                    "After being sold, change {C:red}everything{}",
                    "to it's {C:purple}Alternate{} form."
                }
            },
            j_fg_change_of_pace_alt = {
                name = 'Change of Pace?',
                text = {
                    "After being sold, change {C:purple}everything{}",
                    "back to it's {C:red}Original{} form."
                }
            },
            j_fg_flipped_script = {
                name = 'Flipped Script',
                text = {
                    "When sold, changes all {C:purple}Alternate{}",
                    "{C:attention}Jokers{} to their {C:red}Original{}"
                }
            },
            j_fg_flipped_script_alt = {
                name = 'Flipped Script',
                text = {
                    "When sold, changes all {C:red}Original{}",
                    "{C:attention}Jokers{} to their {C:purple}Alternate{}"
                }
            },
            j_fg_NOTflipped_script = {
                name = 'NOTFlipped Script',
                text = {
                    "When sold, changes the edition of",
                    "all other jokers to the opposite edition."
                }
            },
            -- Normal jokers
            j_fg_joker = {
                name = 'Joker?',
                text = {
                    "Every card played",
                    "gives {C:mult}+#1#{} Mult."
                }
            },
            j_fg_greedy = {
                name = 'Greedy Joker?',
                text = {
                    "Each played card with {C:diamonds}Diamond{} suit",
                    "temporarily gains {C:mult}+#1#{} mult, resets",
                    "when {C:attention}Boss Blind{} is defeated",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                }
            },
            j_fg_lusty = {
                name = 'Lusty Joker?',
                text = {
                    "Each played card with {C:hearts}Heart{} suit",
                    "temporarily gains {C:mult}+#1#{} mult, resets",
                    "when {C:attention}Boss Blind{} is defeated",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                }
            },
            j_fg_wrathful = {
                name = 'Wrathful Joker?',
                text = {
                    "Each played card with {C:spades}Spade{} suit",
                    "temporarily gains {C:mult}+#1#{} mult, resets",
                    "when {C:attention}Boss Blind{} is defeated",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                }
            },
            j_fg_gluttenous = {
                name = "Gluttonous Joker?",
                text = {
                    "Each played card with {C:clubs}Club{} suit",
                    "temporarily gains {C:mult}+#1#{} mult, resets",
                    "when {C:attention}Boss Blind{} is defeated",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                }
            },
            j_fg_jolly = {
                name = 'Jolly Joker?',
                text = {
                    "{C:red}+#1#{} Mult and",
                    "retrigger scoring cards {C:attention}#3#{} time",
                    "if played hand contains",
                    "a {C:attention}#2#",
               }
            },
            j_fg_zany = {
                name = 'Zany Joker?',
                text = {
                    "{C:red}+#1#{} Mult and",
                    "retrigger scoring cards {C:attention}#3#{} time",
                    "if played hand contains",
                    "a {C:attention}#2#",
               }
            },
            j_fg_mad = {
                name = 'Mad Joker?',
                text = {
                    "{C:red}+#1#{} Mult and",
                    "retrigger scoring cards {C:attention}#3#{} time",
                    "if played hand contains",
                    "a {C:attention}#2#",
               }
            },
            j_fg_crazy = {
                name = 'Crazy Joker?',
                text = {
                    "{C:red}+#1#{} Mult and",
                    "retrigger scoring cards {C:attention}#3#{} time",
                    "if played hand contains",
                    "a {C:attention}#2#",
               }
            },
            j_fg_droll = {
                name = 'Droll Joker?',
                text = {
                    "{C:red}+#1#{} Mult and",
                    "retrigger scoring cards {C:attention}#3#{} time",
                    "if played hand contains",
                    "a {C:attention}#2#",
               }
            },
            j_fg_sly = {
                name = 'Sly Joker?',
                text = {
                    "{C:chips}+#1#{} Chips and",
                    "retrigger scoring cards {C:attention}#3#{} time",
                    "if played hand contains",
                    "a {C:attention}#2#",
               }
            },
            j_fg_wily = {
                name = 'Wily Joker?',
                text = {
                    "{C:chips}+#1#{} Chips and",
                    "retrigger scoring cards {C:attention}#3#{} time",
                    "if played hand contains",
                    "a {C:attention}#2#",
               }
            },
            j_fg_clever = {
                name = 'Clever Joker?',
                text = {
                    "{C:chips}+#1#{} Chips and",
                    "retrigger scoring cards {C:attention}#3#{} time",
                    "if played hand contains",
                    "a {C:attention}#2#",
               }
            },
            j_fg_devious = {
                name = 'Devious Joker?',
                text = {
                    "{C:chips}+#1#{} Chips and",
                    "retrigger scoring cards {C:attention}#3#{} time",
                    "if played hand contains",
                    "a {C:attention}#2#",
               }
            },
            j_fg_crafty = {
                name = 'Crafty Joker?',
                text = {
                    "{C:chips}+#1#{} Chips and",
                    "retrigger scoring cards {C:attention}#3#{} time",
                    "if played hand contains",
                    "a {C:attention}#2#",
               }
            },
            j_fg_dagger = {
                name = 'Ceremonial Dagger?',
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "destroy Joker to the left",
                    "and permanently add {C:attention}X#2#",
                    "its sell value to this {C:chips}Chips",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
                }
            },
            j_fg_banner = {
                name = 'Banner?',
                text = {
                    "{C:red}+#2#{} discards",
                    "{C:chips}+#1#{} Chips for",
                    "each remaining",
                    "{C:attention}discard",
                }
            },
            j_fg_summit = {
                name = 'Mystic Summit?',
                text = {
                    "{C:red}-#2#{} discards",
                    "{C:mult}+#1#{} Mult when",
                    "{C:attention}#3#{} discards",
                    "remaining",
                }
            },
            j_fg_loyalty = {
                name = 'Loyalty Card?',
                text = {
                     "Every {C:attention}#1#{} items",
                     "purchased from the {C:attention}shop{} makes",
                     "the next one {C:money}free{}",
                     "{C:inactive}#2#",
                }
            },
            j_fg_8ball = {
                name = '8 Ball?',
                text = {
                        "Each played {C:attention}8{} creates a",
                        "{C:tarot}Tarot{} card when scored",
                        "{C:inactive}(Must have room)",
                },
            },
            j_fg_misprint = {
                name = 'Misprint?',
                text = {
                    "{X:mult,C:white}X#1#{} Mult"
                }
            },
            j_fg_fist = {
                name = 'Raised Fist?',
                text = {
                    "Adds {C:attention}#1#{} the rank",
                    "of {C:attention}highest{} ranked card",
                    "held in hand to Mult",
                }
            },
            j_fg_fibonacci = {
                name = 'Fibonacci?',
                text = {
                    "Retrigger each scored {C:attention}Ace{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{},",
                    "{C:attention}8{} and {C:attention}King{}{C:attention}1{} time and permanently",
                    "upgrades it to next rank when scored",
                    "{C:inactive}(ex: 2 to 3, 5 to 8, King to Ace){}",
                },
            },
            j_fg_face = {
                name = 'Scary face?',
                text = {
                    'Gains {C:chips}+#2#{} chips per scored {C:attention}face{} card',
                    'Currently {C:chips}+#1#{} chips.'
                },
            },
            j_fg_abstract = {
                name = 'Abstract Joker?',
                text = {
                    "{C:mult}+#1#{} Mult for",
                    "each {C:attention}Joker{} card Sold",
                    "{C:inactive}(Currently {C:red}+#2#{C:inactive} Mult)",
                },
            },
            j_fg_egg = {
                name = 'Egg?',
                text = {
                    "Has {C:money}$#1#{} sell value.",
                    "when sold lose",
                    "{C:mult}#2#{} hand and {C:mult}#3#{} discard"
                },
            },
            j_fg_duo = {
                name = 'The Duo?',
                text = {
                    "Gains {X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#",
                    "{C:inactive}(Currently {X:mult,C:white}X#3#{}{C:inactive} Mult)",
               }
            },
            j_fg_trio = {
                name = 'The Trio?',
                text = {
                    "Gains {X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#",
                    "{C:inactive}(Currently {X:mult,C:white}X#3#{}{C:inactive} Mult)",
               }
            },
            j_fg_family = {
                name = 'The Family?',
                text = {
                    "Gains {X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#",
                    "{C:inactive}(Currently {X:mult,C:white}X#3#{}{C:inactive} Mult)",
               }
            },
            j_fg_order = {
                name = 'The Order?',
                text = {
                    "Gains {X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#",
                    "{C:inactive}(Currently {X:mult,C:white}X#3#{}{C:inactive} Mult)",
               }
            },
            -- Collectives
            j_Fg_deathmodereal = {
                name = 'deathmodereal',
                text = {
                    "He's {X:black,C:white}cool(ish){}",
                    '{X:mult,C:white}X#1#{} mult.'
                },
            },
            j_Fg_deathmodereal_alt = {
                name = 'deathmodereal',
                text = {
                    "He's {X:white,C:black}cool{}",
                    'each scored card gives',
                    '{X:mult,C:white}X#1#{} mult.'
               }
            },
            j_fg_jogla = {
                name = 'Jogla',
                text = {
                    "{C:dark_edition}+#1#{} consumeables slots.",
                    "Increases by #2# after {C:attention}#3# blind{} defeated",
                    "{C:inactive,s:0.7}\"I am NOT a wizard\""
                }
            },
        },
        Other={},
        Planet={},
        Spectral={},
        Stake={},
        Tag={},
        Tarot={},
        Voucher={},
    },
    misc = {
        achievement_descriptions={},
        achievement_names={},
        blind_states={},
        challenge_names={},
        collabs={},
        dictionary={
            k_chipMult="Multiplied!"
        },
        high_scores={},
        labels={},
        poker_hand_descriptions={},
        poker_hands={},
        quips={},
        ranks={},
        suits_plural={},
        suits_singular={},
        tutorial={},
        v_dictionary={},
        v_text={},
    },
}
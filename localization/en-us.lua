return {
    descriptions = {
        fg_abberation={
            c_fg_tonal = {
                name = "Tonal",
                text = {
                    "Converts {C:attention}1{} selected Jokers", -- should be 3, change this to 3 leftmost later
                    "to their {C:red}Original{} form",
                    "{C:inactive}Placeholder Sprite{}",
                    "TEST!!!!!"
                }
            }
        },
        Back={},
        Blind={},
        Edition={},
        Enhanced={
            m_fg_glass = {
                name = "Glass? Card",
                text = {
                    "Gains {C:white,X:red}X1{} Mult for each scoring card",
                    "with this enhancement in playing hand",
                    "destroys after use",
                    "no rank or suit",
                }
            },
            m_fg_steel = {
                name = "Steel? Card",
                text = {
                    "Gains {C:white,X:red}X#1#{} mult for every",
                    "steel card in {C:attention}full deck{}",
                    "Triggers while this card is",
                    "held in hand.",
                    "{C:inactive}(Currently {C:white,X:red}X#2#{C:inactive} mult)"
                }
            },
            m_fg_lucky = {
                name = "Lucky? Card",
                text = {
                    "{C:green}#1# in #2#{} chance",
                    "for {C:chips}+#3#{} Chips",
                    "{C:green}#4# in #5#{} chance",
                    "to win {C:gold}$#6#"
                }
            },
            m_fg_gold = {
                name = "Gold? Card",
                text = {
                    "Add {C:attention}half{} the money equivalent",
                    "to the cards {C:attention}held in hand{}",
                    "at the {C:attention}end of round{C:inactive} (Rounded up){}",
                    "{C:inactive}(Currently {C:gold}+$#1#{C:inactive})"
                },
            },
            m_fg_bonus = {
                name = "Bonus? Card",
                text = {
                    "{C:green}#1# in #2#{} chance",
                    "for {C:chips}+#3#{} Chips",
                    "{C:green}#4# in #5#{} chance",
                    "for {C:chips}#6#{} Chips",
                }
            },
            m_fg_mult = {
                name = "Mult? Card",
                text = {
                    "{C:green}#1# in #2#{} chance",
                    "for {C:mult}+#3#{} mult",
                    "{C:green}#4# in #5#{} chance",
                    "for {C:mult}#6#{} mult",
                }
            },
            m_fg_stone = {
                name = "Stone? Card",
                text = {
                    "When held in hand, self destruct and ",
                    "enhance adjacent non-enhanced cards to",
                    "{C:attention}Stone? Cards{} with {C:chips}15 more chips.",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} extra chips)"
                }
            }
        },
        Joker={
            -- Mod jokers
            j_fg_change_of_pace = {
                name = 'Change of Pace',
                text = {
                    "After being sold, changes spawned {C:red}jokers{}",
                    "to their {C:purple}Alternate{} forms."
                }
            },
            j_fg_change_of_pace_alt = {
                name = 'Change of Pace?',
                text = {
                     "After being sold, changes spawned {C:purple}jokers{}",
                    "to their {C:red}Original{} forms."
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
            j_fg_script_flipped = {
                name = 'Script Flipped',
                text = {
                    "When sold, changes the edition of",
                    "all other jokers to the opposite edition."
                }
            },
			j_fg_delinquent = {
			    name = 'Delinquent',
			    text = {
                    "{C:attention}Replaces{} consumeable cards",
                    "with {C:purple}Aberration{} cards",
                    "when a blind is skipped",
                },
            },
            j_fg_delinquentalt = {
			    name = 'Delinquent?',
			    text = {
                    "{C:attention}Replenishes{} empty consumeable",
                    "card slots with {C:purple}Aberration{} cards",
                    "when a blind is beaten",
                },
            },						
            j_fg_concert = {
                name = 'Concert Ticket',
                text = {
                     "Every {C:money}$#1#{} spent {C:inactive}(#2#){} creates",
                     "an {C:purple}Abberation{} card",
					 "{C:inactive}(Must have room)",
                }
            },
			 j_fg_concertalt = {
                name = 'Concert Ticket?',
                text = {
                     "Creates an {C:purple}Abberation{} card",
                     "when redeeming a {C:attention}Voucher{}",
					 "{C:inactive}(Must have room)",
                }
            },
			j_fg_disc={
                name="Disc Joker",
                text={
                    "{C:red}Original{C:attention} Jokers",
                    "each give {C:chips}+#1#{} Chips",
					 "{s:0.8}Disc Joker included",
                },
            },
			j_fg_orchestral={
                name="Orchestral Joker",
                text={
                    "{C:purple}Alternate{C:attention} Jokers",
                    "each give {C:mult}+#1#{} Mult",
					 "{s:0.8}Orchestral Joker included",
                },
            },
			j_fg_conductor={
                name="Conductor",
                text={
                    "Creates #1# {C:purple}Abberation{} card if",
                    "played poker hand contains only",
                    "{C:attention}Face{} cards",
                    "{C:inactive}(Must have room)",
                },
            },
			j_fg_conductoralt={
                name="Conductor?",
                text={
                    "Creates #1# {C:attention}Face{} cards",
                    "every {C:purple}Abberation{} card used",
                },
            },
            -- Normal jokers
            j_fg_joker = {
                name = 'Joker?',
                text = {
                    "Every card scored",
                    "gives {C:mult}+#1#{} Mult"
                }
            },
            j_fg_greedy = {
                name = 'Greedy Joker?',
                text = {
                    "Each scored card with {C:diamonds}Diamond{} suit",
                    "temporarily gains {C:mult}+#1#{} mult, resets",
                    "when {C:attention}Boss Blind{} is defeated",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                }
            },
            j_fg_lusty = {
                name = 'Lusty Joker?',
                text = {
                    "Each scored card with {C:hearts}Heart{} suit",
                    "temporarily gains {C:mult}+#1#{} mult, resets",
                    "when {C:attention}Boss Blind{} is defeated",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                }
            },
            j_fg_wrathful = {
                name = 'Wrathful Joker?',
                text = {
                    "Each scored card with {C:spades}Spade{} suit",
                    "temporarily gains {C:mult}+#1#{} mult, resets",
                    "when {C:attention}Boss Blind{} is defeated",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                }
            },
            j_fg_gluttenous = {
                name = "Gluttonous Joker?",
                text = {
                    "Each scored card with {C:clubs}Club{} suit",
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
                        "Each scored {C:attention}8{} creates a",
                        "{C:tarot}Tarot{} card when scored",
                        "{C:inactive}(Must have room)",
                },
            },
            j_fg_misprint = {
                name = 'Misprint?',
                text = {
                    ""
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
                    "{C:attention}8{} and {C:attention}King{} {C:attention}1{} time and permanently",
                    "upgrades it to next rank when scored",
                    "{C:inactive}(ex: Ace to 2, 8 to King, King to Ace){}",
                },
            },
            j_fg_face = {
                name = 'Scary face?',
                text = {
                    'Gains {C:chips}+#2#{} chips per scored {C:attention}face{} card',
                    '{C:inactive}(Currently {C:chips}+#1#{C:inactive} chips){}'
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
			 j_fg_gem={
                name="Rough Gem?",
                text={
                    "If poker hand contains a {C:attention}#1#{}",
                    "with only {C:diamonds}Diamond{} suit, earn",
                    "{C:money}$#2#{} when scored",
                },
			},
			j_fg_bloodstone={
                name="Bloodstone?",
                text={
                   "If poker hand contains a {C:attention}#1#{}",
                    "with only {C:hearts}Heart{} suit, gain",
                    "{X:mult,C:white}X#2#{} Mult when scored",
					"{C:inactive}(Currently {X:mult,C:white}X#3#{}{C:inactive} Mult)",
                },
			},
			j_fg_arrowhead={
                name="Arrowhead?",
                text={
                   "If poker hand contains a {C:attention}#1#{}",
                    "with only {C:spades}Spade{} suit, gain",
                    "{C:chips}+#2#{} Chips when scored",
					"{C:inactive}(Currently {C:chips}+#3#{}{C:inactive} Chips)",
                },
			},
			j_fg_agate={
                name="Onyx Agate?",
                text={
                   "If poker hand contains a {C:attention}#1#{}",
                    "with only {C:clubs}Club{} suit, gain",
                    "{C:mult}+#2#{} Mult when scored",
					"{C:inactive}(Currently {C:mult}+#3#{}{C:inactive} Mult)",
                },
			},
            -- Collectives
            j_fg_deathmodereal = {
                name = 'deathmodereal',
                text = {
                    "He's {X:black,C:white}cool(ish){}",
                    '{X:mult,C:white}X#1#{} mult.'
                },
            },
            j_fg_deathmoderealalt = {
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
                    "Create {C:attention}#1# {C:dark_edition}Negative{} copies of",
                    "the {C:attention}leftmost{} consumeable in posession",
                    "at the end of the{C:attention} shop{}.",
                    "{C:inactive}(Currently copying {C:attention}#2#{C:inactive})",
                    "{C:inactive,s:0.7}\"I am NOT a wizard\""
                },
            },
            j_fg_jogla_alt = {
                name = "Jogla",
                text = {
                    "Increases hand size by {C:attention}#1#{} when",
                    "{C:attention}Boos blind{} defeated",
                    "{C:inactive}(Currently {C:attention}+#2#{C:inactive} hand size)"
                }
            },
            j_fg_jenker = {
                name = 'Jenku',
                text = {
                    "Retriggers every {C:attention}Joker{}",
                    "for every second {C:attention}Boss Blind{} defeated.",
                    "starting at {C:mult}1{}",
					"{C:inactive}(Currently {C:mult}#1#{}{C:inactive} time(s))",
                    "{C:inactive,s:0.7}\"Probably caused the most crashes.\""
                }
            }
        },
        Other={
            fg_unchangeable = {
                name = "Unchangeable",
                label = "Unchangeable",
                text = {
                    "Can't be alternated"
                }
            }
        },
        Planet={},
        Spectral={},
        Stake={},
        Tag={},
        Tarot={
            c_fg_chariot = {
                name = "The Chariot?",
                text = {
                    "Replaces the enhancement of",
                    "up to {C:attention}#1#{} selected cards",
                    "into {C:attention}Steel? Cards{}",
                    "Create a copy of each card",
                    "{C:attention}without{} any enhancement",
                    "{C:inactive}(Copied cards must have{}",
                    "{C:inactive}an enhancement){}"
                }
            },
            c_fg_death = {
                name = "Death?",
                text = {
                    "Select up to {C:attention}#1#{} cards",
                    "Convert all cards into the {C:attention}rightmost card",
                    "{C:inactive}(Only copies {C:attention}suit{C:inactive} and {C:attention}rank{C:inactive}){}",
                    "{C:inactive}(Drag to rearrange){}"
                }
            },
            c_fg_devil = {
                name = "The Devil?",
                text = {
                    "Replaces the enhancement of",
                    "up to {C:attention}#1#{} selected cards",
                    "into {C:attention}Gold? Cards{}",
                    "Create a copy of each card",
                    "{C:attention}without{} any enhancement",
                    "{C:inactive}(Copied cards must have{}",
                    "{C:inactive}an enhancement){}"
                }
            },
            c_fg_emperor = {
                name = "The Emperor",
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "create a {C:legendary}Soul{}"
                }
            },
            c_fg_empress = {
                name = "The Empress?",
                text = {
                    "Replaces the enhancement of",
                    "up to {C:attention}#1#{} selected cards",
                    "into {C:attention}Mult? Cards{}",
                    "Create a copy of each card",
                    "{C:attention}without{} any enhancement",
                    "{C:inactive}(Copied cards must have{}",
                    "{C:inactive}an enhancement){}"
                }
            },
            c_fg_fool = {
                name = "The Fool?",
                text = {
                    "Creates {C:attention}#1#{} random",
                    "{C:tarot}Tarot{} or {C:planet}Planet{} card",
                    "{C:inactive}({C:tarot}The Fool?{} excluded)"
                }
            },
            c_fg_hermit = {
                name = "The Hermit?",
                text = {
                    "Enhance {C:attention}#1#{} selected cards",
                    "with a {C:attention}random{} enhancement",
                    "{C:attention}Halves{} money",
                    "{C:inactive}(Max of {C:gold}$#2#{C:inactive})"
                }
            },
            c_fg_hierophant = {
                name = "The Hierophant?",
                text = {
                    "Replaces the enhancement of",
                    "up to {C:attention}#1#{} selected cards",
                    "into {C:attention}Bonus? Cards{}",
                    "Create a copy of each card",
                    "{C:attention}without{} any enhancement",
                    "{C:inactive}(Copied cards must have{}",
                    "{C:inactive}an enhancement){}"
                }
            },
            c_fg_high_priestess = {
                name = "highest Priestess",
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "create a {C:legendary}Black Hole{}"
                }
            },
            c_fg_justice = {
                name = "Justice?",
                text = {
                    "Replaces the enhancement of",
                    "up to {C:attention}#1#{} selected cards",
                    "into {C:attention}Glass? Cards{}",
                    "Create a copy of each card",
                    "{C:attention}without{} any enhancement",
                    "{C:inactive}(Copied cards must have{}",
                    "{C:inactive}an enhancement){}"
                }
            },
            c_fg_magician = {
                name = "The Magician?",
                text = {
                    "Replaces the enhancement of",
                    "up to {C:attention}#1#{} selected cards",
                    "into {C:attention}Lucky? Cards{}",
                    "Create a copy of each card",
                    "{C:attention}without{} any enhancement",
                    "{C:inactive}(Copied cards must have{}",
                    "{C:inactive}an enhancement){}"
                }
            },
            c_fg_moon = {
                name = "The Moon?",
                text = {
                    "Select up to {C:attention}#1#{} cards to",
                    "turn them into {C:clubs}Clubs",
                    "Turn the rest of the {C:attention}hand{}",
                    "into {C:diamonds}Diamonds{}"
                }
            },
            c_fg_star = {
                name = "The Star?",
                text = {
                    "Select up to {C:attention}#1#{} cards to",
                    "turn them into {C:diamonds}Diamonds",
                    "Turn the rest of the {C:attention}hand{}",
                    "into {C:clubs}Clubs{}"
                }
            },
            c_fg_sun = {
                name = "The Sun?",
                text = {
                    "Select up to {C:attention}#1#{} cards to",
                    "turn them into {C:hearts}Hearts",
                    "Turn the rest of the {C:attention}hand{}",
                    "into {C:spades}Spades{}"
                }
            },
            c_fg_temperance = {
                name = "Temperance?",
                text = {
                    "Gives {C:attention}double{} the total sell value",
                    "of {C:attention}all{} consumeables in posession",
                    "{C:inactive}(Max of {C:gold}$#2#{C:inactive})",
                    "{C:inactive}(Currently {C:gold}$#1#{C:inactive})"
                }
            },
            c_fg_wheel_of_fortune = {
                name = "The Wheel of Fortune?",
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "add {C:dark_edition}Negative{} to",
                    "a random {C:attention}Joker{}"
                }
            },
            c_fg_world = {
                name = "The World?",
                text = {
                    "Select up to {C:attention}#1#{} cards to",
                    "turn them into {C:spades}Spades",
                    "Turn the rest of the {C:attention}hand{}",
                    "into {C:hearts}Hearts{}"
                }
            },
        },
        Voucher={},
    },
    misc = {
        -- This one is very important. I have moved every localization key we might need for FG here. 
        -- See aux_functions > FG.FUNCS.card_eval_status_text for more info
        FG = {
            chipMult="Multiplied!",
			plus_abberation="+1 Abberation",
			replaced="Replaced!",
			replenished="Replenished!",
			card_added="+1 Card",
        },

        achievement_descriptions={},
        achievement_names={},
        blind_states={},
        challenge_names={},
        collabs={},
        dictionary={
            k_chipMult="Multiplied!",
			k_plus_abberation="+1 Aberration",
			k_replaced="Replaced!",
			k_replenished="Replenished!",
			k_card_added="+1 Card",
            k_unchangeable_warning = "This card can't be alternated"
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
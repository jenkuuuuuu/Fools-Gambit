return {
    descriptions = {
        aberration={
            c_fg_tonal = {
                name = "Tonal",
                text = {
                    "Converts {C:attention}1{} selected Jokers", -- should be 3, change this to 3 leftmost later
                    "to their {C:red}Original{} form",
                    "{C:inactive}Placeholder Sprite{}",
                }
            },
            c_fg_atonal = {
                name = "Atonal",
                text = {
                    "Converts {C:attention}1{} selected Jokers", -- should be 3, change this to 3 leftmost later
                    "to their {C:purple}Alternate{} form",
                    "{C:inactive}Placeholder Sprite{}"
                }
            },
            c_fg_accelerando = {
                name = "Accelerando",
                text = {
                    "Changes {C:attention}3{} selected cards",
                    "and turns their editions, seals and,",
                    "enhancements to their {C:purple}Alternate{} form",
                    "{C:inactive}Placeholder Sprite{}"
                }
            },
            c_fg_treble = {
                name = "Treble",
                text = {
                    "Turns all Common Jokers in hand",
                    "into their {C:purple}Alternate{} form"
                }
            },
            c_fg_bass = {
                name = "Bass",
                text = {
                    "Turns all Uncommon Jokers in hand",
                    "into their {C:purple}Alternate{} form"
                }
            },
            c_fg_alto = {
                name = "Alto",
                text = {
                    "Turns all Rare Jokers in hand",
                    "into their {C:purple}Alternate{} form"
                }
            },
            c_fg_stake = {
                name = "Stake",
                text = {
                    "Creates up to {C:attention}#1#",
                    "random {C:purple}Aberration{} cards",
                    "{C:inactive}(Must have room)",
                }
            },
            c_fg_fil_di_voce = {
                name = "Fil Di Voce",
                text = {
                    "Gives {C:money}$#1#{} for every",
                    "owned {C:purple}Alternate{} Joker",
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
                    "Gains {C:white,X:red}X#1#{} Mult for every",
                    "{C:attention}steel? card{} in {C:attention}full deck{}",
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
                    "for {C:gold}$#6#"
                }
            },
            m_fg_gold = {
                name = "Gold? Card",
                text = {
                    "Adds {C:attention}half{} the money equivalent",
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
                    "for {C:mult}+#3#{} Mult",
                    "{C:green}#4# in #5#{} chance",
                    "for {C:mult}#6#{} Mult",
                }
            },
            m_fg_stone = {
                name = "Stone? Card",
                text = {
                    "When held in hand, destroy this card and ",
                    "enhance adjacent non-enhanced cards to",
                    "{C:attention}Stone? Cards{} with {C:chips}15 more Chips.",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} extra Chips)"
                }
            },
            m_fg_wild = {
                name = "Wild? Card",
                text = {
                    "When played randomly gives",
                    "{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult,",
                    "{C:white,X:mult}X#3#{} Mult or {C:gold}$#4#{}"
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
                     "an {C:purple}aberration{} card",
					 "{C:inactive}(Must have room)",
                }
            },
			 j_fg_concertalt = {
                name = 'Concert Ticket?',
                text = {
                     "Creates an {C:purple}aberration{} card",
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
                    "Creates #1# {C:purple}aberration{} card if",
                    "played poker hand contains only",
                    "{C:attention}Face{} cards",
                    "{C:inactive}(Must have room)",
                },
            },
			j_fg_conductoralt={
                name="Conductor?",
                text={
                    "Creates #1# {C:attention}Face{} cards",
                    "every {C:purple}aberration{} card used",
                },
            },
            j_fg_oscillator = {
                name = "Oscillator",
                text = {
                    "Gains {C:chips}+#2#{} Chips when blind {C:attention}selected{}",
                    "{C:chips}-#3#{} Chips when blind {C:attention}defeated{}",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips, can't be negative)",
                    "{C:inactive}(Value is kept when {C:purple}alternating{C:inactive} this card)"
                }
            },
            j_fg_oscillator_alt = {
                name = "Oscillator?",
                text = {
                    "Gains {C:chips}+#3#{} Chips when blind {C:attention}defeated{}",
                    "{C:chips}-#2#{} Chips when blind {C:attention}selected{}",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips, can't be negative)",
                    "{C:inactive}(Value is kept when {C:red}alternating{C:inactive} this card)"
                }
            },
            j_fg_mango={
			    name="Mango",
				text={
				    "Gives {C:mult}+#1#{} Mult,",
					"{C:mult}-#2#{} Mult every",
					"{C:purple}Aberration{} card used",
				},
			},
			j_fg_mangoalt={
			    name="Mango?",
				text={
				    "Gives {C:mult}+#1#{} Mult,",
					"{C:mult}-#2#{} Mult every",
					"{C:purple}Alternate{} joker bought",
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
                name = 'Scary Face?',
                text = {
                    'Gains {C:chips}+#2#{} chips per scored {C:attention}face{} card',
                    '{C:inactive}(Currently {C:chips}+#1#{C:inactive} chips){}'
                },
            },
            j_fg_gros_michel = {
                name = "Gros Michel?",
                text = {
                    "{C:white,X:mult}X#1#{} Mult",
                    "{C:green}#2# in #3#{} chance this",
                    "card gets destroyed",
                    "at end of round"
                }
            },
            j_fg_even_steven = {
                name = "Even Steven?",
                text = {
                    "Gains {C:mult}+#1#{} Mult for each",
                    "{C:attention}even triggered{} card",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                    "{C:inactive}(10, 8, 6, 4, 2){}"
                }
            },
            j_fg_odd_todd = {
                name = "Odd Todd?",
                text = {
                    "Gains {C:chips}+#1#{} Chips for each",
                    "{C:attention}odd triggered{} card",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
                    "{C:inactive}(A, 9, 7, 5, 3)"
                }
            },
            j_fg_scholar = {
                name = "Scholar?",
                text = {
                    "{C:white,X:mult}X#1#{} Mult if scoring hand",
                    "contains at least {C:attention}#2#{} #3#s"
                }
            },
            j_fg_business = {
                name = "Business Card?",
                text = {
                    "{C:green}#1# in #2#{} chance to enhance",
                    "scored {C:attention}face{} cards",
                    "{C:inactive}(Applies effect after scoring){}"
                }
            },
            j_fg_supernova = {

            },
            j_fg_ride_the_bus = {
                name = "Ride the Bus?",
                text = {
                    "{C:mult}+#2#{} Mult",
                    "{C:mult}-#1#{} Mult for every",
                    "played {C:attention}face{} card"
                }
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
            j_fg_ice_cream = {
                name = "Ice cream?",
                text = {
                    "{C:chips}+#1#{} Chips",
                    "{C:chips}-#2#{} Chips when",
                    "blind {C:attention}selected{}"
                }
            },
            j_fg_faceless = {
                name = "Faceless Joker?",
                text = {
                    "{C:white,X:mult}X#1#{} Mult if played hand",
                    "contains no {C:attention}face{} cards"
                }
            },
            j_fg_splash = {
                name = "Splash?",
                text = {
                    "undebuffs {C:attention}scored cards{}",
                }
            },
            j_fg_cavendish = {
                name = "Cavendish?",
                text = {
                    "{C:white,X:mult}X#1#{} Mult",
                    "{C:green}#3# in #4#{} chance of losing",
                    "{C:white,X:mult}X#2#{} Mult at end of round.",
                    "Self-destruct on {C:white,X:mult}X1{} Mult"
                }
            },
            j_fg_card_sharp = {
                name = "Card Sharp?",
                text = {
                    ""
                }
            },
            j_fg_red_card = {
                name = "Red Card?",
                text = {
                    "Gains {C:mult}+#2#{} Mult when",
                    "skipping a blind is {C:attention}skipped{}",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
                }
            },
            j_fg_baron = {
                name = "Baron?",
                text = {
                    "Gains {C:white,X:mult}X#2#{} Mult for",
                    "each {C:attention}King{} held in hand",
                    "at {C:attention}end of round",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{}{C:inactive} Mult)"
                }
            },
            j_fg_cloud_9 = {
                name = "Cloud 9?",
                text = {
                    "Earn {C:gold}$#1#{} for each",
                    "scored {C:attention}9{}"
                }
            },
            j_fg_rocket = {
                name = "Rocket?",
                text = {
                    "Earn {C:gold}$#1#{} at {C:attention}end of round{}",
                    "Decrease payout by {C:gold}$#2#{}",
                    "when {C:attention}skipping blind{}"
                }
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
            j_fg_popcorn = {
                name = "Popcorn?",
                text = {
                    "{C:mult}+#1#{} Mult",
                    "{C:mult}-#2#{} per",
                    "hand played"
                }
            },
            j_fg_trouses = {},
            j_fg_ancient = {
                name = "Ancient Joker",
                text = {
                    "Gains {C:white,X:mult}X#2#{} Mult when",
                    "all playing cards are {V:#1#}#3#{}",
                    "Suit changes every round",
                    "{C:inactive}(Currently{C:white,X:mult}#1#{C:inactive} Mult)",
                    "{C:inactive}(Can't go below X0.75 Mult)"
                }
            },
            j_fg_campfire = {
                name = "Campfire?",
                text = {
                    "Gains {C:white,X:mult}X#2#{} Mult for each card {C:attention}discarded{}",
                    "Losses {C:white,X:mult}X#3#{} Mult when {C:attention}boss blind{} defeated",
                    "{C:inactive}(Currently {C:white,X:mult}X#1#{C:inactive} Mult, can't go below {C:white,X:mult}X0.75{C:inactive} Mult)"
                }
            },
            j_fg_throwback = {
                name = "Throwback?",
                text = {
                    "{C:white,X:mult}X#2#{} Mult for each",
                    "{C:attention}shop{} skipped this run",
                    "{C:inactive}(Currently {C:white,X:mult}X#1#{C:inactive} Mult){}"
                }
            },
            j_fg_hanging_chad = {
                name = "Hanging Chad?",
                text = {
                    "{C:green}#1# in #2#{} chance to add a random",
                    "{C:attention}enhancement{} to scored cards",
                    "If already enhanced, {C:green}#3# in #4#{}",
                    "chance to add a random {C:attention}seal{}",
                    "If already have a seal, {C:green}#5# in #6#{}",
                    "chance add a random {C:attention}edition{}",
                    "{C:inactive,s:0.8}(Effect applies after scoring){}"
                },
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
            j_fg_hit_the_road = {
                name = "Hit the Road?",
                text = {
                    "Gains {C:white,X:mult}X#2#{} Mult",
                    "for every {C:attention}Jack{} discarded",
                    "{C:inactive}(Currently {C:white,X:mult}X#1#{C:inactive} Mult)"
                }
            },
            j_fg_invisible = {
                name = "Invisible Joker?",
                text = {
                    "When sold, remove a random {C:attention}Joker",
                    "Create an {C:attention}Invisible memory?{}",
                    "with the removed Joker",
                    "{C:inactive}(Cannot copy eternal jokers{}",
                }
            },
            j_fg_invisible_memory = {
                name = "{C:dark_edition,E:1}Invisible memory?{}",
                text = {
                    "The memory of an {C:attention}Invisible Joker?{}",
                    "After {C:attention}#1#{} round(s), {C:red,E:2}self-destruct{} and",
                    "create {C:attention}#2#{C:dark_edition} negative{} copies of {C:attention}#3#{}",
                }
            },
            j_fg_drivers_license = {
                name = "Driver's license?",
                text = {
                    "{C:white,X:mult}X#1#{} Mult if at least",
                    "{C:attention}half{C:inactive} ({C:attention}#2#{C:inactive}/#3#){} if your {C:attention}full deck{}",
                    "contains {C:attention}enhanced{} cards",
                }
            },
            j_fg_bootstraps = {
                name = "Bootstraps?",
                text = {
                    "Gains {C:mult}+#2#{} Mult, {C:red}-$#3#{}",
                    "at {C:attention}end of round{}",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
                }
            },
            -- Legendaries
            j_fg_caino = {
                name = "Canio?",
                text = {
                    "Gains {X:mult,C:white}X#2#{} Mult for",
                    "each {C:attention}discarded{} face card",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"
                }
            },
            j_fg_triboulet = {
                name = "Triboulet?",
                text = {
                    "Gains {X:mult,C:white}X#2#{} Mult for",
                    "each {C:attention}scored{} face card",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"
                }
            },
            j_fg_yorick = {
                name = "Yorick?",
                text = {
                    "Gains {X:mult,C:white}X#2#{} Mult every",
                    "{C:attention}#3# {C:inactive}(#4#){} hands played",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"
                }
            },
            j_fg_chicot = {
                name = "Chicot?",
                text = {
                    "{C:red}+#2#{} discard when",
                    "{C:attention}boss blind{} defeated",
                    "{C:inactive}(Currently {C:red}+#1#{C:inactive} discards)"
                }
            },
            j_fg_perkeo = {
                name = "Perkeo?",
                text = {
                    "Creates {C:attention}#1#{C:inactive} perishable {C:dark_edition}negative{}",
                    "copy of a non-{C:dark_edition}negative{C:attention} joker{}",
                    "when {C:attention}boss blind{} defeated"
                }
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
                name = "Joglalt",
                text = {
                    "Increases hand size by {C:attention}#1#{} when",
                    "{C:attention}Boss blind{} defeated",
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
            },
            j_fg_goldenleaf = {
                name = "GoldenLeaf",
                text = {
                    "When a {C:gold}Gold{}{C:inactive}(?){} card",
                    "is scored,",
                    "{X:mult,C:white}X#1#{} Mult",
                    "{C:inactive}\"get it cause im \"golden\"leaf\""
                }
            },
            j_fg_goldenleafalt = {
                name = "SilverAutumn",
                text = {
                    "Permanently increase amount of hands",
                    "by {C:blue}#1#{} when",
                    "{C:attention}Boss blind{} defeated",
                    "{C:inactive}(Currently {C:blue}+#2#{C:inactive} hands)"
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
            },
            fg_aberration1 = {
                name = 'Melody Pack',
                text = { 
                    "Choose {C:attention}#1#{} of up to ",
                    "{C:attention}#2#{} {C:purple}aberration{} cards to",
                    "be used instantly."
                }
            },
            fg_aberration2 = {
                name = 'aberration Pack',
                text = {
                    "Choose {C:attention}#1#{} of up to ",
                    "{C:attention}#2#{} {C:purple}aberration{} cards to",
                    "be used instantly."
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
    FG = {
        config = {
            disclaimer = {
                "This mod is currently in early beta",
                "Everything is subject to change",
            },
            extra_jokers = "Additional jokers",
            extra_jokers_tooltip = {
                "Prevents jokers added by Fool's Gambit ",
                "that don't have a vanilla counterpart",
                "from spawning",
                " ",
                "It is not recommended to toggle",
                "this option during a run",
                "{C:dark_edition}This option is experimental{}"
            },
            diplicate_jokers = "Duplicate jokers",
            duplicate_jokers_tooltip = {
                "Allows jokers to spawn even if",
                "it's alternate is in your joker tray",
                " ",
                "It is not recommended to toggle",
                "this option during a run",
                "{C:dark_edition}This option is experimental{}"
            },
            alt_sfx = "Alternate SFX",
            alt_sfx_tooltip = {
                "Replaces balatro's sound effects",
                "with custom ones",
                " ",
                "{C:red}Requires restart{}"
            },
            special_edition = "Special edition",
            debug_mode = "Enable debug mode",
            misc = {
                ["?"] = "(?)",
                require_restart = "(Requires restart)"
            }
        },
        credits = {
            names = {
                goldenleaf = "GoldenLeaf",
                jogla = "Jogla",
                deathmodereal = "deathmodereal",
                jenku = "Jenku",
                gappie = "Gappie",
                samuran = "Samuran",
                hyperx = "Hyperx",
                localthunk = "LocalThunk",
                mathisfun_ = "MathIsFun_",
                rav = "Rav",
                lavbulb = "Lavbulb",
                poker_the_poker = "Poker The Poker",
            },
            languages = {
                ["en-us"] = "English",
                ["es_ES"] = "Spanish",
                ["zh-CN"] = "Chinese",
                ["sn_bos"] = "Sendien"
            },
            misc = {
                page_title = "Credits",
                title = "Fool's Gambit",
                version = "Version",
                lead_developer = "Lead developer",
                code = "CODE",
                art = "ART",
                music = "MUSIC",
                special_thanks = "Special thanks to",
                special_thanks_misc = "Everyone in the FG modding thread",
                localization = "Localization",
                links = {
                    title = "Useful links",
                    github = "Github repository",
                    discord = "Discord server",
                    d_thread = "Mod thread",
                    wiki = "Mod wiki",
                    wiki_dev = "Dev wiki",
                },
            }
        },
    },
    misc = {
        -- This one is very important. I have moved every localization key we might need for FG here. 
        -- See aux_functions > FG.FUNCS.card_eval_status_text for more info
        FG = {
            chipMult="Multiplied!",
			plus_aberration="+1 aberration",
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
            k_plus_aberration="+1 Aberration",
            k_replaced="Replaced!",
            k_replenished="Replenished!",
            k_card_added="+1 Card",
            k_unchangeable_warning = "This card can't be alternated",
            k_fg_active = "Active!",
            k_fg_none = "None",
            k_fg_collective = "Collective",
            k_aberration = "Aberration",
            b_aberration_cards = "Aberration Cards",
        },
        high_scores={},
        labels={
            fg_collective = "Collective",
            fg_aberration = "Aberration"
        },
        poker_hand_descriptions={},
        poker_hands={},
        quips={},
        ranks={},
        suits_plural={},
        suits_singular={},
        tutorial={},
        v_dictionary={},
        v_text={},
    }
}
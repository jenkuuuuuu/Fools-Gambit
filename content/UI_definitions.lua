-- Config tab
SMODS.current_mod.config_tab = function()
	return {n = G.UIT.ROOT, config = {
		-- config values here, see 'Building a UI' page
		r = 0.1, minw = 10, minh = 6, align = "tm", padding = 0.2, colour = G.C.BLACK
	}, nodes = {
		-- work your UI wizardry here, see 'Building a UI' page
		{n = G.UIT.R, config = {minw = 4, minh = 6, align = "tm", padding = 0.1}, nodes = {
			{n = G.UIT.R, nodes = {
				{n = G.UIT.C, nodes = {
					{n = G.UIT.R, nodes = {
						{n = G.UIT.C, nodes = {
							create_toggle{
								label = "Additional jokers",
								ref_table = FG.config,
								ref_value = "extra_jokers"
							},
							{n = G.UIT.R, config = {align = "tm"}, nodes = {
								{n = G.UIT.T, config = {text = "Hover to vew more info", align = "tm", colour = G.C.GREY, scale = .4, minw = 2, minh = 6, padding = 0.4, tooltip = {text = {
									"Prevents jokers added by Fool's Gambit ",
									"that don't have a vanilla counterpart",
									"from spawning",
									" ",
									"It is not recommended to toggle",
									"this option during a run",
									"{C:dark_edition}This option is experimental{}"
									}
								}}},
							}},
						}},
					}}
				}},
				
			}},
			{n = G.UIT.R, nodes = {
				{n = G.UIT.C, nodes = {
					{n = G.UIT.R, nodes = {
						{n = G.UIT.C, nodes = {
							create_toggle{
								label = "Disable duplicated Jokers",
								ref_table = FG.config,
								ref_value = "duplicated_jokers"
							},
							{n = G.UIT.R, config = {align = "tm"}, nodes = {
								{n = G.UIT.T, config = {text = "Hover to vew more info", align = "tm", colour = G.C.GREY, scale = .4, minw = 2, minh = 6, padding = 0.4, tooltip = {text = {
									"Prevents original and alternate jokers",
									"from spawning when the counterpart is",
									"in possesion.",
									"{C:inactive}(Affected by Showman){}",
									"{C:dark_edition}This option is experimental{}"
									}
								}}},
							}},
						}},
					}},
				}},
			}},
			{n = G.UIT.R, config = {minh = 0.3}},
			{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Special edition", colour = G.C.WHITE, scale = .4}}}},
			create_option_cycle{
				options = FG.config.s_version.options,
				current_option = FG.config.s_version.selected,
				opt_callback = 'FG_s_version',
				ref_table = FG.config.s_version,
				ref_value = "selected",
                w = 4
			},
			{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "(Requires restart)", colour = G.C.GREY, scale = .3}}}},
			{n = G.UIT.R, nodes = {
				{n = G.UIT.C, nodes = {
					create_toggle{
						label = "Debug mode",
						ref_table = FG.config,
						ref_value = "debug_mode"
					},
					{n = G.UIT.R, config = {align = "tm"}, nodes = {
						{n = G.UIT.T, config = {text = "(Requires restart)", align = "tm", colour = G.C.GREY, scale = .3, minw = 2, minh = 6, padding = 0.4}},
					}},
					{n = G.UIT.R, config = {align = "tm"}, nodes = {
						{n = G.UIT.T, config = {text = "\"It is called debug for a reason, you hear me?\"", align = "tm", colour = G.C.GREY, scale = .2, minw = 2, minh = 6, padding = 0.4}},
					}},
				}},
			}},
		}}
	}}
end


-- Credits
SMODS.current_mod.extra_tabs = function()
	return {
		{
			label = 'Credits',
			tab_definition_function = function()
				-- works in the same way as mod.config_tab
				return {n = G.UIT.ROOT, config = {
					-- config values here, see 'Building a UI' page
					r = 0.1, minw = 10, minh = 6, align = "tm", padding = 0.2, colour = G.C.BLACK
				}, nodes = {
					-- work your UI wizardry here, see 'Building a UI' page
					{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Fool's Gambit", colour = G.C.PURPLE, scale = .7}}}},
					{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = tostring("Version: "..FG.config.version), colour = G.C.GREY, scale = .3}}}},
					{n = G.UIT.R, config = {align = "tm", minh = .2}},
					{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Lead developer", colour = G.C.GOLD, scale = .5}}}},
					{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "GoldenLeaf", colour = G.C.WHITE, scale = .3}}}},
					{n = G.UIT.R, config = {align = "tm"}, nodes = {
						{n = G.UIT.C, config = {minw = 3, align = "tm", padding = 0.1}, nodes = {
							{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "CODE", colour = G.C.GREEN, scale = .5}}}},
							{n = G.UIT.R, config = {align = "tm", padding = 0.05}, nodes = {
								{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "GoldenLeaf", colour = G.C.WHITE, scale = .3}}}},
								{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Jogla", colour = G.C.WHITE, scale = .3}}}},
								{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "jenku", colour = G.C.WHITE, scale = .3}}}},
								{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "deathmodereal", colour = G.C.WHITE, scale = .3}}}},
							}},
						}},
						{n = G.UIT.C, config = {minw = 3, align = "tm", padding = 0.1}, nodes = {
							{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "ART", colour = G.C.BLUE, scale = .5}}}},
							{n = G.UIT.R, config = {align = "tm", padding = 0.05}, nodes = {
								{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "GoldenLeaf", colour = G.C.WHITE, scale = .3}}}},
								{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Gappie", colour = G.C.WHITE, scale = .3}}}},
								{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Samuran", colour = G.C.WHITE, scale = .3}}}},
								{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Hyperx", colour = G.C.WHITE, scale = .3}}}},
							}},
						}},
						{n = G.UIT.C, config = {minw = 3, align = "tm", padding = 0.1}, nodes = {
							{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "MUSIC", colour = G.C.PURPLE, scale = .5}}}},
							{n = G.UIT.R, config = {align = "tm", padding = 0.05}, nodes = {
								{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "GoldenLeaf", colour = G.C.WHITE, scale = .3}}}},
							}},
						}},
					}},
					{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Special thanks to", colour = G.C.GOLD, scale = .5}}}},

					{n = G.UIT.R, config = {align = "tm"}, nodes = {
						{n = G.UIT.C, config = {minw = 3, align = "tm", padding = 0.1}, nodes = {
							{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "LocalThunk", colour = G.C.WHITE, scale = .3}}}},
							{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "MathIsFun_", colour = G.C.WHITE, scale = .3}}}},						
						}},
						{n = G.UIT.C, config = {minw = 3, align = "tm", padding = 0.1}, nodes = {
							{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "RAV", colour = G.C.WHITE, scale = .3}}}},
							{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Lavbubl", colour = G.C.WHITE, scale = .3}}}},						
						}},
					}},
					{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Everyone in the FG modding thread", colour = G.C.WHITE, scale = .3}}}},
				}}
			end,
		},
		-- insert more tables with the same structure here
	}
end

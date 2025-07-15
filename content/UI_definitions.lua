-- Config tab
SMODS.current_mod.config_tab = function()
	return {n = G.UIT.ROOT, config = {
		-- config values here, see 'Building a UI' page
		r = 0.1, minw = 10, minh = 6, align = "tm", padding = 0.2, colour = G.C.BLACK
	}, nodes = {
		-- work your UI wizardry here, see 'Building a UI' page
		{n = G.UIT.R, config = {align = "tm"}, nodes = {
			{n = G.UIT.C, config = {align = "cm"}, nodes = {
				{n = G.UIT.R, config = {align = "cm"}, nodes = {
					{n = G.UIT.T, config = {text = "This mod is in early beta. Please keep in mind the game may crash", colour = G.C.RED, scale = .4}}
				}}
			}}
		}},
		{n = G.UIT.R, config = {align = "tm"}, nodes = {
			{n = G.UIT.C, config = {align = "cm"}, nodes = {
				{n = G.UIT.R, config = {align = "tm"}, nodes = {
					create_toggle{
						label = "Additional jokers",
						ref_table = FG.config,
						ref_value = "extra_jokers"
					},
				}},
			}},
			{n = G.UIT.C, config = {align = "cm"}, nodes = {
				{n = G.UIT.R, config = {align = "cm"}, nodes = {
					{n = G.UIT.T, config = {text = "(?)", colour = G.C.GREY, scale = .4, tooltip = {text = {
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
			{n = G.UIT.C, config = {align = "cm", minw = 0.3}}, -- separator
			{n = G.UIT.C, config = {align = "cm"}, nodes = {
				{n = G.UIT.R, config = {align = "cm"}, nodes = {
					create_toggle{
						label = "Duplicated jokers",
						ref_table = FG.config,
						ref_value = "duplicated_jokers"
					},
					
				}},
			}},
			{n = G.UIT.C, config = {align = "cm"}, nodes = {
				{n = G.UIT.R, config = {align = "cm"}, nodes = {
					{n = G.UIT.T, config = {text = "(?)", colour = G.C.GREY, scale = .4, tooltip = {text = {
						"Allows jokers to spawn even if",
						"it's alternate is in your joker tray",
						" ",
						"It is not recommended to toggle",
						"this option during a run",
						"{C:dark_edition}This option is experimental{}"
						}
					}}},
				}},
			}}
		}},
		{n = G.UIT.R, config = {align = "cm"}, nodes = {
			{n = G.UIT.C, config = {align = "cm"}, nodes = {
				{n = G.UIT.R, config = {align = "cm"}, nodes = {
					create_toggle{
						label = "Alternate SFX",
						ref_table = FG.config,
						ref_value = "alternate_sfx",
					},
					
				}},
				
			}},
			{n = G.UIT.C, config = {align = "cm"}, nodes = {
				{n = G.UIT.R, config = {align = "cm"}, nodes = {
					{n = G.UIT.T, config = {text = "(?)", colour = G.C.GREY, scale = .4, tooltip = {text = {
							"Replaces balatro's sound effects",
							"with custom ones",
							" ",
							"{C:red}Requires restart{}"
						}
					}}},
				}},
			}},
		}},
		{n = G.UIT.R, config = {align = "cm"}, nodes = {
			{n = G.UIT.C, config = {align = "cm"}, nodes = {
				{n = G.UIT.R, config = {align = "cm"}, nodes = {
					{n = G.UIT.R, config = {align = "cm"}, nodes = {
						{n = G.UIT.T, config = {text = "Special edition", colour = G.C.WHITE, scale = .4, minw = 2, minh = 6, padding = 0.4}},
					}},
					{n = G.UIT.R, config = {align = "cm", minj = 0.2}}, -- separator
					create_option_cycle{
						options = FG.config.s_version.options,
						current_option = FG.config.s_version.selected,
						opt_callback = 'FG_s_version',
						ref_table = FG.config.s_version,
						ref_value = "selected",
						w = 4
					},
				}}
			}}
		}},
		{n = G.UIT.R, config = {align = "cm"}, nodes = {
			{n = G.UIT.C, config = {align = "cm"}, nodes = {
				{n = G.UIT.R, config = {align = "cm"}, nodes = {
					create_toggle{
						label = "Enable debug mode",
						ref_table = FG.config,
						ref_value = "debug_mode"
					},
				}},
				{n = G.UIT.R, config = {align = "cm"}, nodes = {
					{n = G.UIT.T, config = {text = "(Requires restart)", colour = G.C.GREY, scale = .4, minw = 2, minh = 6, padding = 0.4}},
				}}
			}}
		}},
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
					{n = G.UIT.R, config = {align = "tm"}, nodes = {
						{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Fool's Gambit", colour = G.C.DARK_EDITION, scale = .7}}}},
						{n = G.UIT.R, config = {align = "tm", minh = .2}},
						{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = tostring("Version: "..FG.config.version), colour = G.C.GREY, scale = .3}}}},
					}},
					{n = G.UIT.R, config = {align = "tm"}, nodes = {
						{n = G.UIT.C, config = {align = "tm"}, nodes = {
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
									{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "MUSIC", colour = G.C.RED, scale = .5}}}},
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
						}},
						{n = G.UIT.C, config = {align = "tm"}, nodes = {
							{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Useful link", colour = G.C.WHITE, scale = .45}}}},	
							{n = G.UIT.R, config = {minh = 0.15}},
							{n = G.UIT.R, config = {padding = 0.05}, nodes = {
								UIBox_button{
									label = {"Github repository"},
									minw = 4,
									minh = 0.5,
									scale = 0.35,
									button = "FG_link_website",
									ref_table = "https://github.com/jenkuuuuuu/Fools-Gambit"
								}
							}},
							{n = G.UIT.R, config = {padding = 0.05}, nodes = {
								{n = G.UIT.C, nodes = {
									UIBox_button{
										label = {"Discord server"},
										minw = 4,
										minh = 0.5,
										scale = 0.35,
										button = "FG_link_website",
										ref_table = "https://discord.gg/m6Hm6KyQRz"
									}		
								}},
								
							}},
							{n = G.UIT.R, config = {padding = 0.05}, nodes = {
								{n = G.UIT.C, nodes = {
									UIBox_button{
										label = {"Mod thread"},
										minw = 4,
										minh = 0.5,
										scale = 0.35,
										button = "FG_link_website",
										ref_table = "https://discord.com/channels/1116389027176787968/1333809003829923900"
									}		
								}},
							}},
							{n = G.UIT.R, config = {padding = 0.05}, nodes = {
								{n = G.UIT.C, nodes = {
									UIBox_button{
										label = {"Mod wiki"},
										minw = 4,
										minh = 0.5,
										scale = 0.35,
										button = "FG_link_website",
										ref_table = "https://balatromods.miraheze.org/wiki/Fool%27s_Gambit"
									}		
								}},
								
							}},
							{n = G.UIT.R, config = {padding = 0.05}, nodes = {
								{n = G.UIT.C, nodes = {
									UIBox_button{
										label = {"Dev wiki"},
										minw = 4,
										minh = 0.5,
										scale = 0.35,
										button = "FG_link_website",
										ref_table = "https://github.com/jenkuuuuuu/Fools-Gambit/wiki"
									}		
								}},
							}}
						}}
					}}
					-- work your UI wizardry here, see 'Building a UI' page
					
				}}
			end,
		},
		-- insert more tables with the same structure here
	}
end

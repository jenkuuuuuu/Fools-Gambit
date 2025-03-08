FG = {}
FG.config = SMODS.current_mod.config

-- This is in preparation for file splitting. I'll do that later. - Jogla
-- im splitting jokers and stuff into sections to make this easier later - jenku
local mod_contents = {
	"aux_functions",
	"jokers",
	"editions",
	"consumeables",
	"booster_packs",
	"rarities",
	"vouchers",
	"enhancements"
}

for k, v in pairs(mod_contents) do -- Load this mod's files
	assert(SMODS.load_file('/content/'..v..'.lua'))()
  end

SMODS.current_mod.config_tab = function()
	return {n = G.UIT.ROOT, config = {
		-- config values here, see 'Building a UI' page
		r = 0.1, minw = 8, minh = 6, align = "tm", padding = 0.2, colour = G.C.BLACK
	}, nodes = {
		-- work your UI wizardry here, see 'Building a UI' page
		{n = G.UIT.R, config = {minw = 4, minh = 6, align = "tm", padding = 0.1}, nodes = {
			create_toggle({
				label = "Debug mode",
				ref_table = FG.config,
				ref_value = "debug_mode"
			}),
				{n = G.UIT.R, config = {align = "tm"}, nodes = {
					{n = G.UIT.T, config = {text = "(Requires restart)", align = "tm", colour = G.C.GREY, scale = .3, minw = 2, minh = 6, padding = 0.4}},
			}},
			{n = G.UIT.R, config = {align = "tm"}, nodes = {
				{n = G.UIT.T, config = {text = "\"It is called debug for a reason, you hear me?\"", align = "tm", colour = G.C.GREY, scale = .2, minw = 2, minh = 6, padding = 0.4}},
			}},
		}}
	}}
end

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
					{n = G.UIT.R, config = {align = "tm", minh = .2}},
					{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Lead developer", colour = G.C.GOLD, scale = .5}}}},
					{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "GoldenLeaf", colour = G.C.WHITE, scale = .3}}}},
					{n = G.UIT.R, config = {align = "tm"}, nodes = {
						{n = G.UIT.C, config = {minw = 3, align = "tm", padding = 0.1}, nodes = {
							{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "CODE", colour = G.C.GREEN, scale = .5}}}},
							{n = G.UIT.R, config = {align = "tm", padding = 0.05}, nodes = {
								{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Jogla", colour = G.C.WHITE, scale = .3}}}},
								{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Jenku", colour = G.C.WHITE, scale = .3}}}},
								{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Pablo", colour = G.C.WHITE, scale = .3}}}},
								{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Deathmodereal", colour = G.C.WHITE, scale = .3}}}},
								{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Aikoyori", colour = G.C.WHITE, scale = .3}}}},

							}},
						}},
						{n = G.UIT.C, config = {minw = 3, align = "tm", padding = 0.1}, nodes = {
							{n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "SPRITES", colour = G.C.BLUE, scale = .5}}}},
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


if FG.config.debug_mode then
	sendInfoMessage("\n\n\n=== [ /!\\ WARNING /!\\ ] ===\n\nYou are playing with Debug Mode enabled.\nThis can lead to unexpected errors, as it may contain unfinished content.\n\nWHEN MAKING A BUG REPORT, STATE THAT YOU ARE USING DEBUG MODE.\nFool's Gambit version: "..tostring(SMODS.current_mod.version).."\n\n=== [ /!\\ WARNING /!\\ ] ===\n\n", "Fool's gambit")
end
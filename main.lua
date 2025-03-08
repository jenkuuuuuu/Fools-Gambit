FG = {
} -- Every global variable/function this mods uses should go under FG.<whatever_the_heck>
FG.config = SMODS.current_mod.config

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
	}, nodes = {
		-- work your UI wizardry here, see 'Building a UI' page
		{n = G.UIT.ROOT, config = {r = 0.1, minw = 8, minh = 6, align = "tm", padding = 0.2, colour = G.C.BLACK}, nodes = {
			{n = G.UIT.R, config = {minw = 8, minh = 6, align = "tm", padding = 0.1}, nodes = {
				{n = G.UIT.T, config = {text = "(Requires restart)", color = G.C.WHITE, scale = .4, minw = 8, minh = 6, padding = 0.4}, nodes = {
				}},
				create_toggle({
				label = "Debug mode"
			})
			}},

		}}
	}}
end
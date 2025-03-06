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


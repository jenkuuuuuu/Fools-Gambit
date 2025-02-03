
-- This is in preparation for file splitting. I'll do that later. - Jogla
-- im splitting jokers and stuff into sections to make this easier later - jenku
local mod_contents = {
	"aux_functions",
	"jokers",
	"editions",
	"consumeables",
	"boosterpacks"
}

for k, v in pairs(mod_contents) do -- Load this mod's files
	assert(SMODS.load_file('/content/'..v..'.lua'))()
  end

FG = {}
FG.config = SMODS.current_mod.config

FG.config.version = SMODS.current_mod.version

SMODS.current_mod.optional_features = { retrigger_joker = true }

SMODS.Atlas{
	key = 'Consumeables',
	path = 'Tarots.png',
	px = 71,
	py = 95
}

---@alias card table

-- This is in preparation for file splitting. I'll do that later. - Jogla
-- im splitting jokers and stuff into sections to make this easier later - jenku
local mod_contents = {
	"special_editions/sendien",
	"aux_functions",
	"jokers",
	"editions",
	"consumeables",
	"booster_packs",
	"rarities",
	"vouchers",
	"enhancements",
	"UI_definitions",
	"test",
	"special_editions/mila",
	"tarots",
}

for k, v in pairs(mod_contents) do -- Load this mod's files
	assert(SMODS.load_file('/content/'..v..'.lua'))()
end

-- Pool flags
--G.GAME.pool_flags.FG_alternate_spawn = false



if FG.config.debug_mode then
	sendInfoMessage("\n\n\n=== [ /!\\ WARNING /!\\ ] ===\n\nYou are playing with Debug Mode enabled.\nThis can lead to unexpected errors, as it may contain unfinished content.\n\nWHEN MAKING A BUG REPORT, STATE THAT YOU ARE USING DEBUG MODE.\nFool's Gambit version: "..tostring(SMODS.current_mod.version).."\n\n=== [ /!\\ WARNING /!\\ ] ===\n\n", "Fool's gambit")
end
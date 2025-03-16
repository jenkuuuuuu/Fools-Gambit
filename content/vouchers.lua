

SMODS.Atlas {
	key = "vouchers",
	path = "vouchers.png",
	px = 71,
	py = 95
}


if FG.config.debug_mode then
SMODS.Voucher{
	key = 'violin',
	loc_txt = {
		name = 'Violin',
		text = {
			"{C:attention}+1{} option and {C:attention}+1{} select in every",
			"{C:purple}Abberation{} pack."
		}
	},
    atlas = "vouchers",
    pos = { x = 2, y = 0 },
    redeem = function(self,card)
        abberation1.config.choose = abberation1.config.choose + 1
        abberation2.config.extra = abberation2.config.extra + 1
        abberation2.config.choose = abberation2.config.choose + 1
        jumbo_abberation.config.extra = jumbo_abberation.config.extra + 1
        jumbo_abberation.config.choose = jumbo_abberation.config.choose + 1
        mega_abberation.config.extra = mega_abberation.config.extra + 1
        mega_abberation.config.choose = mega_abberation.config.choose + 1

        local card_open_ref = Card.open
        function Card:open()
            sendInfoMessage("card open", "MyInfoLogger")
            sendInfoMessage(self.ability.name, "MyInfoLogger")
            if self.ability.name:find('abberation') then
                sendInfoMessage("abberation", "MyInfoLogger")
                self.ability.extra = self.ability.extra + 1
            end
            card_open_ref(self)
        end
    end
}
end
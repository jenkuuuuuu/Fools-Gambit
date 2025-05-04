

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
			"{C:purple}aberration{} pack."
		}
	},
    atlas = "vouchers",
    pos = { x = 2, y = 0 },
    redeem = function(self,card)
        aberration1.config.choose = aberration1.config.choose + 1
        aberration2.config.extra = aberration2.config.extra + 1
        aberration2.config.choose = aberration2.config.choose + 1
        jumbo_aberration.config.extra = jumbo_aberration.config.extra + 1
        jumbo_aberration.config.choose = jumbo_aberration.config.choose + 1
        mega_aberration.config.extra = mega_aberration.config.extra + 1
        mega_aberration.config.choose = mega_aberration.config.choose + 1

        local card_open_ref = Card.open
        function Card:open()
            sendInfoMessage("card open", "MyInfoLogger")
            sendInfoMessage(self.ability.name, "MyInfoLogger")
            if self.ability.name:find('aberration') then
                sendInfoMessage("aberration", "MyInfoLogger")
                self.ability.extra = self.ability.extra + 1
            end
            card_open_ref(self)
        end
    end
}
end
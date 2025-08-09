FG.vouchers = {}

SMODS.Atlas {
	key = "vouchers",
	path = "vouchers.png",
	px = 71,
	py = 95
}


if FG.config.debug_mode then
SMODS.Voucher{
	key = 'violin',
    atlas = "vouchers",
    pos = { x = 2, y = 0 },
    redeem = function(self,card)
        for _,v in pairs(FG.boosters) do
            v.config.choice = v.config.choice + 1
            v.config.extra = v.config.extra + 1
        end

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
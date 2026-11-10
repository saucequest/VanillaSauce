SMODS.Joker {
    key = 'flowery',
    config = {
        extra = { mult0 = 9 }
    },
    loc_txt = {
        ['name'] = 'Flowery',
        ['text'] = {
            [1] = '{C:red}+999999999{} Mult{C:inactive,s:0.7}.....?{}'
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card and card.ability and card.ability.extra and card.ability.extra['mult0'] or self and self.config and self.config.extra and self.config.extra['mult0'] or 9
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            do
            return {
                mult = card.ability.extra.mult0
            }
        end
    end
end
}

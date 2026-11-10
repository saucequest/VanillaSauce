SMODS.Joker {
    key = 'friedegg',
    config = {
        extra = { sell_value0 = 2 }
    },
    loc_txt = {
        ['name'] = 'Fried Egg',
        ['text'] = {
            [1] = '{C:money}$#1# {}discount on all shop items',
            [2] = '+3% at end of round'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {}
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            do
            card.ability.extra_value = (card.ability.extra_value or 0) + card.ability.extra.sell_value0; if card.set_cost then card:set_cost() end
            return {
                message = 'Sell Value Updated',
                colour = G.C.MONEY
            }
        end
    end
end
}

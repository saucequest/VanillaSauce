SMODS.Joker {
    key = 'corpsejoker',
    config = {
        extra = {
            var_deadasfuck0 = 2,
            var_deadasfuck1 = 0,
            deadasfuck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Corpse Joker',
        ['text'] = {
            [1] = 'Gain {C:red}+2{} Mult for every',
            [2] = '{C:attention}held {}in hand {C:attention}face {}card, lose all {C:red}+Mult{}',
            [3] = 'when a {C:attention}face {}card is scored',
            [4] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 3,
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
                card and card.ability and card.ability.extra and card.ability.extra['deadasfuck'] or self and self.config and self.config.extra and self.config.extra['deadasfuck'] or 0,
                card and card.ability and card.ability.extra and card.ability.extra['var_deadasfuck0'] or self and self.config and self.config.extra and self.config.extra['var_deadasfuck0'] or 2,
                card and card.ability and card.ability.extra and card.ability.extra['deadasfuck'] or self and self.config and self.config.extra and self.config.extra['deadasfuck'] or 0,
                card and card.ability and card.ability.extra and card.ability.extra['var_deadasfuck1'] or self and self.config and self.config.extra and self.config.extra['var_deadasfuck1'] or 0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if context.other_card:is_face() then
                return {
                    func = function()
                        card.ability.extra.deadasfuck = (card.ability.extra.deadasfuck) + card.ability.extra.var_deadasfuck0
                        return true
                    end,
                    colour = G.C.GREEN
                }
            end
        end
        if context.joker_main then
            do
            return {
                mult = card.ability.extra.deadasfuck
            }
        end
    end
    if context.individual and context.cardarea == G.play then
        if context.other_card:is_face() then
            card.ability.extra.deadasfuck = card.ability.extra.var_deadasfuck1
            return {
                colour = G.C.BLUE
            }
        end
    end
end
}

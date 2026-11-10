SMODS.Joker {
    key = 'placeholder_joker',
    config = {
        extra = {
            generic_compare_rhs_value20 = 0,
            mult0 = 20
        }
    },
    loc_txt = {
        ['name'] = 'Placeholder Joker',
        ['text'] = {
            [1] = '{C:red}+20{} Mult if Joker slots are not',
            [2] = 'full'
        }
    },
    pos = {
        x = 3,
        y = 2
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card and card.ability and card.ability.extra and card.ability.extra['mult0'] or self and self.config and self.config.extra and self.config.extra['mult0'] or 20,
                ((G and G.jokers and G.jokers.config and G.jokers.config.card_limit or 0) - #(G and G.jokers and G.jokers.cards or {}))
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if ((G and G.jokers and G.jokers.config and G.jokers.config.card_limit or 0) - #(G and G.jokers and G.jokers.cards or {})) ~= card.ability.extra.generic_compare_rhs_value20 then
                return {
                    mult = card.ability.extra.mult0
                }
            end
        end
    end
}

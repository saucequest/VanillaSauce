SMODS.Joker {
    key = 'mafioso',
    config = {
        extra = {
            debt_amount0 = 30,
            player_money_value0 = -1,
            Xmult0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Mafioso',
        ['text'] = {
            [1] = 'Can go up to {C:money}-$10{} in debt',
            [2] = 'Give {X:red,C:white}X2{} Mult when in debt'
        }
    },
    pos = {
        x = 6,
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
                card and card.ability and card.ability.extra and card.ability.extra['Xmult0'] or self and self.config and self.config.extra and self.config.extra['Xmult0'] or 2
            }
        }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - card.ability.extra.debt_amount0
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at + card.ability.extra.debt_amount0
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if G.GAME.dollars <= card.ability.extra.player_money_value0 then
                return {
                    Xmult = card.ability.extra.Xmult0
                }
            end
        end
    end
}

SMODS.Joker {
    key = 'pringlesjokerbot',
    config = {
        extra = {
            joker_count_value0 = 3,
            dollars0 = 7
        }
    },
    loc_txt = {
        ['name'] = 'Pringles Jokerbot',
        ['text'] = {
            [1] = '{C:money}+$7{} at end of round if',
            [2] = 'only 3 {C:attention}Jokers {}are owned'
        }
    },
    pos = {
        x = 1,
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
                card and card.ability and card.ability.extra and card.ability.extra['dollars0'] or self and self.config and self.config.extra and self.config.extra['dollars0'] or 7
            }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            if #G.jokers.cards == card.ability.extra.joker_count_value0 then
                return {
                    dollars = card.ability.extra.dollars0,
                    colour = G.C.MONEY
                }
            end
        end
    end
}

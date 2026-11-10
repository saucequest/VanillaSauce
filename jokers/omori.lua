SMODS.Joker {
    key = 'omori',
    config = {
        extra = {
            suit_count_count0 = 1,
            Xmult0 = 3,
            hands0 = 1,
            suit_count_count1 = 1,
            Xmult1 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'OMORI',
        ['text'] = {
            [1] = 'If scored hand is {C:attention}all {}{C:red}Red {}Suits,',
            [2] = 'give {X:red,C:white}X3{} Mult but use up an extra {C:attention}hand{}',
            [3] = 'If scored hand is all {C:inactive}Black {}Suits, give',
            [4] = '{X:red,C:white}X1.5{} Mult'
        },
        ['unlock'] = {
            [1] = 'Discard a Club Flush'
        }
    },
    pos = {
        x = 1,
        y = 2
    },
    soul_pos = {
        x = 2,
        y = 2
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card and card.ability and card.ability.extra and card.ability.extra['Xmult0'] or self and self.config and self.config.extra and self.config.extra['Xmult0'] or 3,
                card and card.ability and card.ability.extra and card.ability.extra['Xmult1'] or self and self.config and self.config.extra and self.config.extra['Xmult1'] or 1.5
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if (function() local c = 0; for _, playing_card in pairs(context.scoring_hand or {}) do if (playing_card:is_suit('Hearts') or playing_card:is_suit('Diamonds')) then c = c + 1 end end return c end)() == #context.scoring_hand then
            return {
                Xmult = card.ability.extra.Xmult0,
                extra = {
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.hands0).." Hands", colour = G.C.RED})
                        G.GAME.current_round.hands_left = G.GAME.current_round.hands_left - card.ability.extra.hands0
                        return true
                    end,
                    colour = G.C.GREEN
                }
            }
        else
            if (function() local c = 0; for _, playing_card in pairs(context.scoring_hand or {}) do if (playing_card:is_suit('Spades') or playing_card:is_suit('Clubs')) then c = c + 1 end end return c end)() == #context.scoring_hand then
            return {
                Xmult = card.ability.extra.Xmult1
            }
        end
    end
end
end
}

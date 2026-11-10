SMODS.Joker {
    key = 'missingposter',
    config = {
        extra = {
            rank_count_count0 = 1,
            Xmult0 = 1.85,
            destroy_joker_index0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Missing Poster',
        ['text'] = {
            [1] = '{X:red,C:white}X1.85{} Mult if no {C:attention}face {}cards',
            [2] = 'are in played hand, {C:red}destroy {}self when a',
            [3] = '{C:attention}face{} card is scored'
        }
    },
    pos = {
        x = 5,
        y = 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card and card.ability and card.ability.extra and card.ability.extra['Xmult0'] or self and self.config and self.config.extra and self.config.extra['Xmult0'] or 1.85
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if (function() local c = 0; for _, playing_card in pairs(context.full_hand or {}) do if playing_card:is_face() then c = c + 1 end end return c end)() == 0 then
            return {
                Xmult = card.ability.extra.Xmult0
            }
        end
    end
    if context.individual and context.cardarea == G.play then
        if context.other_card:is_face() then
            local target_joker = card
            if target_joker then
                target_joker.getting_sliced = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                        return true
                    end
                }))
            end
            return {
                message = 'Destroyed!',
                colour = G.C.RED
            }
        end
    end
end
}

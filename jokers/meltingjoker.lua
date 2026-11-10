SMODS.Joker {
    key = 'meltingjoker',
    config = {
        extra = {
            destroy_joker_index0 = 1,
            var_sell0 = 0,
            destroy_joker_index1 = 1,
            numerator_0 = 1,
            odds_0 = 3,
            sell = 0
        }
    },
    loc_txt = {
        ['name'] = 'Melting Joker',
        ['text'] = {
            [1] = '{C:red}Destroy {}{C:attention}lastmost {}Joker and gain',
            [2] = 'x1.5 its {C:money}sell value{} when round ends',
            [3] = '{C:green}#2# in #3#{} chance to {C:red}self-destruct{} instead'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        local description_numerator2, description_denominator2
        description_numerator2, description_denominator2 = SMODS.get_probability_vars(card, card and card.ability and card.ability.extra and card.ability.extra['numerator_0'] or self and self.config and self.config.extra and self.config.extra['numerator_0'] or 1, card and card.ability and card.ability.extra and card.ability.extra['odds_0'] or self and self.config and self.config.extra and self.config.extra['odds_0'] or 3, 'j_vanillasauce_meltingjoker')
        return {
            vars = {
                card and card.ability and card.ability.extra and card.ability.extra['sell'] or self and self.config and self.config.extra and self.config.extra['sell'] or 0,
                card and card.ability and card.ability.extra and card.ability.extra['var_sell0'] or self and self.config and self.config.extra and self.config.extra['var_sell0'] or 0,
                description_numerator2,
                description_denominator2
            }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            do
            local jf_effects
            local jf_effects_tail
            local jf_remove = false
            local jf_append_effect = function(effect)
                if jf_effects_tail then
                    jf_effects_tail.extra = effect
                else
                    jf_effects = effect
                end
                jf_effects_tail = effect
                jf_remove = jf_remove or not not jf_effects_tail.remove
                while jf_effects_tail.extra do
                    jf_effects_tail = jf_effects_tail.extra
                    jf_remove = jf_remove or not not jf_effects_tail.remove
                end
            end
            local target_joker = nil
            for i = #(G.jokers.cards or {}), 1, -1 do
                local joker = G.jokers.cards[i]
                if joker ~= card and not joker.getting_sliced then
                    target_joker = joker
                    break
                end
            end
            if target_joker then
                if target_joker.ability then target_joker.ability.eternal = nil end
                target_joker.getting_sliced = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                        return true
                    end
                }))
            end
            jf_append_effect({
                message = 'Destroyed!',
                colour = G.C.RED
            })
            card.ability.extra_value = (card.ability.extra_value or 0) + card.ability.extra.sell; if card.set_cost then card:set_cost() end
            jf_append_effect({
                message = 'Sell Value Updated',
                colour = G.C.MONEY
            })
            jf_append_effect({
                func = function()
                    card.ability.extra.sell = card.ability.extra.var_sell0
                    return true
                end,
                colour = G.C.BLUE
            })
            if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'j_vanillasauce_meltingjoker', false) then
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
                jf_append_effect({
                    message = 'Destroyed!',
                    colour = G.C.RED
                })
            end
            if jf_effects then
                if jf_remove then
                    jf_effects.remove = true
                end
                return jf_effects
            end
        end
    end
end
}

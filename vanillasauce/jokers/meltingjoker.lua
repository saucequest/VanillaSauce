
SMODS.Joker{ --Melting Joker
    key = "meltingjoker",
    config = {
        extra = {
            sell = 0,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Melting Joker',
        ['text'] = {
            [1] = '{C:red}Destroy {}{C:attention}lastmost {}Joker and gain',
            [2] = 'half its {C:money}sell value{} when round ends',
            [3] = '{C:green}1 in 4{} chance to {C:red}self-destruct{} instead'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["vanillasauce_vanilla_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_vanillasauce_meltingjoker') 
        return {vars = {card.ability.extra.sell, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if true then
                local sell_value = card.ability.extra.sell
                return {
                    func = function()
                        local target_joker = nil
                        for i = #G.jokers.cards, 1, -1 do
                            local joker = G.jokers.cards[i]
                            if joker ~= card and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
                        if target_joker then
                            if target_joker.ability.eternal then
                                target_joker.ability.eternal = nil
                            end
                            local joker_sell_value = target_joker.sell_cost or 0
                            local sell_value_gain = joker_sell_value * 0.5
                            card.ability.extra.sell = card.ability.extra.sell + sell_value_gain
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end,
                    extra = {
                        func = function()local my_pos = nil
                            for i = 1, #G.jokers.cards do
                                if G.jokers.cards[i] == card then
                                    my_pos = i
                                    break
                                end
                            end
                            local target_card = G.jokers.cards[my_pos]
                            target_card.ability.extra_value = (card.ability.extra_value or 0) + sell_value
                            target_card:set_cost()
                            return true
                        end,
                        message = "+"..tostring(sell_value).." Sell Value",
                        colour = G.C.MONEY,
                        extra = {
                            func = function()
                                card.ability.extra.sell = 0
                                return true
                            end,
                            colour = G.C.BLUE
                        }
                    }
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_73ddafd3', 1, card.ability.extra.odds, 'j_vanillasauce_meltingjoker', false) then
                            SMODS.calculate_effect({func = function()
                                local target_joker = card
                                
                                if target_joker then
                                    target_joker.getting_sliced = true
                                    G.E_MANAGER:add_event(Event({
                                        func = function()
                                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                            return true
                                        end
                                    }))
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                                end
                                return true
                            end}, card)
                        end
                        return true
                    end
                }
            end
        end
    end
}

SMODS.Joker{ --Porch Thief
    key = "porchthief",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Porch Thief',
        ['text'] = {
            [1] = 'When {C:attention}round {}ends, destroy a',
            [2] = '{C:attention}consumable {}and create an {C:enhanced}Enhanced{}',
            [3] = 'card',
            [4] = '{C:inactive}(Requires atleast one consumable){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["vanillasauce_vanillasauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if to_big(#G.consumeables.cards) >= to_big(1) then
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local base_card = create_playing_card({
                    front = card_front,
                    center = pseudorandom_element({G.P_CENTERS.m_gold, G.P_CENTERS.m_steel, G.P_CENTERS.m_glass, G.P_CENTERS.m_wild, G.P_CENTERS.m_mult, G.P_CENTERS.m_lucky, G.P_CENTERS.m_stone}, pseudoseed('add_card_hand_enhancement'))
                }, G.discard, true, false, nil, true)
                
                
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        base_card:start_materialize()
                        G.play:emplace(base_card)
                        return true
                    end
                }))
                return {
                    func = function()
                        local target_cards = {}
                        for i, consumable in ipairs(G.consumeables.cards) do
                            table.insert(target_cards, consumable)
                        end
                        if #target_cards > 0 then
                            local card_to_destroy = pseudorandom_element(target_cards, pseudoseed('destroy_consumable'))
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    card_to_destroy:start_dissolve()
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed Consumable!", colour = G.C.RED})
                        end
                        return true
                    end,
                    extra = {
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                                    return true
                                end
                            }))
                            draw_card(G.play, G.deck, 90, 'up')
                            SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                        end,
                        message = "Added Card!",
                        colour = G.C.GREEN
                    }
                }
            end
        end
    end
}
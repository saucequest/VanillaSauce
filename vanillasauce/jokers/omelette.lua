
SMODS.Joker{ --Omelette
    key = "omelette",
    config = {
        extra = {
            sell_value0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Omelette',
        ['text'] = {
            [1] = 'All Jokers gain {C:money}+$2 sell value{}',
            [2] = 'at end of round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["vanillasauce_vanillasauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_SEALS["food"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"food\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    for i, target_card in ipairs(G.jokers.cards) do
                        if target_card.set_cost then
                            target_card.ability.extra_value = (card.ability.extra_value or 0) + 2
                            target_card:set_cost()
                        end
                    end
                    return true
                end,
                message = "All Jokers +"..tostring(2).." Sell Value"
            }
        end
    end
}

SMODS.Joker{ --Fried Egg
    key = "friedegg",
    config = {
        extra = {
            sell_value0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Fried Egg',
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
    pools = { ["vanillasauce_vanillasauce_jokers"] = true, ["vanillasauce_food"] = true },
    
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
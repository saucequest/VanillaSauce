
SMODS.Joker{ --Pringles Jokerbot
    key = "pringlesjokerbot",
    config = {
        extra = {
            dollars0 = 7
        }
    },
    loc_txt = {
        ['name'] = 'Pringles Jokerbot',
        ['text'] = {
            [1] = '{C:money}+$7{} at end of round if',
            [2] = 'only 3 {C:attention}Jokers {}are owned'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["vanillasauce_vanillasauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if to_big(#G.jokers.cards) == to_big(3) then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 7
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(7), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
    end
}
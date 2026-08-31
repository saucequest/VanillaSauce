
SMODS.Joker{ --Corpse Joker
    key = "corpsejoker",
    config = {
        extra = {
            deadasfuck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Corpse Joker',
        ['text'] = {
            [1] = 'Gain {C:red}+2{} Mult for every',
            [2] = '{C:attention}held {}in hand {C:attention}face {}card, lose all {C:red}+Mult{}',
            [3] = 'a {C:attention}face {}card is scored',
            [4] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.deadasfuck}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  and not context.blueprint then
            if context.other_card:is_face() then
                return {
                    func = function()
                        card.ability.extra.deadasfuck = (card.ability.extra.deadasfuck) + 2
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.deadasfuck
            }
        end
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if context.other_card:is_face() then
                card.ability.extra.deadasfuck = 0
            end
        end
    end
}
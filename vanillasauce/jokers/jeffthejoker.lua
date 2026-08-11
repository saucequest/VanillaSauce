
SMODS.Joker{ --Jeff the Joker
    key = "jeffthejoker",
    config = {
        extra = {
            repetitions0 = 1,
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'Jeff the Joker',
        ['text'] = {
            [1] = 'Scored {C:attention}face {}cards are {C:attention}retriggered{}',
            [2] = 'and have a {C:green}#1# in #2#{}',
            [3] = 'chance to be {C:red}destroyed{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
    pools = { ["vanillasauce_vanilla_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_vanillasauce_jeffthejoker') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:is_face() then
                return {
                    repetitions = 1,
                    message = localize('k_again_ex')
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_f1197b35', 1, card.ability.extra.odds, 'j_vanillasauce_jeffthejoker', false) then
                            context.other_card.should_destroy = true
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            end
        end
    end
}
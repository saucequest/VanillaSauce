
SMODS.Joker{ --Dust!Joker
    key = "dustjoker",
    config = {
        extra = {
            levelofviolence = 0,
            lvlup = 20
        }
    },
    loc_txt = {
        ['name'] = 'Dust!Joker',
        ['text'] = {
            [1] = 'When {C:attention}Blind {}selected, {C:red}destroy {}Joker to',
            [2] = 'the {C:attention}right {}and gain {C:red}+4{} Mult',
            [3] = 'For every {C:red}+20{} Mult, add {C:red}2{} Mult to Mult',
            [4] = 'gaining',
            [5] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}',
            [6] = '{C:inactive}(Art by C0remix){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 1
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.levelofviolence, card.ability.extra.lvlup}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.levelofviolence = (card.ability.extra.levelofviolence) + 4
                    return true
                end,
                extra = {
                    func = function()
                        local my_pos = nil
                        for i = 1, #G.jokers.cards do
                            if G.jokers.cards[i] == card then
                                my_pos = i
                                break
                            end
                        end
                        local target_joker = nil
                        if my_pos and my_pos < #G.jokers.cards then
                            local joker = G.jokers.cards[my_pos + 1]
                            if not SMODS.is_eternal(joker) and not joker.getting_sliced then
                                target_joker = joker
                            end
                        end
                        
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
                    end,
                    colour = G.C.RED
                }
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big((card.ability.extra.levelofviolence or 0)) >= to_big(card.ability.extra.lvlup) then
                card.ability.extra.levelofviolence = (card.ability.extra.levelofviolence) + 2
                card.ability.extra.lvlup = (card.ability.extra.lvlup) + 20
            else
                return {
                    mult = card.ability.extra.levelofviolence
                }
            end
        end
    end
}
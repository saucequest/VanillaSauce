
SMODS.Joker{ --Tomato
    key = "tomato",
    config = {
        extra = {
            tomato = 0
        }
    },
    loc_txt = {
        ['name'] = 'Tomato',
        ['text'] = {
            [1] = '{C:attention}First {}scored {C:attention}face {}card gains a',
            [2] = '{C:attention}Red{} Seal if the {C:attention}previous{} played hand',
            [3] = 'was below 20% of the {C:attention}Blind Requirement{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["vanillasauce_vanillas_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_SEALS["food"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"food\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.tomato}}
    end,
    
    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers  and not context.blueprint then
            if to_big(G.GAME.chips / G.GAME.blind.chips) < to_big(0.2) then
                return {
                    func = function()
                        card.ability.extra.tomato = 1
                        return true
                    end
                }
            end
        end
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if ((function()
                for i = 1, #context.scoring_hand do
                    local scoring_card = context.scoring_hand[i]
                    if scoring_card:is_face() then
                        return scoring_card == context.other_card
                    end
                end
                return false
            end)() and to_big((card.ability.extra.tomato or 0)) == to_big(1)) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_seal("Red", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                card.ability.extra.tomato = 0
            end
        end
    end
}
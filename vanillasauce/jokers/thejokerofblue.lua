
SMODS.Joker{ --The Joker of Blue
    key = "thejokerofblue",
    config = {
        extra = {
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'The Joker of Blue',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance to add a',
            [2] = '{C:attention}Blue {}Seal {C:attention}King {}to deck if hand',
            [3] = 'contains no scoring {C:attention}face {}cards'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_vanillasauce_thejokerofblue') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_face() then
                        count = count + 1
                    end
                end
                return count == 0
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_9e5ef0ef', 1, card.ability.extra.odds, 'j_vanillasauce_thejokerofblue', false) then
                    local suit_prefix = pseudorandom_element({'H','S','D','C'}, "random_suit")
                    local rank_suffix = 'K'
                    local card_front = G.P_CARDS[suit_prefix..rank_suffix]
                    local base_card = create_playing_card({
                        front = card_front,
                        center = G.P_CENTERS.c_base
                    }, G.discard, true, false, nil, true)
                    
                    base_card:set_seal("Blue", true)
                    
                    
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    local new_card = copy_card(base_card, nil, nil, G.playing_card)
                    
                    new_card:add_to_deck()
                    
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    G.deck:emplace(new_card)
                    table.insert(G.playing_cards, new_card)
                    
                    base_card:remove()
                    
                    G.E_MANAGER:add_event(Event({
                        func = function() 
                            new_card:start_materialize()
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Leave the damn internet!", colour = G.C.GREEN})
                end
            end
        end
    end
}
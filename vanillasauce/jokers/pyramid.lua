
SMODS.Joker{ --Pyramid
    key = "pyramid",
    config = {
        extra = {
            angles = 0
        }
    },
    loc_txt = {
        ['name'] = 'Pyramid',
        ['text'] = {
            [1] = 'Every{C:attention} third played{} 3 adds',
            [2] = 'a {C:attention}King {}card to deck'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
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
    pools = { ["vanillasauce_vanilla_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.angles}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 3 and to_big((card.ability.extra.angles or 0)) ~= to_big(2)) then
                card.ability.extra.angles = (card.ability.extra.angles) + 1
            elseif (context.other_card:get_id() == 3 and to_big((card.ability.extra.angles or 0)) == to_big(2)) then
                local suit_prefix = pseudorandom_element({'H','S','D','C'}, "random_suit")
                local rank_suffix = 'K'
                local card_front = G.P_CARDS[suit_prefix..rank_suffix]
                local base_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.c_base
                }, G.discard, true, false, nil, true)
                
                
                
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
                card.ability.extra.angles = 0
                return {
                    message = "Added Card!"
                }
            end
        end
    end
}
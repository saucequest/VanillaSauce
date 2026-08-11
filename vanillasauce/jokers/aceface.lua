
SMODS.Joker{ --Ace Face
    key = "aceface",
    config = {
        extra = {
            source_rank_type = 'face_cards',
            source_ranks = '{}',
            target_rank = '"A"'
        }
    },
    loc_txt = {
        ['name'] = 'Ace Face',
        ['text'] = {
            [1] = 'All {C:attention}Face {}cards are counted as {C:attention}Aces{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["vanillasauce_vanillasauce_jokers"] = true },
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        -- Combine ranks effect enabled
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        -- Combine ranks effect disabled
    end
}


local card_get_id_ref = Card.get_id
function Card:get_id()
    local original_id = card_get_id_ref(self)
    if not original_id then return original_id end

    if next(SMODS.find_card("j_vanillasauce_aceface")) then
        if original_id >= 11 and original_id <= 13 then return 14 end
    end
    return original_id
end

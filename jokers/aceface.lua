SMODS.Joker {
    key = 'aceface',
    loc_txt = {
        ['name'] = 'Ace Face',
        ['text'] = {
            [1] = 'All {C:attention}Face {}cards are counted as {C:attention}Aces{}'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {}
        }
    end
}
local card_get_id_ref = Card.get_id
function Card:get_id()
    local original_id = card_get_id_ref(self)
    if not original_id then return original_id end
    if next(SMODS.find_card("j_vanillasauce_aceface")) and (original_id >= 11 and original_id <= 13) then
        return 14
    end
    return original_id
end

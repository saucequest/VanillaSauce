SMODS.Joker {
    key = 'jevil',
    config = {
        extra = { repetitions0 = 1 }
    },
    loc_txt = {
        ['name'] = 'Jevil',
        ['text'] = {
            [1] = 'Scored {C:spades}Spades{} are {C:attention}retriggered{}',
            [2] = 'for every {C:attention}Suit {}in played hand'
        }
    },
    pos = {
        x = 9,
        y = 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {}
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition then
            if context.other_card:is_suit('Spades') then
                return {
                    repetitions = card.ability.extra.repetitions0,
                    message = localize('k_again_ex'),
                    colour = G.C.RED
                }
            end
        end
    end
}

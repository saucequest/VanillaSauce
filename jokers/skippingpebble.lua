SMODS.Joker {
    key = 'skippingpebble',
    config = {
        extra = { repetitions0 = 1 }
    },
    loc_txt = {
        ['name'] = 'Skipping Pebble',
        ['text'] = {
            [1] = 'Scored {C:attention}Stone{} cards are {C:attention}retriggered{}'
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    cost = 4,
    rarity = 1,
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
            if context.other_card.config.center.key == 'm_stone' then
                return {
                    repetitions = card.ability.extra.repetitions0,
                    message = localize('k_again_ex'),
                    colour = G.C.RED
                }
            end
        end
    end
}

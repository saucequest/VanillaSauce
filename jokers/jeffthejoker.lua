SMODS.Joker {
    key = 'jeffthejoker',
    config = {
        extra = {
            numerator_0 = 1,
            odds_0 = 2,
            repetitions0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Jeff the Joker',
        ['text'] = {
            [1] = 'Scored cards are {C:attention}retriggered{}',
            [2] = 'and have a {C:green}#1# in #2#{}',
            [3] = 'chance to be {C:red}destroyed{}'
        }
    },
    pos = {
        x = 1,
        y = 0
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
        local description_numerator0, description_denominator0
        description_numerator0, description_denominator0 = SMODS.get_probability_vars(card, card and card.ability and card.ability.extra and card.ability.extra['numerator_0'] or self and self.config and self.config.extra and self.config.extra['numerator_0'] or 1, card and card.ability and card.ability.extra and card.ability.extra['odds_0'] or self and self.config and self.config.extra and self.config.extra['odds_0'] or 2, 'j_vanillasauce_jeffthejoker')
        return {
            vars = {
                description_numerator0,
                description_denominator0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play then
            do
            local jf_effects
            local jf_effects_tail
            local jf_remove = false
            local jf_append_effect = function(effect)
                if jf_effects_tail then
                    jf_effects_tail.extra = effect
                else
                    jf_effects = effect
                end
                jf_effects_tail = effect
                jf_remove = jf_remove or not not jf_effects_tail.remove
                while jf_effects_tail.extra do
                    jf_effects_tail = jf_effects_tail.extra
                    jf_remove = jf_remove or not not jf_effects_tail.remove
                end
            end
            if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'j_vanillasauce_jeffthejoker', false) then
                if context.other_card then
                    context.other_card.should_destroy = true
                end
                jf_append_effect({
                    message = 'Destroyed!',
                    colour = G.C.RED
                })
            end
            if jf_effects then
                if jf_remove then
                    jf_effects.remove = true
                end
                return jf_effects
            end
        end
    end
    if context.cardarea == G.play and context.repetition then
        do
        local jf_effects
        local jf_effects_tail
        local jf_remove = false
        local jf_append_effect = function(effect)
            if jf_effects_tail then
                jf_effects_tail.extra = effect
            else
                jf_effects = effect
            end
            jf_effects_tail = effect
            jf_remove = jf_remove or not not jf_effects_tail.remove
            while jf_effects_tail.extra do
                jf_effects_tail = jf_effects_tail.extra
                jf_remove = jf_remove or not not jf_effects_tail.remove
            end
        end
        jf_append_effect({
            repetitions = card.ability.extra.repetitions0,
            message = localize('k_again_ex'),
            colour = G.C.RED
        })
        if jf_effects then
            if jf_remove then
                jf_effects.remove = true
            end
            return jf_effects
        end
    end
end
end
}

SMODS.Joker {
    key = 'michaeljokeson',
    config = {
        extra = {
            create_consumable_count0 = 1,
            numerator_0 = 1,
            odds_0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Michael Jokeson',
        ['text'] = {
            [1] = 'Playing a {C:attention}Straight{} has a {C:green}#1# in #2#{}',
            [2] = 'chance to create {C:purple}The Moon{}',
            [3] = '{C:inactive}(Requires room){}'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        local description_numerator0, description_denominator0
        description_numerator0, description_denominator0 = SMODS.get_probability_vars(card, card and card.ability and card.ability.extra and card.ability.extra['numerator_0'] or self and self.config and self.config.extra and self.config.extra['numerator_0'] or 1, card and card.ability and card.ability.extra and card.ability.extra['odds_0'] or self and self.config and self.config.extra and self.config.extra['odds_0'] or 3, 'j_vanillasauce_michaeljokeson')
        return {
            vars = {
                description_numerator0,
                description_denominator0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if context.scoring_name == 'Straight' then
                if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'j_vanillasauce_michaeljokeson', false) then
                    if #G.consumeables.cards + (G.GAME.consumeable_buffer or 0) < G.consumeables.config.card_limit then SMODS.add_card({ area = G.consumeables, key = 'c_moon', set = 'Tarot' }) end
                end
            end
        end
    end
}

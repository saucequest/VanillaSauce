SMODS.Joker {
    key = 'thejokerofblue',
    config = {
        extra = {
            rank_count_count0 = 1,
            numerator_0 = 1,
            odds_0 = 4
        }
    },
    loc_txt = {
        ['name'] = 'The Joker of Blue',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance to add a',
            [2] = '{C:attention}Blue {}Seal {C:attention}King {}to deck if hand',
            [3] = 'contains no scoring {C:attention}face {}cards'
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        local description_numerator0, description_denominator0
        description_numerator0, description_denominator0 = SMODS.get_probability_vars(card, card and card.ability and card.ability.extra and card.ability.extra['numerator_0'] or self and self.config and self.config.extra and self.config.extra['numerator_0'] or 1, card and card.ability and card.ability.extra and card.ability.extra['odds_0'] or self and self.config and self.config.extra and self.config.extra['odds_0'] or 4, 'j_vanillasauce_thejokerofblue')
        return {
            vars = {
                description_numerator0,
                description_denominator0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if (function() local c = 0; for _, playing_card in pairs(context.scoring_hand or {}) do if playing_card:is_face() then c = c + 1 end end return c end)() == 0 then
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
            if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'j_vanillasauce_thejokerofblue', false) then
                local created_playing_cards0 = {}
                local created_playing_card0 = SMODS.add_card({
                    set = 'Base',
                    area = G.deck,
                    no_edition = true,
                    rank = 'K',
                    seal = 'Blue'
                })
                if created_playing_card0 then
                    table.insert(created_playing_cards0, created_playing_card0)
                end
                if #created_playing_cards0 > 0 then
                    if G.deck and G.deck.config then
                        G.deck.config.card_limit = math.max(G.deck.config.card_limit, #G.playing_cards)
                    end
                    SMODS.calculate_context({
                        playing_card_added = true,
                        cards = created_playing_cards0
                    })
                end
                jf_append_effect({
                    message = #created_playing_cards0 > 0 and 'Added Card!',
                    colour = G.C.GREEN
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
end
}

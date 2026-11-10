SMODS.Joker {
    key = 'pyramid',
    config = {
        extra = {
            internal_variable_value_value0 = 2,
            var_angles0 = 1,
            internal_variable_value_value1 = 2,
            var_angles1 = 0,
            angles = 0
        }
    },
    loc_txt = {
        ['name'] = 'Pyramid',
        ['text'] = {
            [1] = 'Every{C:attention} third played{} 3 adds',
            [2] = 'a {C:attention}King {}card to deck'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card and card.ability and card.ability.extra and card.ability.extra['angles'] or self and self.config and self.config.extra and self.config.extra['angles'] or 0,
                card and card.ability and card.ability.extra and card.ability.extra['var_angles0'] or self and self.config and self.config.extra and self.config.extra['var_angles0'] or 1,
                card and card.ability and card.ability.extra and card.ability.extra['var_angles1'] or self and self.config and self.config.extra and self.config.extra['var_angles1'] or 0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 3 and card.ability.extra.angles ~= card.ability.extra.internal_variable_value_value0 then
                card.ability.extra.angles = (card.ability.extra.angles) + card.ability.extra.var_angles0
                return {
                    colour = G.C.GREEN
                }
            else
                if context.other_card:get_id() == 3 and card.ability.extra.angles == card.ability.extra.internal_variable_value_value1 then
                    local created_playing_cards0 = {}
                    local created_playing_card0 = SMODS.add_card({
                        set = 'Base',
                        area = G.deck,
                        no_edition = true,
                        rank = 'K'
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
                    card.ability.extra.angles = card.ability.extra.var_angles1
                    return {
                        message = #created_playing_cards0 > 0 and 'Added Card!',
                        colour = G.C.GREEN,
                        extra = {
                            colour = G.C.BLUE
                        }
                    }
                end
            end
        end
    end
}

SMODS.Joker {
    key = 'tomato',
    config = {
        extra = {
            blind_req_percentage0 = 20,
            var_tomato0 = 1,
            internal_variable_value_value0 = 1,
            var_tomato1 = 0,
            tomato = 0
        }
    },
    loc_txt = {
        ['name'] = 'Tomato',
        ['text'] = {
            [1] = '{C:attention}First {}scored {C:attention}face {}card gains a',
            [2] = '{C:attention}Red{} Seal if the {C:attention}previous{} played hand',
            [3] = 'was below 20% of the {C:attention}Blind Requirement{}'
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card and card.ability and card.ability.extra and card.ability.extra['tomato'] or self and self.config and self.config.extra and self.config.extra['tomato'] or 0,
                card and card.ability and card.ability.extra and card.ability.extra['var_tomato0'] or self and self.config and self.config.extra and self.config.extra['var_tomato0'] or 1,
                card and card.ability and card.ability.extra and card.ability.extra['var_tomato1'] or self and self.config and self.config.extra and self.config.extra['var_tomato1'] or 0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            if ((G.GAME.chips or 0) / (G.GAME.blind.chips or 1) * 100) < card.ability.extra.blind_req_percentage0 then
                return {
                    func = function()
                        card.ability.extra.tomato = card.ability.extra.var_tomato0
                        return true
                    end,
                    colour = G.C.BLUE
                }
            end
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card == context.scoring_hand[1] and context.other_card:get_id() == ((SMODS.Ranks['face'] or {}).id or 0) and card.ability.extra.tomato == card.ability.extra.internal_variable_value_value0 then
                local edited_card = context and context.other_card
                if edited_card then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            if not edited_card or edited_card.removed or edited_card.destroyed or edited_card.shattered or edited_card.getting_sliced then return true end
                            edited_card:set_seal("Red", true)
                            card_eval_status_text(edited_card, 'extra', nil, nil, nil, {message = 'Card Modified!', colour = G.C.ORANGE})
                            return true
                        end
                    }))
                end
                card.ability.extra.tomato = card.ability.extra.var_tomato1
                return {
                    colour = G.C.BLUE,
                    extra = {
                        colour = G.C.BLUE
                    }
                }
            end
        end
    end
}

SMODS.Joker {
    key = 'dustjoker',
    config = {
        extra = {
            var_levelofviolence0 = 4,
            destroy_joker_index0 = 1,
            var_levelofviolence1 = 2,
            var_lvlup0 = 20,
            levelofviolence = 0,
            lvlup = 20
        }
    },
    loc_txt = {
        ['name'] = 'Dust!Joker',
        ['text'] = {
            [1] = 'When {C:attention}Blind {}selected, {C:red}destroy {}',
            [2] = 'random Joker and gain {C:red}+4{} Mult',
            [3] = 'For every {C:red}+20{} Mult, add {C:red}2{} Mult to Mult',
            [4] = 'gaining',
            [5] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}',
            [6] = '{C:inactive}(Art by C0remix){}'
        }
    },
    pos = {
        x = 2,
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
        return {
            vars = {
                card and card.ability and card.ability.extra and card.ability.extra['levelofviolence'] or self and self.config and self.config.extra and self.config.extra['levelofviolence'] or 0,
                card and card.ability and card.ability.extra and card.ability.extra['lvlup'] or self and self.config and self.config.extra and self.config.extra['lvlup'] or 20,
                card and card.ability and card.ability.extra and card.ability.extra['var_levelofviolence0'] or self and self.config and self.config.extra and self.config.extra['var_levelofviolence0'] or 4,
                card and card.ability and card.ability.extra and card.ability.extra['levelofviolence'] or self and self.config and self.config.extra and self.config.extra['levelofviolence'] or 0,
                card and card.ability and card.ability.extra and card.ability.extra['var_levelofviolence1'] or self and self.config and self.config.extra and self.config.extra['var_levelofviolence1'] or 2,
                card and card.ability and card.ability.extra and card.ability.extra['var_lvlup0'] or self and self.config and self.config.extra and self.config.extra['var_lvlup0'] or 20
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and context.main_eval then
            do
            local destructable_jokers = {}
            for _, joker in ipairs(G.jokers.cards or {}) do
                if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                    destructable_jokers[#destructable_jokers + 1] = joker
                end
            end
            local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
            if target_joker then
                target_joker.getting_sliced = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                        return true
                    end
                }))
            end
            return {
                func = function()
                    card.ability.extra.levelofviolence = (card.ability.extra.levelofviolence) + card.ability.extra.var_levelofviolence0
                    return true
                end,
                colour = G.C.GREEN,
                extra = {
                    message = 'Destroyed!',
                    colour = G.C.RED
                }
            }
        end
    end
    if context.joker_main then
        if card.ability.extra.levelofviolence >= card.ability.extra.lvlup then
            card.ability.extra.levelofviolence = (card.ability.extra.levelofviolence) + card.ability.extra.var_levelofviolence1
            card.ability.extra.lvlup = (card.ability.extra.lvlup) + card.ability.extra.var_lvlup0
            return {
                colour = G.C.GREEN,
                extra = {
                    colour = G.C.GREEN
                }
            }
        else
            do
            return {
                mult = card.ability.extra.levelofviolence
            }
        end
    end
end
end
}

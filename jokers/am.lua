SMODS.Joker {
    key = 'am',
    loc_txt = {
        ['name'] = 'AM',
        ['text'] = {
            [1] = '{X:red,C:white}X1{} Mult for each empty Joker slot',
            [2] = '{C:inactive}(Currently{} {X:red,C:white}X#3#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                1 + ((G and G.jokers and G.jokers.config and G.jokers.config.card_limit or 0) - #(G and G.jokers and G.jokers.cards or {})) * 1,
                ((G and G.jokers and G.jokers.config and G.jokers.config.card_limit or 0) - #(G and G.jokers and G.jokers.cards or {})),
                1 + ((G and G.jokers and G.jokers.config and G.jokers.config.card_limit or 0) - #(G and G.jokers and G.jokers.cards or {})) * 1
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            do
            return {
                Xmult = 1 + ((G and G.jokers and G.jokers.config and G.jokers.config.card_limit or 0) - #(G and G.jokers and G.jokers.cards or {}))
            }
        end
    end
end
}

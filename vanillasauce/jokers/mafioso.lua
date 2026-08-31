
SMODS.Joker{ --Mafioso
    key = "mafioso",
    config = {
        extra = {
            debt_amount = '30',
            xmult0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Mafioso',
        ['text'] = {
            [1] = 'Can go up to {C:money}-$30{} in debt',
            [2] = 'Give {X:red,C:white}X2{} Mult when in debt'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["vanillasauce_vanillasauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(G.GAME.dollars) <= to_big(-1) then
                return {
                    Xmult = 2
                }
            end
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - 30
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at + 30
    end
}
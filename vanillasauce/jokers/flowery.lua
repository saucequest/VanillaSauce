
SMODS.Joker{ --Flowery
    key = "flowery",
    config = {
        extra = {
            mult0 = 9
        }
    },
    loc_txt = {
        ['name'] = 'Flowery',
        ['text'] = {
            [1] = '{C:red}+999999999{} Mult{C:inactive,s:0.7}.....?{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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
            return {
                mult = 9
            }
        end
    end
}
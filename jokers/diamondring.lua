SMODS.Joker {
    key = 'diamondring',
    config = {
        extra = {
            hand_count_value0 = 1,
            suit_count_count0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Diamond Ring',
        ['text'] = {
            [1] = 'If played hand equals',
            [2] = 'exactly one {C:diamonds}Diamond{} card, create',
            [3] = 'a {C:attention}King {}and {C:attention}Queen{}'
        }
    },
    pos = {
        x = 4,
        y = 1
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
        return {
            vars = {}
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if #context.scoring_hand == card.ability.extra.hand_count_value0 and (function() local c = 0; for _, playing_card in pairs(context.scoring_hand or {}) do if playing_card:is_suit('Diamonds') then c = c + 1 end end return c end)() == #context.scoring_hand then
            local created_playing_cards0 = {}
            local created_playing_card0 = SMODS.add_card({
                set = 'Base',
                area = G.hand,
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
            local created_playing_cards1 = {}
            local created_playing_card1 = SMODS.add_card({
                set = 'Base',
                area = G.hand,
                no_edition = true,
                rank = 'Q'
            })
            if created_playing_card1 then
                table.insert(created_playing_cards1, created_playing_card1)
            end
            if #created_playing_cards1 > 0 then
                if G.deck and G.deck.config then
                    G.deck.config.card_limit = math.max(G.deck.config.card_limit, #G.playing_cards)
                end
                SMODS.calculate_context({
                    playing_card_added = true,
                    cards = created_playing_cards1
                })
            end
            return {
                message = #created_playing_cards0 > 0 and 'Added Card!',
                colour = G.C.GREEN,
                extra = {
                    message = #created_playing_cards1 > 0 and 'Added Card!',
                    colour = G.C.GREEN
                }
            }
        end
    end
end
}

SMODS.Joker {
    key = 'thirdeye',
    config = {
        extra = {
            rank_count_count0 = 2,
            rank_count_count1 = 2,
            rank_count_count2 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Third Eye',
        ['text'] = {
            [1] = 'If played hand contains a',
            [2] = '{C:attention}face {}card {C:attention}pair{}, create an {C:attention}Ace{}'
        }
    },
    pos = {
        x = 9,
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
        return {
            vars = {}
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if (function() local c = 0; for _, playing_card in pairs(context.scoring_hand or {}) do if playing_card:get_id() == 11 then c = c + 1 end end return c end)() >= card.ability.extra.rank_count_count0 or (function() local c = 0; for _, playing_card in pairs(context.scoring_hand or {}) do if playing_card:get_id() == 13 then c = c + 1 end end return c end)() >= card.ability.extra.rank_count_count1 or (function() local c = 0; for _, playing_card in pairs(context.scoring_hand or {}) do if playing_card:get_id() == 12 then c = c + 1 end end return c end)() >= card.ability.extra.rank_count_count2 then
            local created_playing_cards0 = {}
            local created_playing_card0 = SMODS.add_card({
                set = 'Base',
                area = G.deck,
                no_edition = true,
                rank = 'A'
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
            return {
                message = #created_playing_cards0 > 0 and 'Added Card!',
                colour = G.C.GREEN
            }
        end
    end
end
}

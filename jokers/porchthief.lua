SMODS.Joker {
    key = 'porchthief',
    config = {
        extra = { consumable_count_value0 = 1 }
    },
    loc_txt = {
        ['name'] = 'Porch Thief',
        ['text'] = {
            [1] = 'When {C:attention}round {}ends, destroy a',
            [2] = '{C:attention}consumable {}and create an {C:enhanced}Enhanced{}',
            [3] = 'card',
            [4] = '{C:inactive}(Requires atleast one consumable){}'
        }
    },
    pos = {
        x = 5,
        y = 0
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
            vars = {}
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            if #G.consumeables.cards >= card.ability.extra.consumable_count_value0 then
                do
                local target_consumables = {}
                for _, consumable in ipairs((G and G.consumeables and G.consumeables.cards) or {}) do
                    if consumable and not consumable.getting_sliced and not consumable.removed then
                        target_consumables[#target_consumables + 1] = consumable
                    end
                end
                if #target_consumables > 0 then
                    local target_consumable = pseudorandom_element(target_consumables, pseudoseed('destroy_consumable'))
                    if target_consumable then SMODS.destroy_cards({target_consumable}) end
                end
            end
            local created_playing_cards0 = {}
            local created_playing_card0 = SMODS.add_card({
                set = 'Base',
                area = G.deck,
                no_edition = true,
                enhancement = SMODS.poll_enhancement({
                    key = 'create_playing_card_enhancement',
                    guaranteed = true
                })
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
                message = 'Destroyed Consumable!',
                colour = G.C.RED,
                extra = {
                    message = #created_playing_cards0 > 0 and 'Added Card!',
                    colour = G.C.GREEN
                }
            }
        end
    end
end
}

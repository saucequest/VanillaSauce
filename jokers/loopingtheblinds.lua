SMODS.Joker {
    key = 'loopingtheblinds',
    config = {
        extra = {
            rank_count_count0 = 1,
            rank_count_count1 = 1,
            rank_count_count2 = 1,
            rank_count_count3 = 1,
            rank_count_count4 = 1,
            rank_count_count5 = 1,
            rank_count_count6 = 1,
            rank_count_count7 = 1,
            rank_count_count8 = 1,
            rank_count_count9 = 1,
            rank_count_count10 = 1,
            rank_count_count11 = 1,
            rank_count_count12 = 1,
            rank_count_count13 = 1,
            rank_count_count14 = 1,
            rank_count_count15 = 1,
            rank_count_count16 = 1,
            rank_count_count17 = 1,
            rank_count_count18 = 1,
            rank_count_count19 = 1,
            rank_count_count20 = 1,
            rank_count_count21 = 1,
            rank_count_count22 = 1,
            rank_count_count23 = 1,
            rank_count_count24 = 1,
            rank_count_count25 = 1,
            repetitions0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Looping the Blinds',
        ['text'] = {
            [1] = 'If hand is {C:attention}all {}the same {C:attention}rank{},',
            [2] = '{C:attention}retrigger {}scored cards'
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    cost = 8,
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
        if context.cardarea == G.play and context.repetition then
            if (function() local c = 0; for _, playing_card in pairs(context.scoring_hand or {}) do if playing_card:get_id() == 2 then c = c + 1 end end return c end)() == #context.scoring_hand or (function() local c = 0; for _, playing_card in pairs(context.scoring_hand or {}) do if playing_card:get_id() == 3 then c = c + 1 end end return c end)() == #context.scoring_hand or (function() local c = 0; for _, playing_card in pairs(context.scoring_hand or {}) do if playing_card:get_id() == 4 then c = c + 1 end end return c end)() == #context.scoring_hand or (function() local c = 0; for _, playing_card in pairs(context.scoring_hand or {}) do if playing_card:get_id() == 5 then c = c + 1 end end return c end)() == #context.scoring_hand or (function() local c = 0; for _, playing_card in pairs(context.scoring_hand or {}) do if playing_card:get_id() == 6 then c = c + 1 end end return c end)() == #context.scoring_hand or (function() local c = 0; for _, playing_card in pairs(context.scoring_hand or {}) do if playing_card:get_id() == 7 then c = c + 1 end end return c end)() == #context.scoring_hand or (function() local c = 0; for _, playing_card in pairs(context.scoring_hand or {}) do if playing_card:get_id() == 8 then c = c + 1 end end return c end)() == #context.scoring_hand or (function() local c = 0; for _, playing_card in pairs(context.scoring_hand or {}) do if playing_card:get_id() == 9 then c = c + 1 end end return c end)() == #context.scoring_hand or (function() local c = 0; for _, playing_card in pairs(context.scoring_hand or {}) do if playing_card:get_id() == 10 then c = c + 1 end end return c end)() == #context.scoring_hand or (function() local c = 0; for _, playing_card in pairs(context.scoring_hand or {}) do if playing_card:get_id() == 11 then c = c + 1 end end return c end)() == #context.scoring_hand or (function() local c = 0; for _, playing_card in pairs(context.scoring_hand or {}) do if playing_card:get_id() == 12 then c = c + 1 end end return c end)() == #context.scoring_hand or (function() local c = 0; for _, playing_card in pairs(context.scoring_hand or {}) do if playing_card:get_id() == 13 then c = c + 1 end end return c end)() == #context.scoring_hand or (function() local c = 0; for _, playing_card in pairs(context.scoring_hand or {}) do if playing_card:get_id() == 14 then c = c + 1 end end return c end)() == #context.scoring_hand then
            return {
                repetitions = card.ability.extra.repetitions0,
                message = localize('k_again_ex'),
                colour = G.C.RED
            }
        end
    end
end
}

SMODS.Joker {
    key = 'perfectsystem',
    config = {
        extra = {
            hand_count_value0 = 3,
            rank_count_count0 = 1,
            Xmult0 = 2.5,
            firstquote = 'We\'re all brothers in a',
            secondquote = 'perfect world'
        }
    },
    loc_txt = {
        ['name'] = 'Perfect System',
        ['text'] = {
            [1] = '{C:inactive,s:0.8}#1#{} {C:red,s:0.8}#2#{}',
            [2] = '{X:red,C:white}X2.5{} Mult if hand {C:attention}contains {}exactly',
            [3] = '1 {C:attention}face {}card and atleast',
            [4] = '2 {C:attention}numbered {}cards'
        }
    },
    pos = {
        x = 0,
        y = 2
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
        local description_result = {
            vars = {
                card and card.ability and card.ability.extra and card.ability.extra['firstquote'] or self and self.config and self.config.extra and self.config.extra['firstquote'] or 'We\'re all brothers in a',
                card and card.ability and card.ability.extra and card.ability.extra['secondquote'] or self and self.config and self.config.extra and self.config.extra['secondquote'] or 'perfect world',
                card and card.ability and card.ability.extra and card.ability.extra['Xmult0'] or self and self.config and self.config.extra and self.config.extra['Xmult0'] or 2.5
            }
        }
        local description_fallback_key = 'j_vanillasauce_perfectsystem'
        local description_fallback_set = 'Joker'
        local description_text_slots = {
            [1] = true,
            [2] = true
        }
        if not (G and G.localization and G.localization.descriptions and type(loc_parse_string) == 'function' and type(description_result.vars) == 'table') then
            return description_result
        end
        local description_key = self and self.key
        if type(description_key) ~= 'string' then description_key = description_fallback_key end
        local description_set = self and self.set
        if type(description_set) ~= 'string' then description_set = description_fallback_set end
        local description_entries = G.localization.descriptions[description_set]
        local description_source = description_entries and description_entries[description_key]
        if type(description_source) ~= 'table' or type(description_source.text) ~= 'table' then
            return description_result
        end
        local description_vars = {}
        for key, value in pairs(description_result.vars) do description_vars[key] = value end
        if description_result.colours then description_vars.colours = description_result.colours end
        description_result.vars = description_vars
        local description_hash_slot = #description_vars + 1
        local description_hash_token = '#' .. description_hash_slot .. '#'
        local function description_normalize_breaks(value)
        return value:gsub('\r\n', '\n'):gsub('\r', '\n'):gsub('%[s%]', '\n'):gsub('<[bB][rR]%s*/?%s*>', '\n')
    end
    local function description_control_state(value, in_control)
    for i = 1, #value do
        local char = value:sub(i, i)
        if char == '{' then in_control = true
    elseif char == '}' or char == '\n' then in_control = false end
    end
    return in_control
end
local function description_insert_text(value, in_control)
local parts = {}
value = description_normalize_breaks(tostring(value))
for i = 1, #value do
    local char = value:sub(i, i)
    if char == '{' then in_control = true
elseif char == '}' or char == '\n' then in_control = false end
    if char == '#' and not in_control then
        description_vars[description_hash_slot] = '#'
        parts[#parts + 1] = description_hash_token
    else
        parts[#parts + 1] = char
    end
end
return table.concat(parts), in_control
end
local function description_expand_line(line)
local parts, start, in_control = {}, 1, false
while true do
    local first, last, index = line:find('#(%d+)#', start)
    if not first then
        parts[#parts + 1] = line:sub(start)
        break
    end
    local prefix = line:sub(start, first - 1)
    parts[#parts + 1] = prefix
    in_control = description_control_state(prefix, in_control)
    local slot = tonumber(index)
    if description_text_slots[slot] and description_vars[slot] ~= nil then
        local inserted
        inserted, in_control = description_insert_text(description_vars[slot], in_control)
        parts[#parts + 1] = inserted
    else
        parts[#parts + 1] = line:sub(first, last)
    end
    start = last + 1
end
return description_normalize_breaks(table.concat(parts))
end
local description_copy = {}
for key, value in pairs(description_source) do description_copy[key] = value end
description_copy.text, description_copy.text_parsed = {}, {}
local description_active_tag = ''
for _, source_line in ipairs(description_source.text) do
    local expanded = description_expand_line(tostring(source_line))
    for line in (expanded .. '\n'):gmatch('(.-)\n') do
        local formatted = line
        if description_active_tag ~= '' and line:sub(1, 1) ~= '{' then
            formatted = description_active_tag .. line
        end
        for tag in line:gmatch('{[^}]*}') do
            description_active_tag = tag == '{}' and '' or tag
        end
        if line:gsub('{[^}]*}', ''):match('^%s*$') then formatted = '{s:1} ' end
        description_copy.text[#description_copy.text + 1] = formatted
        description_copy.text_parsed[#description_copy.text_parsed + 1] = loc_parse_string(formatted)
    end
end
local description_dynamic_key = 'jf_text_variables:' .. description_key
description_entries[description_dynamic_key] = description_copy
description_result.key = description_dynamic_key
description_result.name_key = description_key
return description_result
end,
calculate = function(self, card, context)
    if context.joker_main then
        if #context.scoring_hand >= card.ability.extra.hand_count_value0 and (function() local c = 0; for _, playing_card in pairs(context.scoring_hand or {}) do if playing_card:is_face() then c = c + 1 end end return c end)() == card.ability.extra.rank_count_count0 then
        return {
            Xmult = card.ability.extra.Xmult0
        }
    end
end
end
}

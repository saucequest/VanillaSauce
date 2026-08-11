SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end
-- this function is used to load everything within a folder.-- Jokerforge doesnt use it because it doesnt make loading order easy
local function load_folder(path)
    local files = NFS.getDirectoryItemsInfo(mod_path .. "/" .. path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file(path .. file_name))()
        end
    end
end
-- load the jokers
if true then
    assert(SMODS.load_file("jokers/michaeljokeson.lua"))()
    assert(SMODS.load_file("jokers/jeffthejoker.lua"))()
    assert(SMODS.load_file("jokers/meltingjoker.lua"))()
    assert(SMODS.load_file("jokers/pyramid.lua"))()
    assert(SMODS.load_file("jokers/tomato.lua"))()
    assert(SMODS.load_file("jokers/porchthief.lua"))()
    assert(SMODS.load_file("jokers/aceface.lua"))()
    assert(SMODS.load_file("jokers/skippingpebble.lua"))()
    assert(SMODS.load_file("jokers/omelette.lua"))()
    assert(SMODS.load_file("jokers/thirdeye.lua"))()
end
SMODS.ObjectType({
    key = "vanillasauce_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "vanillasauce_vanilla_jokers",
    cards = {
        ["j_vanillasauce_michaeljokeson"] = true,
        ["j_vanillasauce_jeffthejoker"] = true,
        ["j_vanillasauce_meltingjoker"] = true,
        ["j_vanillasauce_pyramid"] = true
    },
})

SMODS.ObjectType({
    key = "vanillasauce_vanillas_jokers",
    cards = {
        ["j_vanillasauce_tomato"] = true
    },
})

SMODS.ObjectType({
    key = "vanillasauce_vanillasauce_jokers",
    cards = {
        ["j_vanillasauce_porchthief"] = true,
        ["j_vanillasauce_aceface"] = true,
        ["j_vanillasauce_skippingpebble"] = true,
        ["j_vanillasauce_omelette"] = true,
        ["j_vanillasauce_thirdeye"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {} 
    }
end
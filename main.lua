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
JF_GLOBALS = JF_GLOBALS or {}

assert(SMODS.load_file("jokers/michaeljokeson.lua"))()
assert(SMODS.load_file("jokers/jeffthejoker.lua"))()
assert(SMODS.load_file("jokers/meltingjoker.lua"))()
assert(SMODS.load_file("jokers/pyramid.lua"))()
assert(SMODS.load_file("jokers/tomato.lua"))()
assert(SMODS.load_file("jokers/porchthief.lua"))()
assert(SMODS.load_file("jokers/aceface.lua"))()
assert(SMODS.load_file("jokers/skippingpebble.lua"))()
assert(SMODS.load_file("jokers/friedegg.lua"))()
assert(SMODS.load_file("jokers/thirdeye.lua"))()
assert(SMODS.load_file("jokers/thejokerofblue.lua"))()
assert(SMODS.load_file("jokers/pringlesjokerbot.lua"))()
assert(SMODS.load_file("jokers/dustjoker.lua"))()
assert(SMODS.load_file("jokers/corpsejoker.lua"))()
assert(SMODS.load_file("jokers/diamondring.lua"))()
assert(SMODS.load_file("jokers/missingposter.lua"))()
assert(SMODS.load_file("jokers/mafioso.lua"))()
assert(SMODS.load_file("jokers/loopingtheblinds.lua"))()
assert(SMODS.load_file("jokers/flowery.lua"))()
assert(SMODS.load_file("jokers/jevil.lua"))()
assert(SMODS.load_file("jokers/perfectsystem.lua"))()
assert(SMODS.load_file("jokers/omori.lua"))()
assert(SMODS.load_file("jokers/placeholder_joker.lua"))()
assert(SMODS.load_file("jokers/am.lua"))()
SMODS.ObjectType({
    key = 'vanillasauce_food',
    cards = {
        ['j_vanillasauce_friedegg'] = true,
        ['j_vanillasauce_tomato'] = true,
    },
})
SMODS.ObjectType({
    key = 'vanillasauce_jokers',
    cards = {
        ['j_vanillasauce_aceface'] = true,
        ['j_vanillasauce_am'] = true,
        ['j_vanillasauce_corpsejoker'] = true,
        ['j_vanillasauce_diamondring'] = true,
        ['j_vanillasauce_dustjoker'] = true,
        ['j_vanillasauce_flowery'] = true,
        ['j_vanillasauce_friedegg'] = true,
        ['j_vanillasauce_jeffthejoker'] = true,
        ['j_vanillasauce_jevil'] = true,
        ['j_vanillasauce_loopingtheblinds'] = true,
        ['j_vanillasauce_mafioso'] = true,
        ['j_vanillasauce_meltingjoker'] = true,
        ['j_vanillasauce_michaeljokeson'] = true,
        ['j_vanillasauce_missingposter'] = true,
        ['j_vanillasauce_omori'] = true,
        ['j_vanillasauce_perfectsystem'] = true,
        ['j_vanillasauce_placeholder_joker'] = true,
        ['j_vanillasauce_porchthief'] = true,
        ['j_vanillasauce_pringlesjokerbot'] = true,
        ['j_vanillasauce_pyramid'] = true,
        ['j_vanillasauce_skippingpebble'] = true,
        ['j_vanillasauce_thejokerofblue'] = true,
        ['j_vanillasauce_thirdeye'] = true,
        ['j_vanillasauce_tomato'] = true,
    },
})
SMODS.ObjectType({
    key = 'vanillasauce_vanilla_jokers',
    cards = {
        ['j_vanillasauce_jeffthejoker'] = true,
        ['j_vanillasauce_meltingjoker'] = true,
        ['j_vanillasauce_michaeljokeson'] = true,
        ['j_vanillasauce_pyramid'] = true,
    },
})


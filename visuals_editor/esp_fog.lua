local dump_0 = require("ffi")
local dump_1 = entity
local dump_2 = ui
local dump_3 = globals
local dump_4 = bit
local dump_5 = 14
local dump_6 = 100
local dump_7 = {"models/props/de_mirage/towertop_d/towertop_d", "models/props/de_dust/palace_bigdome", "models/props_lighting/", "decals/", "particle/", "de_nuke/nuke_beam_"}
local dump_8 = {"models/props/de_dust/hr_dust/dust_skybox/", "models/props/de_inferno/hr_i/inferno_skybox", "models/props/de_nuke/hr_nuke/nuke_skydome_001",
                "models/props/cs_office/clouds", "skybox/"}

local dump_9 = dump_2.reference("VISUALS", "Effects", "Remove fog")
local dump_10 = dump_2.reference("VISUALS", "Colored models", "Props")
local dump_11 = dump_2.new_checkbox("VISUALS", "Effects", "Override fog")
local dump_12 = dump_2.new_color_picker("VISUALS", "Effects", "Override fog color", 235, 225, 225, 105)
local dump_13 = dump_2.new_slider("VISUALS", "Effects", "\nFog start color", -5000 / dump_6, 15000 / dump_6, 0 / dump_6, true, "", dump_6)
local dump_14 = dump_2.new_slider("VISUALS", "Effects", "\nFog end color", -5000 / dump_6, 15000 / dump_6, 7500 / dump_6, true, "", dump_6)
local dump_15 = dump_2.new_checkbox("VISUALS", "Effects", "Skybox fog")

dump_2.set_visible(dump_13, false)
dump_2.set_visible(dump_14, false)
dump_2.set_visible(dump_15, false)
dump_2.set(dump_15, true)

local dump_16 = vtable_bind("client.dll", "VClientEntityList003", 3, "uintptr_t(__thiscall*)(void*, int)")

cvar.r_disable_distance_fade_on_big_props:set_raw_int(1)
cvar.r_disable_distance_fade_on_big_props_thresh:set_raw_float(500)

local dump_17 = dump_0.cast("intptr_t**", dump_0.cast("char*", client.find_signature("engine.dll", "\xBE\xCC\xCC\xCC̋\x0E\x85\xC9t\v\x8B\x01\xFFP4")) + 1)[0]
local dump_18
local dump_19 = 1
local dump_20 = dump_0.new("uint8_t[4]")
local dump_21 = dump_0.cast("uint32_t*", dump_20)

local function dump_22(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
    dump_20[0] = arg_1_0
    dump_20[1] = arg_1_1
    dump_20[2] = arg_1_2
    dump_20[3] = arg_1_3

    return dump_21[0]
end

local function dump_23(arg_2_0, arg_2_1, arg_2_2)
    return dump_4.bor(arg_2_0, dump_4.lshift(arg_2_1, 8), dump_4.lshift(arg_2_2, 16))
end

local dump_24 = {}

local function dump_25(arg_3_0, arg_3_1, ...)
    dump_24[arg_3_0][arg_3_1] = {dump_1.get_prop(arg_3_0, arg_3_1)}

    dump_1.set_prop(arg_3_0, arg_3_1, ...)
end

local function dump_26()
    for iter_4_0, iter_4_1 in pairs(dump_24) do
        for iter_4_2, iter_4_3 in pairs(iter_4_1) do
            dump_1.set_prop(iter_4_0, iter_4_2, unpack(iter_4_3))
        end
    end

    table.clear(dump_24)
end

local function dump_27(arg_5_0)
    local dump_5_0 = not arg_5_0 and dump_2.get(dump_11)

    for iter_5_0, iter_5_1 in ipairs(dump_7) do
        for iter_5_2, iter_5_3 in ipairs(materialsystem.find_materials(iter_5_1) or {}) do
            iter_5_3:set_material_dump_flag(dump_5, not dump_5_0)

            local dump_5_1 = iter_5_3:get_shader_param("$fogfadeend")

            if dump_5_1 ~= nil and (dump_5_1 == 0 or dump_5_1 > 0.3) then
                iter_5_3:set_shader_param("$fogfadeend", 0.33)
            end

            if iter_5_3:get_shader_param("$fogscale") ~= nil then
                iter_5_3:set_shader_param("$fogscale", 1)
            end

            if iter_5_3:get_shader_param("$vertexfogamount") ~= nil then
                iter_5_3:set_shader_param("$vertexfogamount", 2)
            end
        end
    end

    local dump_5_2 = dump_5_0 and dump_2.get(dump_15)

    for iter_5_4, iter_5_5 in ipairs(dump_8) do
        for iter_5_6, iter_5_7 in ipairs(materialsystem.find_materials(iter_5_5) or {}) do
            iter_5_7:set_material_dump_flag(dump_5, not dump_5_2)
        end
    end

    local dump_5_3 = dump_3.mapname() or ""

    if dump_5_3:find("office") then
        dump_19 = 1.75
    elseif dump_5_3:find("italy") then
        dump_19 = 1.3
    else
        dump_19 = 1
    end
end

local function dump_28()
    local dump_6_0 = dump_1.get_local_player()

    if dump_6_0 == nil then
        return
    end

    local dump_6_1 = 1
    local dump_6_2, dump_6_3, dump_6_4, dump_6_5 = dump_2.get(dump_12)
    local dump_6_6 = dump_23(dump_6_2, dump_6_3, dump_6_4)
    local dump_6_7 = dump_2.get(dump_13) * dump_6 * dump_19
    local dump_6_8 = dump_2.get(dump_14) * dump_6 * dump_19
    local dump_6_9 = dump_6_5 / 255
    local dump_6_10 = dump_4.band(math.max(0, dump_1.get_prop(dump_6_0, "m_PlayerFog.m_hCtrl") or 0), 65535)

    if dump_6_10 > 0 and dump_6_10 < 65535 then
        dump_24[dump_6_10] = {}

        dump_25(dump_6_10, "m_fog.enable", dump_6_1)
        dump_25(dump_6_10, "m_fog.dirPrimary", 0, 0, 0)
        dump_25(dump_6_10, "m_fog.colorPrimary", dump_6_6)
        dump_25(dump_6_10, "m_fog.colorSecondary", dump_6_6)
        dump_25(dump_6_10, "m_fog.start", dump_6_7)
        dump_25(dump_6_10, "m_fog.end", dump_6_8)
        dump_25(dump_6_10, "m_fog.maxdensity", dump_6_9)
        dump_25(dump_6_10, "m_fog.ZoomFogScale", 0)
        dump_25(dump_6_10, "m_fog.HDRColorScale", 1)
        dump_25(dump_6_10, "m_fog.blend", 0)
        dump_25(dump_6_10, "m_fog.duration", 0)
    end

    dump_24[dump_6_0] = {}

    dump_25(dump_6_0, "m_skybox3d.fog.enable", dump_6_1)
    dump_25(dump_6_0, "m_skybox3d.fog.dirPrimary", 0, 0, 0)
    dump_25(dump_6_0, "m_skybox3d.fog.colorPrimary", dump_6_6)
    dump_25(dump_6_0, "m_skybox3d.fog.colorSecondary", dump_6_6)
    dump_25(dump_6_0, "m_skybox3d.fog.start", dump_6_7)
    dump_25(dump_6_0, "m_skybox3d.fog.end", dump_6_8)
    dump_25(dump_6_0, "m_skybox3d.fog.maxdensity", dump_6_9)
    dump_25(dump_6_0, "m_skybox3d.fog.HDRColorScale", 1)
    dump_25(dump_6_0, "m_skybox3d.fog.blend", 0)

    local dump_6_11 = tonumber(dump_17[0])

    if dump_6_11 ~= dump_18 then
        dump_27()

        dump_18 = dump_6_11
    end
end

local function dump_29()
    dump_26()

    if not dump_2.get(dump_11) then
        client.unset_event_callback("pre_render", dump_28)
        client.unset_event_callback("post_render", dump_29)
    end
end

local function dump_30()
    dump_27()
    client.delay_call(0, dump_27)
end

local function dump_31()
    dump_27(true)
end

dump_2.set_callback(dump_11, function()
    local dump_10_0 = dump_2.get(dump_11)

    if dump_10_0 then
        client.set_event_callback("pre_render", dump_28)
        client.set_event_callback("post_render", dump_29)
        client.set_event_callback("level_init", dump_30)
        client.set_event_callback("shutdown", dump_31)
        dump_2.set(dump_9, false)
    else
        client.unset_event_callback("level_init", dump_30)
        client.unset_event_callback("shutdown", dump_31)
    end

    dump_2.set_visible(dump_13, dump_10_0)
    dump_2.set_visible(dump_14, dump_10_0)
    dump_2.set_visible(dump_15, dump_10_0)
    dump_27()
end)
dump_2.set_callback(dump_15, function()
    dump_27()
end)
dump_2.set_callback(dump_10, function()
    dump_27()
end)
dump_2.set_callback(dump_9, function()
    if dump_2.get(dump_9) then
        dump_2.set(dump_11, false)
    end
end)

local materials = {"Default", "Solid", "Shaded", "Metalic", "Glow", "Bubble", "Original"}

local first_person_viewmodel = ui.new_checkbox("VISUALS", "Colored Models", "First person weapon viewmodel")
local first_person_viewmodel_picker = ui.new_color_picker("VISUALS", "Colored Models", "First person weapon viewmodel", 255, 255, 255)
local first_person_viewmodel_material = ui.new_combobox("VISUALS", "Colored Models", "First person material", materials)

local third_person_viewmodel = ui.new_checkbox("VISUALS", "Colored Models", "Third person weapon viewmodel")
local third_person_viewmodel_picker = ui.new_color_picker("VISUALS", "Colored Models", "Third person weapon viewmodel", 255, 255, 255)
local third_person_viewmodel_material = ui.new_combobox("VISUALS", "Colored Models", "Third person material", materials)

local wp_viewmodel, wp_viewmodel_picker, wp_viewmodel_material = ui.reference("VISUALS", "Colored Models", "Weapon viewmodel")
local tp_enabled, tp_bind = ui.reference("VISUALS", "Effects", "Force third person (alive)")

local def_wp_viewmodel, def_wp_viewmodel_picker, def_wp_viewmodel_material = ui.get(wp_viewmodel), {ui.get(wp_viewmodel_picker)}, ui.get(wp_viewmodel_material)
ui.set_visible(wp_viewmodel, false)
ui.set_visible(wp_viewmodel_picker, false)
ui.set_visible(wp_viewmodel_material, false)

client.set_event_callback("paint_ui", function(ctx)
    local local_player = entity.get_local_player()
    if local_player == nil or (not entity.is_alive(local_player)) then
        return
    end

    ui.set_visible(third_person_viewmodel_picker, ui.get(third_person_viewmodel))
    ui.set_visible(third_person_viewmodel_material, ui.get(third_person_viewmodel))

    ui.set_visible(first_person_viewmodel_picker, ui.get(first_person_viewmodel))
    ui.set_visible(first_person_viewmodel_material, ui.get(first_person_viewmodel))

    if ui.get(tp_bind) then
        ui.set(wp_viewmodel, ui.get(third_person_viewmodel))
        ui.set(wp_viewmodel_material, ui.get(third_person_viewmodel_material))
        ui.set(wp_viewmodel_picker, ui.get(third_person_viewmodel_picker))
    else
        ui.set(wp_viewmodel, ui.get(first_person_viewmodel))
        ui.set(wp_viewmodel_material, ui.get(first_person_viewmodel_material))
        ui.set(wp_viewmodel_picker, ui.get(first_person_viewmodel_picker))
    end
end)

defer(function()
    ui.set(wp_viewmodel, def_wp_viewmodel)
    ui.set(wp_viewmodel_picker, def_wp_viewmodel_picker)
    ui.set(wp_viewmodel_material, def_wp_viewmodel_material)
    ui.set_visible(wp_viewmodel, true)
    ui.set_visible(wp_viewmodel_picker, true)
    ui.set_visible(wp_viewmodel_material, true)
end)

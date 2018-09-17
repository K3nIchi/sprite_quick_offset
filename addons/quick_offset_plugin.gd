tool
extends EditorPlugin

var container
var selected_objects

func _enter_tree():
	container = preload("res://addons/sprite_quick_offset/quick_offset.tscn").instance()
	add_control_to_container(CONTAINER_CANVAS_EDITOR_MENU , container)

func _exit_tree():
	remove_control_from_container(CONTAINER_CANVAS_EDITOR_MENU , container)
	container.free()

func _input(event):
	if event.is_pressed():
		selected_objects = get_editor_interface().get_selection().get_selected_nodes()
		container.get_node("EditorScript").set_objects(selected_objects)
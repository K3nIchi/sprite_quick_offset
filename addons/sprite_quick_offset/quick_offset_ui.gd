tool
extends Button

export (NodePath) var popup_path
onready var popup = get_node(popup_path)

func _ready():
	connect("pressed",self,"clicked")

func clicked():
	popup.rect_position = get_viewport().get_mouse_position()
	popup.popup()
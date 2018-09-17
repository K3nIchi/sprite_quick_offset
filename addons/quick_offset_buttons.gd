tool
extends Button
export (int, "top-left","top", "top-right","left","center","right","bottom-left","bottom","bottom-right") var anchor_type
export (NodePath) var root_path
onready var root = get_node(root_path)
func _ready():
	connect("pressed",self,"clicked")

func clicked():
	root.set_quick_offset(anchor_type)
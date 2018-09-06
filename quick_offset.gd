tool
extends Node
var objects = []

func set_quick_offset(anchor):
	for obj in objects.size():
		if objects[obj].get_class() == "Sprite" || objects[obj].get_class() == "AnimatedSprite":
			set_anchor(objects[obj], anchor, objects[obj].get_class())

func set_anchor(object, anchor, type):
	var anc
	var tex = object.texture if type =="Sprite" else object.frames.get_frame(object.animation,0)
	match anchor:
		1: #top
			anc = Vector2(0, tex.get_height()/2)
		2: #top-right
			anc = Vector2(-tex.get_width()/2, tex.get_height()/2)
		3: #left
			anc = Vector2(tex.get_width()/2, 0)
		4: #center
			anc = Vector2(0,0)
		5: #right
			anc = Vector2(-tex.get_width()/2, 0)
		6: #bottom-left
			anc = Vector2(tex.get_width()/2, -tex.get_height()/2)
		7: #bottom
			anc = Vector2(0, -tex.get_height()/2)
		8: #bottom-right
			anc = Vector2(-tex.get_width()/2, -tex.get_height()/2)
		_: #top-left
			anc = Vector2(tex.get_width()/2, tex.get_height()/2)
	object.offset = anc

func set_objects(objs):
	objects = objs

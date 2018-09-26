tool
extends Node

var objects = []

func set_quick_offset(anchor):
	for obj in objects.size():
		if objects[obj].is_class("Sprite") || objects[obj].is_class("AnimatedSprite"):
			set_sprite_anchor(objects[obj], anchor, objects[obj].get_class())
		elif objects[obj].is_class("Control"):
			set_control_anchor(objects[obj], anchor)

func set_sprite_anchor(object, anchor, type):
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
	object.centered = true
	object.offset = anc
	object.property_list_changed_notify()

func set_control_anchor(object, anchor):
	var rect_anc
	match anchor:
		1: #top
			rect_anc = Vector2(object.rect_size.x / 2, 0)
		2: #top-right
			rect_anc = Vector2(object.rect_size.x, 0)
		3: #left
			rect_anc = Vector2(0, object.rect_size.y / 2)
		4: #center
			rect_anc = Vector2(object.rect_size.x / 2, object.rect_size.y / 2)
		5: #right
			rect_anc = Vector2(object.rect_size.x, object.rect_size.y / 2)
		6: #bottom-left
			rect_anc = Vector2(0, object.rect_size.y)
		7: #bottom
			rect_anc = Vector2(object.rect_size.x / 2, object.rect_size.y)
		8: #bottom-right
			rect_anc = Vector2(object.rect_size.x, object.rect_size.y)
		_: #top-left
			rect_anc = Vector2(0, 0)
	object.rect_pivot_offset = rect_anc
	object.property_list_changed_notify()

func set_objects(objs):
	objects = objs

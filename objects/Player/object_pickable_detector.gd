extends Node

@onready var object_checker:RayCast3D = %object_checker
@onready var weapon_holder:Node3D = %weapon_holder
@onready var item_holder:Node3D = %item_holder

func _unhandled_input(event):
	if event.is_action_pressed("interact") and object_checker.is_colliding():
		var object = object_checker.get_collider()
		if object is pickable_object:
			if object.entity_type == "Weapon":
				object.instance_object_to_player(weapon_holder)
			elif object.entity_type == "Item":
				object.instance_object_to_player(item_holder)
		else:
			printerr("this should not happen")

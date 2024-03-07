class_name pickable_object
extends Node
signal sleep_object
@export_enum("Weapon", "Item") var entity_type: String
@export var object:PackedScene
var is_pickable:bool = true

func instance_object_to_player(parent:Node3D):
	if is_pickable:
		sleep_object.emit()
		owner.reparent(parent, false)
		owner.transform = parent.transform
		is_pickable = false

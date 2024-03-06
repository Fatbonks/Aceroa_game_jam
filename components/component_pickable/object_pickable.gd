class_name pickable_object
extends Node

@export_enum("Weapon", "Item") var entity_type: String
@export var object:PackedScene

func instance_object_to_player(parent:Node3D):
	var inst:Node3D = object.instantiate()
	parent.add_child(inst)
	owner.queue_free()

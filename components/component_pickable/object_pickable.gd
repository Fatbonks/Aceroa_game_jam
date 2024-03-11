class_name pickable_object
extends Node
signal sleep_object
signal is_in_player_hands
@export_enum("Weapon", "Item") var entity_type: String

func instance_object_to_player(parent:Node3D):
	var amount:Array[Node] = parent.get_children()
	if len(amount) <= 2:
		if len(amount) > 0:
			owner.visible = false 
		sleep_object.emit()
		owner.reparent(parent, false)
		owner.transform = parent.transform
		owner.global_position = parent.global_position
		is_in_player_hands.emit()

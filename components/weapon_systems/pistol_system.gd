extends Node
signal throw_weapon

func _unhandled_input(event):
	if event.is_action_pressed("throw_weapon") and owner.visible == true:
		owner.reparent(get_tree().root, true)
		throw_weapon.emit()

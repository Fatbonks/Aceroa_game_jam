extends Node
signal throw_weapon
signal stop_rigid
var active = false
func _ready():
	if owner.get_parent() is weaponHolder:
		await get_tree().create_timer(0.1).timeout
		active = true
		stop_rigid.emit()
func _unhandled_input(event):
	if event.is_action_pressed("throw_weapon") and owner.visible == true and active:
		throw_weapon.emit()
		active = false

func is_active():
	active = true

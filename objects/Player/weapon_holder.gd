class_name weaponHolder
extends Node3D

var weapon_list: Array[Node]
var current_weapon: int

func _unhandled_input(event):
	if event.is_action_pressed("scroll_up"):
		weapon_list = get_children()
		if len(weapon_list) > 0:
			weapon_list[current_weapon].visible = false
			current_weapon += 1
			if current_weapon > len(weapon_list) - 1:
				weapon_list[current_weapon - 1].visible = false
				current_weapon = 0
				weapon_list[current_weapon].visible = true
			else:
				weapon_list[current_weapon - 1].visible = false
				weapon_list[current_weapon].visible = true
	elif event.is_action_pressed("scroll_down"):
		weapon_list = get_children()
		if len(weapon_list) > 0:
			weapon_list[current_weapon].visible = false
			current_weapon -= 1
			if current_weapon < 0:
				weapon_list[current_weapon + 1].visible = false
				current_weapon = len(weapon_list) - 1
				weapon_list[current_weapon].visible = true
			else:
				weapon_list[current_weapon + 1].visible = false
				weapon_list[current_weapon].visible = true

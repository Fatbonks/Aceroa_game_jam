class_name itemHolder
extends Node3D

var item_list: Array[Node]
var current_item: int

func _unhandled_input(event):
	if event.is_action_pressed("switch_item"):
		item_list = get_children()
		if len(item_list) > 0:
			item_list[current_item].visible = false
			current_item += 1
			if current_item > len(item_list) - 1:
				item_list[current_item - 1].visible = false
				current_item = 0
				item_list[current_item].visible = true
			else:
				item_list[current_item - 1].visible = false
				item_list[current_item].visible = true

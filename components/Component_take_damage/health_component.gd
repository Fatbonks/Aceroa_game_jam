extends Node
signal death_animation
signal hit_animation
@export_category("object stats")
@export var max_health: int

var health:int

func _ready():
	health = max_health
	
func take_damage(damage:int):
	health -= damage
	if health <= 0:
		death_animation.emit()
	else:
		hit_animation.emit()
		
func destroy_object():
	owner.queue_free()
	


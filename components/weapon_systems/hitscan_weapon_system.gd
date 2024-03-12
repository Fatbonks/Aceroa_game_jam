extends Node
signal reload
# determines how much ammo and reserve a gun can have
@export_category("Weapon Stats")
@export var weapon_range:int = -10
@export var damage:int
@export var max_clip:int
@export var max_mag:int
@export var fire_rate:float
@export_subgroup("reload stats")
@export var reload_time:int
@onready var bullets_range:RayCast3D = %bullets_range
@export_subgroup("weapon functions")
@export var is_auto:bool
@export var can_burst:bool
@export_subgroup("burst functions")
@export var burst_bullet_amount: int
@export var burst_time_between_bullet: float

# internal stats
var current_ammo:int
var current_mag:int
var is_reloading:bool
var is_shooting:bool
var has_falloff:bool
# Called when the node enters the scene tree for the first time.
func _ready():
	current_ammo = max_clip
	current_mag = max_mag
	bullets_range.target_position.z = weapon_range


func _process(delta):
	if Input.is_action_pressed("shoot") and is_auto and !check_state():
		shoot_weapon()
	elif Input.is_action_just_pressed("shoot") and !is_auto and !check_state():
		shoot_weapon()
	
func reload_weapon():
	if current_ammo >= max_clip or current_mag <= 0 or is_reloading or is_shooting:
		return
	is_reloading = true
	await get_tree().create_timer(reload_time).timeout
	is_reloading = false
	current_ammo = max_clip
	current_mag -= 1
	reload.emit()

func shoot_weapon() -> void:
	is_shooting = true
	if bullets_range.is_colliding() == false:
		return
	var object = bullets_range.get_collider()
	if object is Hitbox:
		damage = calulate_falloff()
		if can_burst:
			for i in range(burst_bullet_amount):
				await get_tree().create_timer(burst_time_between_bullet).timeout
				object.take_damage(damage)
		else:
			object.take_damage(damage)
	await get_tree().create_timer(fire_rate).timeout
	is_shooting = false

func calulate_falloff() -> int:
	if !has_falloff:
		return damage
	var falloff_damage:int
	return falloff_damage
	
func check_state() -> bool:
	if is_shooting or is_reloading:
		return true
	return false

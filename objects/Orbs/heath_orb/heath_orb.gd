class_name health_orb
extends RigidBody3D
@onready var orb:MeshInstance3D = $Orb
@onready var collision_shape_3d:CollisionShape3D = %CollisionShape3D
var change_health: float

func _unhandled_input(event):
	if event.is_action_pressed("use_item") and visible == true:
		update_health(randi_range(0, 100))

func update_health(health:int):
	var tween = create_tween()
	change_health = remap(health, 0, 100, 1, 0)
	var shader:ShaderMaterial = orb.get_active_material(0)
	var health_value:float = shader.get_shader_parameter("health_life")
	tween.tween_method(set_shader_value, health_value, change_health, 1)
	
func set_shader_value(value: float):
	orb.get_active_material(0).set_shader_parameter("health_life", value)
	
func set_to_sleep():
	freeze = true
	collision_shape_3d.disabled = true
	position = Vector3.ZERO

func set_to_awake():
	reparent(get_tree().root, true)
	freeze = false
	collision_shape_3d.disabled = false
	apply_impulse(-transform.basis.z * 10, -transform.basis.z)

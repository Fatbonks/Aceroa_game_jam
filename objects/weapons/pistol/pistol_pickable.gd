extends RigidBody3D

@onready var collision_shape_3d:CollisionShape3D = %CollisionShape3D

func set_to_sleep():
	freeze = true
	collision_shape_3d.disabled = true

func set_to_awake():
	freeze = false
	collision_shape_3d.disabled = false
	apply_impulse(-transform.basis.z * 20, -transform.basis.z)
	  

extends RigidBody2D

func _physics_process(delta):
	var vector = global_transform.origin - $"../Arm2".object_grabbed.global_transform.origin

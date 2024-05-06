extends RayCast2D


func _process(delta):
	$Sprite2D.global_position = get_collision_point()

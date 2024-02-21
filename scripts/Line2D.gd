extends Line2D

@export var first_target : NodePath
@export var second_target : NodePath

var target1 : Node2D
var target2 : Node2D



func _process(delta: float) -> void:
	if first_target:
		target1 = get_node(first_target)
	if second_target:
		target2 = get_node(second_target)
	
	points = [ Vector2.ZERO, Vector2.ZERO ]
	if is_instance_valid(target1) and is_instance_valid(target2):
		points[0] = to_local(target1.global_position)
		points[1] = to_local(target2.global_position)

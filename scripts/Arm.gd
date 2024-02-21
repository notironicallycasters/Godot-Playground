extends RigidBody2D

#Flags
@export var activated = false
@export var togglable = true
var object

func _physics_process(delta):
	#Turn on or off
	if activated:
		if is_instance_valid(object):
			get_child(get_child_count()-2).node_b = object.get_path()
	else:
		get_child(get_child_count()-2).node_b = NodePath()


func _on_area_2d_body_entered(body):
	if not "Godot" in str(body.get_parent()) and not body is StaticBody2D:
		object = body

func _on_area_2d_body_exited(body):
	if not "Godot" in str(body.get_parent()) and not body is StaticBody2D:
		object = null

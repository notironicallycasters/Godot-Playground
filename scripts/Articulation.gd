extends PinJoint2D

@onready var Blood = $GPUParticles2D

var part = str(node_a)

func _physics_process(delta):
	part = part.trim_prefix("../")
	if not get_parent().has_node(part):
		get_parent().get_child(0).dead = true
		Blood.emitting = true

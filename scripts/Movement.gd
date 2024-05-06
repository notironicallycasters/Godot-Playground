extends RigidBody2D

@onready var body1 = $"../Body1"
@onready var body2 = $"../Body2"

func _process(delta):
	if Input.is_action_pressed("Q"):
		linear_velocity.x = -2000
	elif Input.is_action_pressed("D"):
		linear_velocity.x = 2000
	else:
		linear_velocity.x = 0
		body1.linear_velocity.x = 0
		body2.linear_velocity.x = 0
	if Input.is_action_just_pressed("W"):
		linear_velocity.y += -4000

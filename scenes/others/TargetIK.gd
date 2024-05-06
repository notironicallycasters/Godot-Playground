extends Node2D

@onready var Helper = $"../TargetHelper"
@onready var timer = $Timer
@onready var body = $"../.."

@export var turn = false

func _physics_process(delta):
	if abs(body.linear_velocity.x) > 0 and turn:
		position.y -= 40
	else:
		position.y = 0
func _on_timer_timeout():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "global_position", Helper.global_position, 0.1)
	if name == "Target2":
		timer.wait_time =  0.3
	turn = !turn
	

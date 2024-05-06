extends RigidBody2D

#Legs Raycasts
@onready var Leg1 = $"../Leg2/RayCast2D"
@onready var Leg2 = $"../Leg4/RayCast2D"
@onready var Leg3 = $"../Leg2/RayCast2D2"
@onready var Leg4 = $"../Leg4/RayCast2D2"
@onready var Leg5 = $"../Leg2/RayCast2D3"
@onready var Leg6 = $"../Leg4/RayCast2D3"

@export var dead = false

var process_death = false
	
func _process(_delta):
	if dead:
		gravity_scale = 1
	if is_instance_valid(Leg1) or is_instance_valid(Leg2) or is_instance_valid(Leg3) or is_instance_valid(Leg4)or is_instance_valid(Leg5) or is_instance_valid(Leg6):
		if Leg1.is_colliding() or Leg2.is_colliding() or Leg3.is_colliding() or Leg4.is_colliding()or Leg5.is_colliding() or Leg6.is_colliding():
			if not dead:
				gravity_scale = -20.5
	else:
			gravity_scale = 1


func _on_timer_timeout():
	process_death = true

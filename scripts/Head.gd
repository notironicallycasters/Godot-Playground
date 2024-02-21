extends RigidBody2D

#Legs Raycasts
@onready var Leg1 = $"../Leg2/RayCast2D"
@onready var Leg2 = $"../Leg4/RayCast2D"
@onready var Leg3 = $"../Leg2/RayCast2D2"
@onready var Leg4 = $"../Leg4/RayCast2D2"
@onready var Leg5 = $"../Leg2/RayCast2D3"
@onready var Leg6 = $"../Leg4/RayCast2D3"
@onready var Neck = $"../PinJoint2D"

@export var dead = false
	
func _process(delta):
	if dead:
		gravity_scale = 1
	if Leg1.is_colliding() or Leg2.is_colliding() or Leg3.is_colliding() or Leg4.is_colliding()or Leg5.is_colliding() or Leg6.is_colliding():
		if not dead:
			gravity_scale = -20.5
	else:
			gravity_scale = 1
		
	if not is_instance_valid($"../Body1"):
		dead = true

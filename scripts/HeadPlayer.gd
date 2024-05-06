extends RigidBody2D

#Legs Raycasts
@onready var Leg1 = $"../Leg2/RayCast2D"
@onready var Leg2 = $"../Leg4/RayCast2D"
@onready var Leg3 = $"../Leg2/RayCast2D2"
@onready var Leg4 = $"../Leg4/RayCast2D2"
@onready var Leg5 = $"../Leg2/RayCast2D3"
@onready var Leg6 = $"../Leg4/RayCast2D3"
@onready var Helper = $HeadRotationHelper

@export var dead = false

var process_death = false
	
func _process(_delta):
	pass

func _on_timer_timeout():
	process_death = true

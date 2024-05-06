extends RigidBody2D

@onready var head = $"../Head"
@onready var body1 = $"../Body1"
@onready var body2 = $"../Body2"
@onready var body3 = $"../Body3"
@onready var leg1 = $"../Leg1"
@onready var leg2 = $"../Leg2"
@onready var leg3 = $"../Leg3"
@onready var leg4 = $"../Leg4"
# Called when the node enters the scene tree for the first time.
func _ready():
	add_collision_exception_with(head)
	add_collision_exception_with(body1)
	add_collision_exception_with(body2)
	add_collision_exception_with(body3)
	if name in "Leg3" or name in "Leg4":
		add_collision_exception_with(leg1)
		add_collision_exception_with(leg2)
	else:
		add_collision_exception_with(leg3)
		add_collision_exception_with(leg4)

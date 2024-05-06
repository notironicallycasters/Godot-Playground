extends RigidBody2D

@onready var head = $"../Head"
@onready var body1 = $"../Body1"
@onready var body2 = $"../Body2"
@onready var body3 = $"../Body3"
@onready var arm1 = $"../Arm1"
@onready var arm2 = $"../Arm2"
@onready var arm3 = $"../Arm3"
@onready var arm4 = $"../Arm4"
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
	if name in "Arm4":
		add_collision_exception_with(arm1)
		add_collision_exception_with(arm2)
	

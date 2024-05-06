extends RigidBody2D

#Flags
@export var activated = false
@export var togglable = true
var object

@onready var head = $"../Head"
@onready var body1 = $"../Body1"
@onready var body2 = $"../Body2"
@onready var body3 = $"../Body3"
@onready var arm1 = $"../Arm1"
@onready var arm2 = $"../Arm2"
@onready var arm3 = $"../Arm3"
@onready var arm4 = $"../Arm4"
# Called when the node enters the scene tree for the first time.
func _ready():
	add_collision_exception_with(head)
	add_collision_exception_with(body1)
	add_collision_exception_with(body2)
	add_collision_exception_with(body3)
	if name in "Arm3" or name in "Arm4":
		add_collision_exception_with(arm1)
		add_collision_exception_with(arm2)
	else:
		add_collision_exception_with(arm3)
		add_collision_exception_with(arm4)

func _physics_process(_delta):
	#Turn on or off
	if activated:
		if is_instance_valid(object):
			get_child(4).node_b = object.get_path()
	else:
		get_child(4).node_b = NodePath()


func _on_area_2d_body_entered(body):
	if not "Godot" in str(body.get_parent()) and not body is StaticBody2D and not activated:
		object = body

func _on_area_2d_body_exited(body):
	if not "Godot" in str(body.get_parent()) and not body is StaticBody2D and not activated:
		object = null

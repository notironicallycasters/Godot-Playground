extends Node2D

#Objects and position
var pos1 = Vector2.ZERO
var pos2 = Vector2.ZERO
var obj1 = null
var obj2 = null
var currentobj = Object

#Joints path
var pinpath = preload("res://scenes/joints/pinjoint2d.tscn")
var springpath = preload("res://scenes/joints/springjoint2d.tscn")
var groovepath = preload("res://scenes/joints/groovejoint2d.tscn")
var weldpath = preload("res://scenes/joints/weldjoint2d.tscn")

func _process(_delta):
	#If pin is selected
	if get_parent().get_node("UI/ToolList").selected == 1:
		#Go to mouse cursor
		position = get_global_mouse_position()
		#Get first object/position
		if Input.is_action_just_pressed("left_click"):
			obj1 = currentobj
			pos1 = get_global_mouse_position()
		#Get second object/position
		if Input.is_action_just_released("left_click"):
			obj2 = currentobj
			pos2 = get_global_mouse_position()
			#Create the joint in the right position and associate the object
			if is_instance_valid(obj1) and is_instance_valid(obj2):
				if obj1 is RigidBody2D and obj2 is RigidBody2D and not obj1 == obj2:
					var pin = pinpath.instantiate()
					obj1.add_child(pin)
					pin.global_position = (pos1+pos2)/2
					pin.node_a = obj1.get_path()
					pin.node_b = obj2.get_path()
	if get_parent().get_node("UI/ToolList").selected == 2:
		#Go to mouse cursor
		position = get_global_mouse_position()
		#Get first object/position
		if Input.is_action_just_pressed("left_click"):
			obj1 = currentobj
			pos1 = get_global_mouse_position()
		#Get second object/position
		if Input.is_action_just_released("left_click"):
			obj2 = currentobj
			pos2 = get_global_mouse_position()
			#Create the joint in the right position and associate the object
			if obj1 is RigidBody2D and obj2 is RigidBody2D and not obj1 == obj2:
				var weld = weldpath.instantiate()
				obj1.add_child(weld)
				weld.global_position = (pos1+pos2)/2
				weld.node_a = obj1.get_path()
				weld.node_b = obj2.get_path()
				
#Get the object
func _on_area_2d_body_entered(body):
	if not get_parent().get_node("UI/ToolList").selected == 0 and body is RigidBody2D and body != currentobj:
		currentobj = body



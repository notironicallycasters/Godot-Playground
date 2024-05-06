extends CharacterBody2D

var is_there_object = false
var object = Object
var axis_lock = false
var freeze = false
var selected_path
var deleted = false
var was_axis_lock = false
var flip = false
var hide = false


func _process(_delta):
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()
	#If drag is selected
	if get_parent().get_node("UI/ToolList").selected == 0:
		#Go to mouse cursor
		position = get_global_mouse_position()
		#Drag the object
		if Input.is_action_pressed("left_click") and is_there_object and not deleted and is_instance_valid(object):
			$PinJoint2D.node_b = object.get_path()
			#Rotation
			if Input.is_action_pressed("Q"):
				if axis_lock:
					was_axis_lock = true
				object.angular_velocity = -2
				axis_lock = false
			if Input.is_action_pressed("D"):
				if axis_lock:
					was_axis_lock = true
				object.angular_velocity = 2
				axis_lock = false
			if Input.is_action_just_released("Q") or Input.is_action_just_released("D"):
				if was_axis_lock :
					axis_lock = true
			#Activation
			if Input.is_action_just_pressed("right_click") and "activated" in object:
				if object.togglable and not object.activated:
					object.activated = true
				elif object.togglable and object.activated:
					object.activated = false
			elif Input.is_action_pressed("right_click") and "activated" in object:
				if not object.togglable:
					object.activated = true
			else:
				if "activated" in object and not object.togglable:
					object.activated = false
			#Rotation lock
			if Input.is_action_just_pressed("S"):
				axis_lock = !axis_lock
			#Freezing
			if Input.is_action_just_pressed("F"):
				freeze = !freeze
			#Delete
			if Input.is_action_pressed("Del"):
				$PinJoint2D.node_b = NodePath()
				deleted = true
				is_there_object = false
				object.queue_free()
			#Flipping
			if Input.is_action_just_pressed("A"):
				flip = !flip
			object.lock_rotation = axis_lock
			if "flipped" in object:
				object.flipped = flip
			object.freeze = freeze
		else:
			#Dropping
			axis_lock = false
			freeze = false
			flip = false
			$PinJoint2D.node_b = NodePath()
		if Input.is_action_just_released("left_click"):
			deleted = false
			#Deactivate object when dropped
			if "activated" in object and not object.togglable:
					object.activated = false
		#Spawning
		if Input.is_action_just_released("E") and not selected_path == null:
			var selected = selected_path.instantiate()
			get_tree().root.add_child(selected)
			selected.global_position = global_position

#Set the object
func _on_area_2d_body_entered(body):
	if body is RigidBody2D and not Input.is_action_pressed("left_click"):
		object = body
		is_there_object = true

func _on_area_2d_body_exited(body):
	if body is RigidBody2D and not Input.is_action_pressed("left_click"):
		object = Object
		is_there_object = false

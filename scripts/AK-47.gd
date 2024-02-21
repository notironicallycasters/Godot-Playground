extends RigidBody2D

#Flags
@export var activated = false
@export var togglable = false
@export var flipped = false


var fired = false

#Childs
@onready var timer = $Timer
@onready var Light = $Light
@onready var Raycast = $RayCast2D


func _physics_process(delta):
	#Shooting
	if activated:
		timer.paused = false
	else:
		timer.paused = true
		Light.visible = false
		Raycast.enabled = false
	#Stay flipped
	if flipped:
		scale.x = -1
	if not flipped:
		scale.x = 1
	if Raycast:
		pass
	#Killing ragdoll
		if Raycast.is_colliding():
			if "dead" in Raycast.get_collider().get_parent().get_child(0):
				Raycast.get_collider().get_parent().get_child(0).dead = true
		
func _on_timer_timeout():
	#Switch between on and off
	if fired:
		Light.visible = true
		Raycast.enabled = true
		fired = false
	elif not fired:
		Light.visible = false
		Raycast.enabled = false
		fired = true

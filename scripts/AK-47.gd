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
@onready var Particles = $CPUParticles2D
@onready var Shooting = $Shooting


func _physics_process(delta):
	#Shooting
	if activated:
		Particles.emitting = true
		timer.paused = false
	else:
		Particles.emitting = false
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
		Shooting.play()
		Shooting.pitch_scale = randf_range(0.9,1.2)
		fired = false
	elif not fired:
		Light.visible = false
		Raycast.enabled = false
		fired = true

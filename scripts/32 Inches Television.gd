extends RigidBody2D

#Flags
@export var activated = false
@export var togglable = true

#Childs
@onready var video = $Frame/VideoStreamPlayer
@onready var audio = $Frame/Audio


func _physics_process(delta):
	#Turn on or off
	if activated:
		if not video.is_playing():
			audio.play()
			video.play()
	else:
		video.stop()
		audio.stop()

extends Node2D

@export var icon = Texture2D
@export_multiline var description = ""
@export var spawn_sound = AudioStream
@export var impact_sound = AudioStream

@onready var impact_player = $AudioStreamPlayer2D
@onready var text = $Velocity

func _ready():
	if is_instance_valid(impact_player):
		impact_player.stream = impact_sound

func _input(event):
	if event.is_action_pressed("X"):
		get_parent().queue_free()

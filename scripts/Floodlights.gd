extends Timer

@onready var lightoff = $"../LightOff"
@onready var floodlights = $"../AudioStreamPlayer"

func _on_timeout():
	lightoff.visible = false
	floodlights.play()

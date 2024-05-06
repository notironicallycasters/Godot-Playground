extends Label


func _physics_process(_delta):
	#Get FPS and diplay it
	text = "FPS: "+str(Engine.get_frames_per_second())

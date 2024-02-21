extends Label


func _physics_process(delta):
	#Get FPS and diplay it
	text = "FPS: "+str(Engine.get_frames_per_second())

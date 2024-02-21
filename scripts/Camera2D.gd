extends Camera2D

var target_zoom = 2
const MIN_ZOOM = 0.002
const MAX_ZOOM = 1000.0
const ZOOM_INCREMENT = 0.05
const ZOOM_RATE = 8.0



func _unhandled_input(event):
	#Panning
	if event is InputEventMouseMotion:
		if event.button_mask == MOUSE_BUTTON_MASK_MIDDLE:
			position -= event.relative * 10
	#Zoom
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom_out()
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom_in()

func zoom_in():
	target_zoom = max(target_zoom - ZOOM_INCREMENT, MIN_ZOOM)
	set_physics_process(true)
	
func zoom_out():
	target_zoom = min(target_zoom + ZOOM_INCREMENT, MAX_ZOOM)
	set_physics_process(true)
	
func _physics_process(delta):
	zoom = lerp(zoom,target_zoom * Vector2.ONE,ZOOM_RATE * delta)
	set_physics_process(not is_equal_approx(zoom.x, target_zoom))

extends CanvasLayer




func _ready():
	set_visible(false)

func _input(event):
	
	if event.is_action_pressed("ui_cancel"): # escape button by default
		set_visible(!get_tree().paused) # if not pause then hide
		get_tree().paused = !get_tree().paused # toggle pause status


func _on_Continuar_pressed():
	get_tree().paused = false
	set_visible(false)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass # Replace with function body.


	
func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible


func _on_Fullscreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen


extends Control

@onready var game = $"../"
@onready var pauseMenu = $"."

	
func _process(_delta):
	var camera = get_parent().get_node("Player").get_node("Camera")
	pauseMenu.set_global_position(camera.global_position)
	
func _on_resume_pressed():
	game.pause()

func _on_quit_pressed():
	get_tree().quit()

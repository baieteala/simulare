extends Control

@onready var game = $"../"

func _on_resume_pressed():
	game.pause()

func _on_quit_pressed():
	get_tree().quit()
	

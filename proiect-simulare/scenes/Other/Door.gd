extends Area2D

class_name Door

@export var destination: String

func _on_body_entered(body):
	if body is Player:
		GlobalVariables.goToRoom(destination)

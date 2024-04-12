extends Character
class_name Enemy

var path: PackedVector2Array

@onready var navigation: NavigationAgent2D = get_node("NavigationAgent2D")
@onready var player: CharacterBody2D = get_tree().current_scene.get_node("Player")

func chase() -> void:
	if path:
		var vectorToNextPoint: Vector2 = path[0] - global_position
		var distanceToNextPoint: float = vectorToNextPoint.length()
		
		if distanceToNextPoint < 1:
			path.remove_at(0)
			if not path:
				return 
		
		movingDirection = vectorToNextPoint

		if vectorToNextPoint.x > 0 and animated_sprite.flip_h:
			animated_sprite.flip_h = false
		elif vectorToNextPoint.x < 0 and not animated_sprite.flip_h:
			animated_sprite.flip_h = true


func _on_PathTimer_timeout() -> void:
	path = navigation.get_simple_path(global_position, player.position)
	

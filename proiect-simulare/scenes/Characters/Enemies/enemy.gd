extends Character
class_name Enemy

@onready var player: CharacterBody2D = get_tree().current_scene.get_node("Player")
@onready var navigation := $NavigationAgent2D as NavigationAgent2D

const DAMAGE_AMOUNT: int = 10  # Adjust damage amount as needed
const speed = 35

func chase() -> void:
	if(player != null):
		navigation.target_position = player.global_position
	
func _physics_process(_delta: float):
	var dir = to_local(navigation.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()	


func _on_path_timer_timeout():
	chase()

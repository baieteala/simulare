extends Node2D

var orc_scene = preload("res://scenes/Characters/Enemies/Orc/orc.tscn")
var time_passed : float = 0
@onready var game = get_tree().get_current_scene()
@onready var camera = game.get_node("Player").get_node("Camera")
@onready var thisRoom = $"."
# Called when the node enters the scene tree for the first time.
func _ready():
	print(GlobalVariables.num_of_enemies)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
func _physics_process(delta):
	pass

func spawn_enemy():
	var camera_position = camera.global_position
	var orc := orc_scene.instantiate()
	orc.position = Vector2(randf_range(0,480),randf_range(0,270))
	game.add_child(orc)
	GlobalVariables.num_of_enemies += 1


func _on_timer_timeout():
	time_passed += GlobalVariables.timer.time_left
	if time_passed <= 30:
		spawn_enemy()
	else:
		GlobalVariables.timer.stop()

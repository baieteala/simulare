extends Node2D

var orc_scene = preload("res://scenes/Characters/Enemies/Orc/orc.tscn")
var number_of_enemies := 0
var time_passed : float = 0
@onready var game = get_parent()
@onready var thisRoom = $"."
# Called when the node enters the scene tree for the first time.
func _ready():
	print(GlobalVariables.num_of_enemies)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	# easter egg :)))))d
	# ui_select = spacebar
	if event.is_action("ui_select") and event.is_pressed():
		var orc := orc_scene.instantiate()
		orc.position = Vector2(randf_range(0,500),100)
		game.add_child(orc)
		GlobalVariables.num_of_enemies += 2
		
func _physics_process(delta):
	pass

func spawn_enemy():
	# putem sa spawnam altfel cand om avea si alti monstrii :)))
	var orc := orc_scene.instantiate()
	orc.position = Vector2(randf_range(0,500),100)
	thisRoom.add_child(orc)
	GlobalVariables.num_of_enemies += 1


func _on_timer_timeout():
	var timer = get_parent().get_node("Timer")
	time_passed += timer.time_left
	if time_passed <= 30:
		spawn_enemy()
	else:
		timer.stop()

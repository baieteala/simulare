extends Node2D

@onready var pause_menu = $PauseMenu
@onready var game = $"."

var state = false
var room
var time_passed : float = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("pause"):
		pause()
		
func _ready():
	GlobalVariables.timer = get_node("Timer")
	GlobalVariables.timer.start()

func reset_time_passed():
	time_passed = 0
	
func pause():
	if state:
		#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		pause_menu.hide()
		get_tree().paused = false
		state = false
	else:
		#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = true
		pause_menu.show()
		state = true
		
func _on_timer_timeout():
	time_passed += GlobalVariables.timer.time_left
	if time_passed <= 30:
		if game.get_node("EntryRoom") != null:
			room = game.get_node("EntryRoom").name
		elif game.get_node("SecondRoom") != null:
			room = game.get_node("SecondRoom").name
		elif game.get_node("BossRoom") != null:
			room = game.get_node("BossRoom").name
		SpawnEnemy.spawn_enemy(room)
	else:
		GlobalVariables.timer.stop()
		self.reset_time_passed()

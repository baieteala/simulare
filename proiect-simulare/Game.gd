extends Node2D

@onready var pause_menu = $PauseMenu
var state = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("pause"):
		pause()
		
func _ready():
	GlobalVariables.timer = get_node("Timer")
	GlobalVariables.timer.start()
	
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

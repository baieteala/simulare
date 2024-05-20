extends Node2D

@onready var pause_menu = $PauseMenu
@onready var game = $"."
@onready var firstRoomLabel = $LabelFirstRoom
@onready var secondRoomLabel = $LabelSecondRoom
@onready var thirdRoomLabel = $LabelThirdRoom
@onready var game_over = $GameOver
@onready var you_win = $YouWin
var state = false
var room
var time_passed : float = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("pause"):
		pause()
	if GlobalVariables.room == 1:
		secondRoomLabel.hide()
		thirdRoomLabel.hide()
		if GlobalVariables.enemies_spawned_room_one >= 12 and GlobalVariables.enemies_remaining_room_one <= 0:
			firstRoomLabel.show()
	elif GlobalVariables.room == 2:
		firstRoomLabel.hide()		
		if GlobalVariables.enemies_spawned_room_two >= 6 and GlobalVariables.enemies_remaining_room_two <= 0:
			secondRoomLabel.show()
	elif GlobalVariables.room == 3:
		secondRoomLabel.hide()		
		if GlobalVariables.boss_alive == 0:
			thirdRoomLabel.show()
		
func _ready():
	game_over.visible = false
	you_win.visible = false
	firstRoomLabel.hide()
	secondRoomLabel.hide()
	thirdRoomLabel.hide()
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
	if time_passed <= 30 and GlobalVariables.room != 3:
		if game.get_node("EntryRoom") != null:
			room = game.get_node("EntryRoom").name
		elif game.get_node("SecondRoom") != null:
			room = game.get_node("SecondRoom").name
		SpawnEnemy.spawn_enemy(room)
	else:
		GlobalVariables.timer.stop()
		self.reset_time_passed()

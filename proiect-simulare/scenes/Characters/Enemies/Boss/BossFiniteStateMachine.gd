extends FiniteStateMachine

func _init() -> void:
	_add_state("run")
	_add_state("hurt")
	_add_state("dead")
	
func _ready() -> void:
	set_state(states.run)

#func _state_logic(_delta: float) -> void:
	#if state == states.run:
		#parent.chase()
		#parent.move()
	

func _get_transition() -> int:
	if state == states.hurt:
		if not animation_player.is_playing():
			return states.run
	return -1
	

func _enter_state(_previous_state: int, _new_state: int) -> void:
	if _new_state == states.run:
		animation_player.play("run")
	if _new_state == states.hurt:
		animation_player.play("hurt")
	if _new_state == states.dead:
		animation_player.play("dead")
		#GlobalVariables.enemies_remaining_room_one -= 1
		#print("Au mai ramas: ", GlobalVariables.enemies_remaining_room_one)
		#print("Sunt in total: ", GlobalVariables.enemies_spawned_room_one)


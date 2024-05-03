extends FiniteStateMachine

func _init() -> void:
	_add_state("idle")
	_add_state("move")
	_add_state("dead")
	_add_state("hurt")

func _ready() -> void:
	set_state(states.idle)
	

func _state_logic(_delta: float) -> void:
	if state == states.idle or state == states.move:
		parent.player_input()
	#parent.move()
	

func _get_transition() -> int:
	if state == states.idle:
		if parent.velocity.length() > 10:
			return states.move
	if state == states.move:
		if parent.velocity.length() < 10:
			return states.idle
	if state == states.hurt:
		if not animation_player.is_playing():
			return states.idle
	
	return -1



func _enter_state(_previous_state: int, new_state: int) -> void:
	if new_state == states.idle:
		animation_player.play("idle")
	elif new_state == states.move:
		animation_player.play("move")
	elif new_state == states.hurt:
		animation_player.play("hurt")
	elif new_state == states.dead:
		animation_player.play("dead")
	

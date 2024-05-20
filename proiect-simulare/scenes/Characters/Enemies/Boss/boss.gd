extends Enemy

@onready var hitbox: Area2D = get_node("Hitbox")
@onready var healthbar = $HealthBar
@onready var game = get_tree().current_scene
func _ready():
	# setam la fiecare mob in parte hp diferit maybe?
	hp = 150
	healthbar.init_health(hp)


func take_damage(dam: int) -> void:
	hp -= dam
	if healthbar != null:
		healthbar.set_health(hp)
	if hp > 0:
		state_machine.set_state(state_machine.states.hurt)
	else:
		var you_win = game.get_node("YouWin")
		you_win.visible = true
		state_machine.set_state(state_machine.states.dead)

#func _set_health(value):
	#super._set_health(value)
	

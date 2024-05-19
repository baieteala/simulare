extends Enemy

@onready var hitbox: Area2D = get_node("Hitbox")
@onready var healthbar = $HealthBar


func _ready():
	# setam la fiecare mob in parte hp diferit maybe?
	hp = 50
	healthbar.init_health(hp)


func take_damage(dam: int) -> void:
	hp -= dam
	if healthbar != null:
		healthbar.set_health(hp)
	if hp > 0:
		state_machine.set_state(state_machine.states.hurt)
	else:
		state_machine.set_state(state_machine.states.dead)

#func _set_health(value):
	#super._set_health(value)
	

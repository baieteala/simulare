extends ProgressBar

# nodes got from the scene (we'll use them later)
@onready var timer := $Timer
@onready var damage_bar := $DamageBar

var health := 0 : set = set_health

func set_health(_new_health):
	var prev_health = health
	health = min(_new_health, max_value)
	value = health
	
	if health <= 0:
		# I don't need the health bar, because the enemy is dead so I'll remove it from the memory
		# and implicitly from the scene
		queue_free()
	if health < prev_health:
		# in case we or the enemies are taking damage
		timer.start()
	else:
		# we are healing from a potion or something
		damage_bar.value = health

func init_health(_health):
	# initialize health_bar with the value we wanted (basically with 100)
	health = _health
	max_value = health
	value = health
	damage_bar.max_value = health
	damage_bar.value = health
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	damage_bar.value = health

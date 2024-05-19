extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.timer.start()
	SpawnEnemy.spawn_enemy("BossRoom")

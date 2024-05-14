extends Node2D

var orc_scene = preload("res://scenes/Characters/Enemies/Orc/orc.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Este folosita aceasta functie!")
	# todo momentan nu mai spawnam :)) 
	#for n in 2:
		#var orc := orc_scene.instantiate()
		#orc.position = Vector2(randf_range(0,500),100)
		#add_child(orc)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

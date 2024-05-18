extends Node2D
var imp_scene = preload("res://scenes/Characters/Enemies/Imp/imp.tscn")
@onready var game = get_tree().get_current_scene()
# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

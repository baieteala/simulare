extends Node

var orc = preload("res://scenes/Characters/Enemies/Orc/orc.tscn")
var imp = preload("res://scenes/Characters/Enemies/Imp/imp.tscn")

var enemy_array: Array = ["orc","imp"]

func spawn_enemy(room):
	var game = get_tree().current_scene
	var camera = game.get_node("Player").get_node("Camera")
	var camera_position = camera.global_position
	if room == "EntryRoom":
		for n in 2:
			var orc_entity := orc.instantiate()
			orc_entity.position = Vector2(randf_range(0,480),randf_range(0,270))
			game.add_child(orc_entity)
			GlobalVariables.num_of_enemies += 1
			GlobalVariables.total_enemies_to_be_spawned -= 1
	elif room == "SecondRoom":
		for n in 2:
			var random_entity
			var random_index : int = randi() % enemy_array.size()
			if enemy_array[random_index] == "orc":
				random_entity = orc.instantiate()
			elif enemy_array[random_index] == "imp":
				random_entity = imp.instantiate()
			random_entity.position = Vector2(randf_range(0,480),randf_range(0,270))
			game.add_child(random_entity)
			GlobalVariables.num_of_enemies += 1
			GlobalVariables.total_enemies_to_be_spawned -= 1	
	elif room == "BossRoom":
		# fa-ti talentul :))))
		pass

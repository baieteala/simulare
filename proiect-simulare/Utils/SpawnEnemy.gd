extends Node

var orc = preload("res://scenes/Characters/Enemies/Orc/orc.tscn")
var imp = preload("res://scenes/Characters/Enemies/Imp/imp.tscn")
var boss = preload("res://scenes/Characters/Enemies/Boss/boss.tscn")

func spawn_enemy(room):
	var game = get_tree().current_scene
	var camera = game.get_node("Player").get_node("Camera")
	var camera_position = camera.global_position
	if room == "EntryRoom":
		var orc_entity 
		orc_entity = orc.instantiate()
		orc_entity.position = Vector2(randf_range(32,200),randf_range(32,240))
		game.add_child(orc_entity)
		GlobalVariables.enemies_spawned_room_one += 1
		orc_entity = orc.instantiate()
		orc_entity.position = Vector2(randf_range(32,200),randf_range(32,240))
		game.add_child(orc_entity)
		GlobalVariables.enemies_spawned_room_one += 1
	elif room == "SecondRoom":
		var imp_entity
		imp_entity = imp.instantiate()
		imp_entity.position = Vector2(randf_range(32,444),randf_range(32,240))
		game.add_child(imp_entity)
		GlobalVariables.enemies_spawned_room_two += 1
	elif room == "BossRoom":
		var boss_entity = boss.instantiate()
		boss_entity.position = Vector2(200, 150)
		game.add_child(boss_entity)
		

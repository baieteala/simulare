extends Node

var num_of_enemies := 0

const secondRoom = preload("res://scenes/Rooms/SecondRoom.tscn")
const bossRoom = preload("res://scenes/Rooms/BossRoom.tscn")
var destination

func goToRoom(destination):
	var sceneToLoad
	if destination == "SecondRoom":
		sceneToLoad = secondRoom
	if destination == "BossRoom":
		sceneToLoad = bossRoom
	
	if sceneToLoad != null:
		get_tree().change_scene_to_packed(sceneToLoad)

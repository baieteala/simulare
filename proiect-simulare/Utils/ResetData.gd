extends Node


func reset_data():
	GlobalVariables.enemies_spawned_room_one = 0
	GlobalVariables.enemies_spawned_room_two = 0

	GlobalVariables.enemies_remaining_room_one = 12
	GlobalVariables.enemies_remaining_room_two = 6

	GlobalVariables.boss_alive = 1
	GlobalVariables.room = 1
	GlobalVariables.timer.stop()

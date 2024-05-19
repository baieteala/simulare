extends Node

var enemies_spawned_room_one := 0
var enemies_spawned_room_two := 0

var enemies_remaining_room_one := 12
var enemies_remaining_room_two := 6

var boss_alive = 1

const secondRoom = preload("res://scenes/Rooms/SecondRoom.tscn")
const bossRoom = preload("res://scenes/Rooms/BossRoom.tscn")
var timer

var room = 1

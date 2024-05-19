extends Character

class_name Player

const second_room = preload("res://scenes/Rooms/SecondRoom.tscn")
const boss_room = preload("res://scenes/Rooms/BossRoom.tscn")

@onready var sword: Node2D = get_node("Sword")
@onready var sword_animation: AnimationPlayer = sword.get_node("SwordAnimation")
@onready var sword_hitbox: Area2D = get_node("Sword/Node2D/Sprite/Hitbox")
@onready var health_bar = get_node("HealthBar")
@onready var game = get_tree().current_scene
var speed = 150

func _ready():
	# TODO SCHIMBA INAPOI
	hp = 100
	if health_bar != null:
		health_bar.init_health(hp)

func _process(_delta: float) -> void:
	#(hp)
	player_input()

	var dir: Vector2 = (get_global_mouse_position() - global_position).normalized()

	if dir.x > 0 and animated_sprite.flip_h:
		animated_sprite.flip_h = false
	elif dir.x < 0 and not animated_sprite.flip_h:
		animated_sprite.flip_h = true
		
	sword.rotation = dir.angle()
	if sword.scale.y == 1 and dir.x < 0:
		sword.scale.y = -1
	elif sword.scale.y == -1 and dir.x > 0:
		sword.scale.y = 1

func player_input() -> void:
	movingDirection = Vector2.ZERO
	if Input.is_action_just_pressed("ui_down"):
		movingDirection += Vector2.DOWN
	if Input.is_action_just_pressed("ui_up"):
		movingDirection += Vector2.UP
	if Input.is_action_just_pressed("ui_right"):
		movingDirection += Vector2.RIGHT
	if Input.is_action_just_pressed("ui_left"):
		movingDirection += Vector2.LEFT
	if Input.is_action_just_pressed("ui_attack") and not sword_animation.is_playing():
		sword_animation.play("attack")
		
func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

func take_damage(dam: int) -> void:
	self.hp -= dam
	if health_bar != null:
		health_bar.set_health(self.hp)
	if hp > 0:
		state_machine.set_state(state_machine.states.hurt)
	else:
		state_machine.set_state(state_machine.states.dead)


func _on_area_2d_area_entered(area):
	if GlobalVariables.enemies_remaining_room_one <= 0 and GlobalVariables.enemies_spawned_room_one >= 12:
		GlobalVariables.enemies_remaining_room_one = 1000
		print("am ajuns aici!!")	
		if area.is_in_group("go_to_second_room"):
			print("am ajuns SI aici")
			GlobalVariables.room = 2
			var second_room_node = second_room.instantiate()
			var first_room_node = game.get_node("EntryRoom")
			TransitionScene.transition()
			await TransitionScene.on_transition_finished	
			GlobalVariables.timer.stop()
			game.add_child(second_room_node)
			game.move_child(second_room_node,0)
			game.remove_child(first_room_node)
			self.position.x = 73.25
			self.position.y = 225	
	elif GlobalVariables.enemies_remaining_room_two <= 0 and GlobalVariables.enemies_spawned_room_two >= 6:
		GlobalVariables.enemies_remaining_room_two = 1000
		if area.is_in_group("go_to_boss_room"):
			GlobalVariables.room = 3
			var second_room_node = game.get_node("SecondRoom")
			var boss_room_node = boss_room.instantiate()
			TransitionScene.transition()
			await TransitionScene.on_transition_finished	
			GlobalVariables.timer.stop()
			game.add_child(boss_room_node)
			game.move_child(boss_room_node,0)
			game.remove_child(second_room_node)
		
		# ma gandeam sa-i resetam hp-ul cand trece la o camera noua
		self.hp = 100
		health_bar.set_health(hp)

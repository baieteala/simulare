extends Character

const second_room = preload("res://scenes/Rooms/SecondRoom.tscn")
@onready var sword: Node2D = get_node("Sword")
@onready var sword_animation: AnimationPlayer = sword.get_node("SwordAnimation")
@onready var sword_hitbox: Area2D = get_node("Sword/Node2D/Sprite/Hitbox")
@onready var health_bar = get_node("HealthBar")
var speed = 150

func _ready():
	if health_bar != null:
		health_bar.init_health(hp)

func _process(_delta: float) -> void:
	player_input()

	var dir: Vector2 = (get_global_mouse_position() - global_position).normalized()

	if dir.x > 0 and animated_sprite.flip_h:
		animated_sprite.flip_h = false
	elif dir.x < 0 and not animated_sprite.flip_h:
		animated_sprite.flip_h = true
		
	sword.rotation = dir.angle()
	sword_hitbox.knockback_dir = dir
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

func take_damage(dam: int, dir: Vector2, force: int) -> void:
	print('damage taken - player')
	self.hp -= dam
	if health_bar != null:
		health_bar.set_health(self.hp)
	if hp > 0:
		state_machine.set_state(state_machine.states.hurt)
		velocity += dir * force
	else:
		state_machine.set_state(state_machine.states.dead)
		velocity += dir * force * 2


func _on_area_2d_area_entered(area):
	print("am intrat, nr de mobi: ", GlobalVariables.num_of_enemies)
	if GlobalVariables.num_of_enemies == 0 and area.is_in_group("go_to_second_room"):
		TransitionScene.transition()
		await TransitionScene.on_transition_finished
		get_tree().change_scene_to_packed(second_room)

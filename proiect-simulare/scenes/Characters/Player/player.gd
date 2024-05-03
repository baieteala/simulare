extends Character

@onready var sword: Node2D = get_node("Sword")
@onready var sword_animation: AnimationPlayer = sword.get_node("SwordAnimation")
@onready var sword_hitbox: Area2D = get_node("Sword/Node2D/Sprite/Hitbox")

func _process(_delta: float) -> void:
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
		
var speed = 150  
func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()



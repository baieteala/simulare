extends CharacterBody2D
class_name Character

const FRICTION: float = 0.15

@export var acceleration: int = 40
@export var maxSpeed: int = 100
@export var hp: int = 100 : 
	set(new_hp):
		hp = new_hp
		emit_signal("hp_changed", new_hp)
signal hp_changed(new_hp)

@onready var animated_sprite: AnimatedSprite2D = get_node("AnimatedSprite2D")
@onready var state_machine: Node = get_node("FiniteStateMachine")
var movingDirection: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	move_and_slide()
	velocity = lerp(velocity, Vector2.ZERO, FRICTION)
	
func move() -> void:
	movingDirection = movingDirection.normalized()
	velocity += movingDirection * acceleration
	velocity = velocity.limit_length(maxSpeed)

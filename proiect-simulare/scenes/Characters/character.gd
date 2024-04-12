extends CharacterBody2D
class_name Character

const FRICTION: float = 0.15

@export var accerelation: int = 40
@export var maxSpeed: int = 100

@onready var animated_sprite: AnimatedSprite2D = get_node("AnimatedSprite2D")

var movingDirection: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	move_and_slide()
	velocity = lerp(velocity, Vector2.ZERO, FRICTION)
	
func move() -> void:
	movingDirection = movingDirection.normalized()
	velocity += movingDirection * accerelation
	velocity = velocity.limit_length(maxSpeed)
	

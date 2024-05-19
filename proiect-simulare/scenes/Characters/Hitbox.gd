extends Area2D
class_name Hitbox

# TODO SCHIMBA INAPOI
@export var damage: int = 100

@onready var collision_shape: CollisionShape2D = get_child(0)


func _ready() -> void:
	assert(collision_shape != null)

func _init() -> void:
	connect("body_entered", _on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body is PhysicsBody2D:
		body.take_damage(damage)



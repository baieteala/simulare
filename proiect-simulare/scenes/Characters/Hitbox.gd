extends Area2D
class_name Hitbox

@export var damage: int = 1
var knockback_dir: Vector2 = Vector2.ZERO
@export var knockback_force: int = 300

@onready var collision_shape: CollisionShape2D = get_child(0)


func _ready() -> void:
	assert(collision_shape != null)

func _init() -> void:
	connect("body_entered", _on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body is PhysicsBody2D:
		# todo sa schimb aici!!!
		pass
		#bodyd.take_damage(damage, knockback_dir, knockback_force)




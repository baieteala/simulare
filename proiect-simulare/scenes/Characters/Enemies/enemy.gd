extends Character
class_name Enemy

var path: PackedVector2Array
@onready var navigation: NavigationRegion2D = get_tree().current_scene.get_node("NavigationRegion2D")
@onready var player: CharacterBody2D = get_tree().current_scene.get_node("Player")
@onready var health_bar = get_node("HealthBar")

const DAMAGE_AMOUNT: int = 10  # Adjust damage amount as needed
const KNOCKBACK_FORCE: int = 200  # Adjust knockback force as needed

func chase() -> void:
	if path:
		var vector_to_next_point: Vector2 = path[0] - global_position
		var distance_to_next_point: float = vector_to_next_point.length()
		if distance_to_next_point < 1:
			path.remove_at(0)
			if not path:
				return
		movingDirection = vector_to_next_point
		
		if movingDirection.x > 0 and animated_sprite.flip_h:
			animated_sprite.flip_h = false 
		elif movingDirection.x < 0 and not animated_sprite.flip_h:
			animated_sprite.flip_h = true 

func _physics_process(delta):
	if is_instance_valid(player):
		position += (player.position - position) / acceleration
		
	# Check for collision with player's hitbox
	# Assuming player's hitbox is an Area2D node with a body_entered signal connected
	# Replace "PlayerHitbox" with the actual name of the player's hitbox node
	#if player.sword_hitbox.is_colliding():
		#player.take_damage(DAMAGE_AMOUNT, velocity.normalized(), KNOCKBACK_FORCE)

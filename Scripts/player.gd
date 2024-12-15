extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@export var inv: Inv

const SPEED = 100.0

var gun_equipped = true
var gun_cooldown = true
var bullet = preload("res://Scenes/bullet.tscn")

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	
	# Gather input
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	# Normalize diagonal movement
	if direction != Vector2.ZERO:
		direction = direction.normalized()
	
	# Set velocity
	velocity = direction * SPEED
	
	# Animation handling
	if direction == Vector2.ZERO:
		animated_sprite.play("idle")
	elif direction.x > 0:
		animated_sprite.play("walk_right")
	elif direction.x < 0:
		animated_sprite.play("walk_left")
	elif direction.y > 0:
		animated_sprite.play("walk_down")
	elif direction.y < 0:
		animated_sprite.play("walk_up")
	
	# Apply movement
	move_and_slide()
	
	var mouse_pos = get_global_mouse_position()
	$Marker2D.look_at(mouse_pos)
	
	if Input.is_action_pressed("projectile_action") and gun_equipped and gun_cooldown:
		gun_cooldown = true
		var bullet_instance = bullet.instantiate()
		bullet_instance.rotation = $Marker2D.rotation
		bullet_instance.global_position = $Marker2D.global_position
		add_child(bullet_instance)
		await get_tree().create_timer(0.8).timeout
		gun_cooldown = true

# Collect item function
func collect(item):
	inv.insert(item)

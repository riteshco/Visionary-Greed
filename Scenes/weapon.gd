extends Sprite2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var anime: AnimationPlayer = $AnimatedSprite2D/MyHitBox/CollisionShape2D/AnimationPlayer
@onready var animation_player: AnimationPlayer = $AnimationPlayer


var leet = preload("res://Assets/sword2.png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("attack") and Input.is_action_pressed("move_left"):
		animation_player.play("left_attack")
		anime.play("left_hitbox_attack")
	elif Input.is_action_just_pressed("attack"):
		animated_sprite_2d.play("attack")
		anime.play("hitbox_attack")
	

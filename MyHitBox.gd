extends Area2D

class_name MyHitBox

@export var damage:= 10

func _init() -> void:
	collision_layer = 2
	collision_mask = 0

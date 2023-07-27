extends CharacterBody2D

@export var speed = 100

@onready var _animated_sprite = $AnimatedSprite2D

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if velocity.x < 0:
		_animated_sprite.play('walk_left')
	
	elif velocity.x > 0:
		_animated_sprite.play('walk_right')
	
	elif velocity.y < 0:
		_animated_sprite.play('walk_up')
	
	elif velocity.y > 0:
		_animated_sprite.play('walk_down')
	
	else:
		_animated_sprite.stop()
	

func _physics_process(_delta):
	get_input()
	move_and_slide()

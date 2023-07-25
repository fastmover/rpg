extends CharacterBody2D

@export var speed = 200

@onready var _animated_sprite = $AnimatedSprite2D

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	
	if velocity.x < 0:
		_animated_sprite.play('walk_left')
	
	elif velocity.x > 0:
		_animated_sprite.play('walk_right')
	
	elif velocity.y < 0:
		_animated_sprite.play('walk_up')
	
	elif velocity.y > 0:
		_animated_sprite.play('walk_down')

func _physics_process(delta):
	get_input()
#	# Add the gravity.
#	if not is_on_floor():
#		velocity.y += gravity * delta
#
#	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY
#
#	# Get the input direction and handle the movement/deceleration.
#	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction = Input.get_axis("ui_left", "ui_right")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

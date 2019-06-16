# A Player 

extends KinematicBody2D

# Properties
var linear_velocity: Vector2 = Vector2.ZERO
const UP = Vector2(0,-1)
var speed = 100
var gravity = 10
var jump_height = -Global.UNIT_SIZE * 2.5
var direction:int
enum Direction {LEFT = -1, RIGHT = 1, IDLE = 0}
var jump:bool = false

func  _physics_process(delta):
	linear_velocity = move_and_slide(linear_velocity, UP)
	_controls()
	_movement(delta)

func _controls():
	if Input.is_action_pressed("left"):
		direction = Direction.LEFT 
	elif Input.is_action_pressed("right"):
		direction = Direction.RIGHT
	else:
		direction = Direction.IDLE
	if Input.is_action_just_pressed("jump"):
		jump = true

func _movement(delta):
	linear_velocity.x = direction * speed
	if jump and is_on_floor():
		linear_velocity.y = jump_height
		jump = false
	else:
		linear_velocity.y += gravity
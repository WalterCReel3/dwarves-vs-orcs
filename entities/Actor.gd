extends KinematicBody2D

var speed = 200
var velocity = Vector2()
var target = Vector2()

const IDLE = 'Idle'
const HIGH_ATTACK = 'HighAttack'
const SNAP = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	target = self.position
	
func get_input():
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_right"):
		velocity.x = speed

	if velocity.x > 0:
		velocity.x -= 50
	if velocity.x < 0:
		velocity.x += 50


func process_pathing(delta):
	if abs(self.position.x - target.x) < SNAP:
		velocity.x = 0
		self.position.x = target.x
	else:
		if self.position.x < target.x:
			velocity.x = speed
		elif self.position.x > target.x:
			velocity.x = -speed
		move_and_collide(velocity * delta)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# get_input()
	process_pathing(delta)


func set_target(position):
	target = position

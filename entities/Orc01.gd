extends "res://entities/Actor.gd"

var engaged: bool = false
var rng: RandomNumberGenerator = RandomNumberGenerator.new()
onready var sprite: Sprite = get_node("Position2D/Sprite")

func _ready():
	print("Hi.  I'm orc01 _ready", self.name)
	rng.randomize()
	set_movement(-30)

func set_movement(speed):
	velocity.x = speed

func process_pathing(delta):
	var collision = move_and_collide(velocity * delta)
	if collision != null:
		engaged = true
		print("Entering engaged for ", self.name)
		set_movement(0)

func process_melee(delta):
	var r = rng.randf()
	var g = rng.randf()
	var b = rng.randf()
	sprite.modulate = Color(r, g, b, 1)

func _process(delta):
	if engaged:
		process_melee(delta)
	else:
		process_pathing(delta)

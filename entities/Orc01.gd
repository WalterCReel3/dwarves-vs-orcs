extends "res://entities/Actor.gd"

var engaged: bool = false
var engaged_entity = null
var hp: int = 500
var rng: RandomNumberGenerator = RandomNumberGenerator.new()
onready var sprite: Sprite = get_node("Position2D/Sprite")

func _ready():
	print("Hi.  I'm orc01 _ready", self.name)
	rng.randomize()
	set_movement(-30)

func get_type():
	return "OrcEntity"

func is_type(type):
	return type == "OrcEntity"

func set_movement(speed):
	velocity.x = speed

func process_pathing(delta):
	var collision = move_and_collide(velocity * delta)
	if (collision != null):
		var object = collision.collider
		if object.is_type("DwarfEntity"):
			if engaged == false:
				engaged = true
				engaged_entity = object
	elif engaged == true:
		engaged = false
		engaged_entity = null
		sprite.modulate = Color(1, 1, 1, 1)

func process_melee(delta):
	var r = rng.randf()
	var g = rng.randf()
	var b = rng.randf()
	sprite.modulate = Color(r, g, b, 1)
	var damage = rng.randi_range(0, 5)
	hp -= damage
	if hp <= 0:
		queue_free()

func _process(delta):
	process_pathing(delta)
	if engaged:
		process_melee(delta)

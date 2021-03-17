extends "res://entities/Actor.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func process_pathing(delta):
	velocity.x = -30
	move_and_collide(velocity * delta)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# get_input()
	process_pathing(delta)

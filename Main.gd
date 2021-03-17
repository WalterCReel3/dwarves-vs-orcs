extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


onready var selected_actor = get_node('Actor')

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Viewport Resolution is: ", get_viewport_rect().size)
	pass # Replace with function body.

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		# selected_actor.x = event.position.x
		print("Mouse Click/Unclick at: ", event.position)
		selected_actor.set_target(event.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

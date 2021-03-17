extends Node2D

var Orc01 = preload('res://entities/Orc01.tscn')
onready var selected_actor = get_node('Actor')
var entities: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var orc = null
	for i in range(1, 4):
		orc = Orc01.instance()
		orc.position.x = selected_actor.position.x + (i * 150)
		orc.position.y = selected_actor.position.y
		entities.append(orc)
		add_child(orc)

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

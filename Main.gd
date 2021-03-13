extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		print("Mouse Click/Unclick at: ", event.position)
		print("Viewport Resolution is: ", get_viewport_rect().size)

   # elif event is InputEventMouseMotion:
   #     print("Mouse Motion at: ", event.position)

   # Print the size of the viewport.
   # 


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

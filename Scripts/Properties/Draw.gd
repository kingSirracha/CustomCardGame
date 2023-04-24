extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var draw_count = 1
func _ready():
	pass # Replace with function body.

func property_action():
	print("property activated!")
	#must load in hand as func is called
	var hand = Global.Hand
	hand.draw_to_hand()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

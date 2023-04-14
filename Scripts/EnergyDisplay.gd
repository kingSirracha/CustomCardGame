extends Control


onready var label = get_node("Label")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#doesn't do much atm but is a start to what it will be
func update_display(current_energy):
	label.text = "Energy: " + String(current_energy)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

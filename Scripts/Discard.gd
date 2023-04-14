extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.set_discard(self)

#almost identical to the add card func in draw
#adds a card to the discard and removes it from its previous location
func add_card(card):
	var new_card = card.duplicate()
	new_card.rect_position = Vector2(200,0)
	new_card.can_click = false
	var parent = card.get_parent()
	parent.remove_child(card)
	add_child(new_card)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

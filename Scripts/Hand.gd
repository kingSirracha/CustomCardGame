extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var deck = Global.Deck
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.set_hand(self)


func update_hand():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func draw_to_hand():
	var card = deck.draw()
	#if a card could be drawn, add it
	if card != null:
		self.add_child(card)

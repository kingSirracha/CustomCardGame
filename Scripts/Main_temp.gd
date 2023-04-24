extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var hand = get_node("Hand")
onready var display = get_node("EnergyDisplay")
var energy = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	display.update_display(energy)
	Global.set_main(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func spend_energy(energy_spent):
	var temp = energy - energy_spent
	if(temp < 0):
		return false
	display.update_display(temp)
	energy = temp
	return true

func _on_Button_pressed():
	#draw a card from the deck and add it to the hand
	hand.draw_to_hand()
#	var deck = Global.Deck
#	var card = deck.draw()
	#if a card could be drawn, add it
#	if card != null:
#		hand.add_child(card)


func _on_End_Turn_pressed():
	var discard = Global.Discard
	var deck = Global.Deck
	#temp action for energy reset
	energy = 3
	display.update_display(energy)
	#discard hand
	for card in hand.get_children():
		discard.add_card(card)
	for n  in range(5):
		hand.draw_to_hand()

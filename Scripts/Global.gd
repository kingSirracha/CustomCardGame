extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Deck
var Discard
var Main
var Hand

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_deck(deck):
	Deck = deck

func set_discard(discard):
	Discard = discard

func set_main(main):
	Main = main

func set_hand(hand):
	Hand = hand

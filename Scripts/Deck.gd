extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var cards = get_tree().get_nodes_in_group("Card")

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.set_deck(self)
	
	#basic shuffle code
	shuffle()



func shuffle():
	var rng = RandomNumberGenerator.new()
	for card in get_children():
		rng.randomize()
		var r = rng.randi_range(0,get_children().size())
		move_child(card, r)

func draw():
	#checks if the draw is empty
	if get_child_count() <= 0:
		#if empty and the discard has cards, shuffle in the discard
		if Global.Discard.get_child_count() > 0:
			discard_to_draw()
	#if the draw pile had cards draw from it
	if get_child_count() > 0:
		var card = get_child(0)
		var outcard = card.duplicate()
		outcard.can_click = true
		self.remove_child(card)
		return outcard
	#if there are no more cards return null
	return null

#will add the card to the deck and remove it from it's previous location
func add_card(card):
	var new_card = card.duplicate()
	new_card.rect_position = Vector2(0,0)
	new_card.can_click = false
	var parent = card.get_parent()
	parent.remove_child(card)
	add_child(new_card)

func discard_to_draw():
	var discard = Global.Discard
	for card in discard.get_children():
		add_card(card)
	shuffle()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

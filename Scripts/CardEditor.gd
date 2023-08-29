extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var card
var other_card
onready var cardTitle = get_node("CardTitle")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func set_card(card_in,display_card):
	card = card_in
	other_card = display_card
	cardTitle.text = card.title_text


func _on_Exit_pressed():
	set_position(Vector2(-700,-700))


func _on_Save_pressed():
	card.set_title(cardTitle.text)
	other_card.set_title(cardTitle.text)
	pass

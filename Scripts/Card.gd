extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#these vars and their values will be uniqe from card to card
onready var button = get_node("TextureButton")
onready var title = get_node("CardFront/Title")
onready var card_image = get_node("CardFront")
#how the card shifts when selected
var select_vect = Vector2(0,-280)
#how the card scales when selected
var select_scale = 2
#is true when the card is in an interactable area such as the HAND
#false for DECK, DISCARD, and PLAYFIELD when it's added
var can_click = true
export var title_text = "hello"
# Called when the node enters the scene tree for the first time.

func _ready():
	title.text = title_text



#used to handel the scaling of objects when the card is hoverd over
func select_scaling(scale):
	rect_min_size = Vector2(180,260) * scale
	card_image.rect_scale = Vector2(1,1) * scale
	button.rect_scale = Vector2(1,1) * scale

#handels the shifitng of element when the card is hovered over
func select_movement(move_vect):
	card_image.rect_position += move_vect
	button.rect_position += move_vect



func _on_TextureButton_pressed():
	if can_click:
		if(Global.Main.spend_energy(1)):
			select_scaling(1)
			card_image.rect_position = Vector2.ZERO
			button.rect_position = Vector2.ZERO
			Global.Discard.add_card(self)

func _on_TextureButton_mouse_entered():
	if can_click:
		select_scaling(select_scale)
		select_movement(select_vect)


func _on_TextureButton_mouse_exited():
	if can_click:
		select_scaling(1)
		select_movement(select_vect * -1)
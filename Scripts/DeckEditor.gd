extends Control

export var mainMenuScene : PackedScene
onready var deck: Node = Global.Deck
onready var card_ref = preload("res://Scenes/Card.tscn")
onready var card_display = get_node("ScrollContainer/CardDisplay")
onready var click_ui = get_node("Click UI")
onready var card_editor = get_node("CardEditor")
var current_card: Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("card editor loaded")
	Global.set_editor(self)
	display_deck()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Back_pressed():
	#deck = get_node("Deck")
	#Global.Deck = deck
	Saves.deck_data = deck.get_savedata()
	Saves.save_game()
	get_tree().change_scene(mainMenuScene.resource_path)

func set_deck_to_display():
	deck.clear_cards()
	for card in card_display.get_children():
		deck.add_card(card)

func _on_AddCard_pressed():
	var card = card_ref.instance()
	card.can_click = false
	card.title_text = "Default Card"
	deck.add_card(card)
	add_card_to_display(card)

func display_deck():
	#clears the display if theres already items
	for item in card_display.get_children():
		item.queue_free()
	#gets all of the cards in the current deck
	var card_list = deck.get_cards()
	print(card_list.size())
	for card in card_list:
		var tempcard = card.duplicate()
		card.can_editor_click = true
		add_card_to_display(tempcard)

func add_card_to_display(incard):
	var card = incard.duplicate()
	card.set_visable(true)
	card.can_click = false
	card.can_editor_click = true
	card_display.add_child(card)
	

#mainly for the ui around selecting cards
#func _input(event):
#	if(Input.is_action_just_pressed("right_click")):
#		var ui_pos = get_global_mouse_position()
#		ui_pos.y += -50
#		click_ui.set_position(ui_pos)
#		print("click!")

func card_clicked(card):
	current_card = card
	var ui_pos = get_global_mouse_position()
	ui_pos.y += -50
	click_ui.set_position(ui_pos)



func _on_RemoveCard_pressed():
	var index = current_card.get_index()
	card_display.get_child(index).queue_free()
	deck.get_child(index).queue_free()
	print(deck.get_children().size())
	click_ui.set_position(Vector2(-100,-100))
	


func _on_EditCard_pressed():
	card_editor.set_position(Vector2(0,0))
	card_editor.set_card(deck.get_child(current_card.get_index()),current_card)
	click_ui.set_position(Vector2(-100,-100))

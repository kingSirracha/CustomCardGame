extends Control

export var mainMenuScene : PackedScene
onready var deck = Global.Deck

onready var testCard = get_node("Card")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Back_pressed():
	get_tree().change_scene(mainMenuScene.resource_path)




func _on_AddCard_pressed():
	deck.add_card(testCard.duplicate())

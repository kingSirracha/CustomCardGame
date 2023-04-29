extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var mainGameScene : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_Game_pressed():
	get_tree().change_scene(mainGameScene.resource_path)



func _on_Deck_Editor_pressed():
	get_tree().change_scene("res://Scenes/DeckEditor.tscn")
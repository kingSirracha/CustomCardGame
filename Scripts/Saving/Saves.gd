extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const SAVE_FILE = "user://savegame.json"
#var save_num = 0
var deck_data = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	load_game()

func save_game():
	print("deck was saved")
	var file = File.new()
	file.open(SAVE_FILE, file.WRITE)
	var json_string = JSON.print(deck_data)
	file.store_line(json_string)
	file.close()

func load_game():
	var file = File.new()
	if not file.file_exists(SAVE_FILE):
		var temp_deck = load("res://Scenes/Deck.tscn")
		deck_data = temp_deck.get_savedata()
		save_game()
		temp_deck.queue_free()
	file.open(SAVE_FILE, file.READ)
	var content = file.get_as_text()
	var data: Dictionary = JSON.parse(content).result
	deck_data = data
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

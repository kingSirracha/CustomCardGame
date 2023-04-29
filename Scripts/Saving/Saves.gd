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
	pass # Replace with function body.

func save_game():
	var file = File.new()
	file.open(SAVE_FILE, file.WRITE)
	var json_string = JSON.print(deck_data)
	file.store_line(json_string)
	file.close()

func load_game():
	var file = File.new()
	if not file.file_exists(SAVE_FILE):
		#save_num = 0
		save_game()
	file.open(SAVE_FILE, file.READ)
	while file.get_position() < file.get_len():
		var json_string = file.get_line()
		#json helper
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var deck_data = json.get_data()
	file.close()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

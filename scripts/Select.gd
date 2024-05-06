extends ItemList

var objects = []
var selected_path

@onready var select = $"../../Select"
@onready var description = $"../../Description"

#Get all object of matching folder and add the to the list
func _ready():
	objects = DirAccess.get_files_at("res://scenes/objects/"+self.name+"/")
	for i in range(objects.size()):
		var object = objects[i]
		object = object.trim_suffix(".tscn")
		add_item(object)

#Send the selected item to the cursor
func _on_item_selected(index):
	select.play()
	selected_path = load("res://scenes/objects/"+self.name+"/"+objects[index-1])
	var seleceted = selected_path.instantiate()
	#description.text = selected.get_child(selected.get_child_count()-1).description
	get_parent().get_parent().get_parent().get_node("Cursor").selected_path = selected_path

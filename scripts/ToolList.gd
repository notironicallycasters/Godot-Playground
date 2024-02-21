extends ItemList

var selected = 0

@onready var select = $"../Select"

#Set the selected object
func _on_item_selected(index):
	select.play()
	selected = index

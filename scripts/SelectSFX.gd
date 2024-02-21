extends TabContainer


@onready var select = $"../Select"


func _on_tab_selected(tab):
	select.play()

extends Node

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://TitleScreen.tscn")

func _on_Node2D_captured():
	get_tree().quit()

func _on_ToolButton_pressed():
	get_tree().change_scene("res://TitleScreen.tscn")

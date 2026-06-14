extends Control

# This simple script connects to all the buttons in the menu and acts when the buttons are pressed.

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/gameplay/levels/level1.tscn") # when we hit play, change the scene to the main gameplay

func _on_source_pressed():
	OS.shell_open("https://github.com/Kaplin86/project-ysws-example") # this handy dandy function allows us to open a website.


func _on_vol_value_changed(value): #due to how the slider is set up, we can assume value is between 0 and 1
	AudioServer.set_bus_volume_linear(0,value) #sets the volume based on 0, 1, and any number inbetween.

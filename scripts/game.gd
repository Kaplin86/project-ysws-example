extends Node2D

@export_file_path("*.tscn") var nextLevel : String # This refers to the filename for the level after. This is an export variable so it can be unique to each scene!
# The export_file_path is an export variable that comes with a file selector.

func _process(delta): # We check every frame
	if $Ball.global_position.y >= 694.0: # If the ball's Y is too far offscreen
		get_tree().reload_current_scene() # Restart the current scene. 
	
	if is_inside_tree(): # Make sure that we are inside of a scene tree (we leave the tree for one frame when a scene restarts)
		var bricks = get_tree().get_node_count_in_group("bricks") # Gets number of nodes in a group
		if bricks == 0: # If there are no bricks
			get_tree().change_scene_to_file(nextLevel) # Go to the next level!
	

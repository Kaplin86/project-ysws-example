extends Node2D

func _process(delta): # We check every frame
	if $Ball.global_position.y >= 694.0: # If the ball's Y is too far offscreen
		get_tree().reload_current_scene() # Restart the current scene. 
	
	if is_inside_tree(): # Make sure that we are inside of a scene tree (we leave the tree for one frame when a scene restarts)
		var bricks = get_tree().get_node_count_in_group("bricks") # Gets number of nodes in a group
		if bricks == 0: # If there are no bricks
			get_tree().reload_current_scene() # Restart the current scene. 
	

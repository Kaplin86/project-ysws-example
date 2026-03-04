extends CharacterBody2D

@export var movementSpeed = 50 # @export allows a variable to be set from the node's inspector panel

func _process(delta): # This runs every frame. Delta refers to time since last frame (so 1 / FPS)
	
	if Input.is_action_pressed("ui_left"): # Check if the input called "ui_left" is running
		position.x = position.x - (movementSpeed * delta) # Move to the left based on the movement speed.
		# MovementSpeed * Delta causes it to move a MovementSpeed amount of pixels per second.
	if Input.is_action_pressed("ui_right"):
		position.x = position.x + (movementSpeed * delta)
	
	position.x = clamp(position.x,141,1012) # The X position of the node is set to be a value inbetween -427 and 427
	

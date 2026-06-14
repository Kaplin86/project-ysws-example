extends CharacterBody2D

@export var movementSpeed = 500

func _ready():
	velocity = Vector2(20,-movementSpeed)

func _process(delta):
	var collision = move_and_collide(velocity * delta) # We check if the ball will collide with something
	if collision: # If it DOES collide
		velocity = velocity.bounce(collision.get_normal()) # Change the velocity
		createAndPlaySound("res://assets/sfx/bounce.wav")
		if collision.get_collider().is_in_group("bricks"): # We check if the thing we collided with is apart of the bricks group
			collision.get_collider().queue_free() # Delete the brick
			createAndPlaySound("res://assets/sfx/hit.wav")

func createAndPlaySound(path : String): #takes a string input (a filepath) and plays the sound.
	var newPlayer = AudioStreamPlayer.new() # Create a new audio stream player node
	add_child(newPlayer) # Add it
	newPlayer.stream = load(path) # Load the path as the audio stream
	newPlayer.play() # Play the audio
	newPlayer.pitch_scale = randf_range(0.5,0.53) # Adjust the pitch to be a a random value between 0.5 and 0.53 

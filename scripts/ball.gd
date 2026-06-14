extends CharacterBody2D

@export var movementSpeed = 500

func _ready():
	velocity = Vector2(20,-movementSpeed)

func _process(delta):
	var collision = move_and_collide(velocity * delta) # We check if the ball will collide with something
	if collision: # If it DOES collide
  
		var collider = collision.get_collider() # we store this in a variable to shorten the code.
		
		if collider.is_in_group("bricks"): # We check if the thing we collided with is apart of the bricks group
			
			if collider is BaseBrick: # One final sanity check
				
				if collider.hp > 0: # If the collider isnt glass (glass has a starting hp of 0)
					velocity = velocity.bounce(collision.get_normal()) # Change the velocity 
          createAndPlaySound("res://assets/sfx/bounce.wav")
          
				
				collider.hp -= 1 # Decrease hp by one
				
				if collider.hp <= 0: # If the brick's hp is 0 (or less)
					
					collider.queue_free() # Delete the brick
          createAndPlaySound("res://assets/sfx/hit.wav")
		else:
			# change velocity if we collide with anything non-brick
			velocity = velocity.bounce(collision.get_normal()) # Change the velocity
      createAndPlaySound("res://assets/sfx/bounce.wav")


func createAndPlaySound(path : String): #takes a string input (a filepath) and plays the sound.
	var newPlayer = AudioStreamPlayer.new() # Create a new audio stream player node
	add_child(newPlayer) # Add it
	newPlayer.stream = load(path) # Load the path as the audio stream
	newPlayer.play() # Play the audio
	newPlayer.pitch_scale = randf_range(0.5,0.53) # Adjust the pitch to be a a random value between 0.5 and 0.53 
extends CharacterBody2D

@export var movementSpeed = 500

func _ready():
	velocity = Vector2(20,-movementSpeed)

func _process(delta):
	var collision = move_and_collide(velocity * delta) # We check if the ball will collide with something
	if collision: # If it DOES collide
		velocity = velocity.bounce(collision.get_normal()) # Change the velocity
		if collision.get_collider().is_in_group("bricks"): # We check if the thing we collided with is apart of the bricks group
			collision.get_collider().queue_free() # Delete the brick
	
	

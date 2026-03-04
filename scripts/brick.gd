extends RigidBody2D

func _ready():
	var colors = [Color.ORANGE_RED,Color.DARK_ORANGE,Color.YELLOW,Color.GOLD] # Here we define a array of collars
	modulate = colors.pick_random() # Using modulate we can TINT the sprite, based on the color
	

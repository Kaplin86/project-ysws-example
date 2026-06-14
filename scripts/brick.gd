extends RigidBody2D
class_name BaseBrick 
# We add a class name, that way other scripts can refernece it easier.

@export var hp = 1 #the amount of hp remaining on the brick

func _ready():
	var colors = [Color.ORANGE_RED,Color.DARK_ORANGE,Color.YELLOW,Color.GOLD] # Here we define a array of collars
	modulate = colors.pick_random() # Using modulate we can TINT the sprite, based on the color
	

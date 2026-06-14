extends BaseBrick
class_name ColorlessBrick
# The reason we inherit from BaseBrick is so that any behaviors from it can be copied without having to recode it, while also having unique overrides.

# For example, by doing this, the bricks will not have their on-ready effect. (which is changing color)
func _ready():
	pass

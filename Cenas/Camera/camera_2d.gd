extends Camera2D

@onready var top_left = $Limits/TopLeft
@onready var bottom_rigth = $Limits/BottomRigth


# Called when the node enters the scene tree for the first time.
func _ready():
	limit_top = top_left.position.y
	limit_left = top_left.position.x
	limit_bottom = bottom_rigth.position.y
	limit_right = bottom_rigth.position.x

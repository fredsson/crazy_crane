extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var ROTATION_SPEED = 0.1;
var SIDE_TO_SIDE_ROTATION_VECTOR = Vector3(0, 1, 0);

func _unhandled_input(event):
	if event.is_action("crane_move_left"):
		self.rotate(SIDE_TO_SIDE_ROTATION_VECTOR, ROTATION_SPEED);
	if event.is_action("crane_move_right"):
		self.rotate(SIDE_TO_SIDE_ROTATION_VECTOR, -ROTATION_SPEED);
	if event.is_action("crane_extend_arm"):
		print("extending arm!");
	if event.is_action("crane_retract_arm"):
		print("retracting arm!");

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

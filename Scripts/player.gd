extends RigidBody2D

@export var impulso = 1.0
@onready var foguin: Node2D = $foguin


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gravity_scale = 0
	linear_damp = 1
	angular_damp = 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("impulse"):
		darImpulso()
		foguin.visible = true
	else:
		foguin.visible = false

	rotate360()

func darImpulso():
	var direction = Vector2.UP.rotated(rotation)
	apply_central_impulse(direction * impulso)

func rotate360():
	if Input.is_action_pressed("left"):
		apply_torque(-200)
	elif Input.is_action_pressed("right"):
		apply_torque(200)

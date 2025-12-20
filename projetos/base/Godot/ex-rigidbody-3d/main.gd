extends Node
@onready var bola: RigidBody3D = $bola


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		bola.apply_force(Vector3(0.1,0,-0.9)*500)

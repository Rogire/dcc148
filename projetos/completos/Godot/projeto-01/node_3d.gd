extends Node3D
func _ready()->void:
	pass

func _process(delta: float) -> void:
	pass

@onready var node_3d: Node3D = $"."

@export var teste_var : String
@export var teste_var_arr : Array[String]
@export var vector_2d : Vector2

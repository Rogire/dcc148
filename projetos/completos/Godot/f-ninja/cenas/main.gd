extends Node

@export var CuboMorte : PackedScene
@export var CuboPadrao : PackedScene
@export var tempo : float = 2
var cubo_ativo : Node3D
var pontos = 0
var rng = RandomNumberGenerator.new()

func _ready()->void:
	cubo_ativo = CuboPadrao.instantiate()
	add_child(cubo_ativo)

func _novo_cubo()->void:
	cubo_ativo.queue_free()
	
	var rand_val = rng.randf_range(0.0,1.0)
	
	if rand_val > 0.8:
		cubo_ativo=CuboMorte.instantiate()
	else:
		cubo_ativo=CuboPadrao.instantiate()
		
	var rand_x = rng.randf_range(-6.0, 6.0)
	var rand_y = rng.randf_range(-3.0, 3.0)
	var pos = Vector3(rand_x, rand_y, 0)
	cubo_ativo.position = pos
		
	add_child(cubo_ativo)
	
func _process(delta: float) -> void:
	tempo -= delta
	print(tempo)
	
	if (tempo<0):
		cubo_ativo.queue_free()
		tempo=2
		_novo_cubo()
		
	if Input.is_action_just_pressed("acao"):  
		tempo=2
		if cubo_ativo.name == "CuboMorte":
			print("Pontuação: " + str(pontos))
		else:
			pontos += 1
			_novo_cubo()  

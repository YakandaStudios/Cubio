extends Node
const moving = preload("res://Player/States/Ducking.gd")
const Falling = preload("res://Player/States/Falling.gd")
const Jumping = preload("res://Player/States/Jumping.gd")
const Walking = preload("res://Player/States/Walking.gd")
#Manejar los estados dentro del diagrama de Maquina de Estados
#Asegurar de ejecutar los tres estados de cada maquina de estados

export(NodePath) var character_path = null
var current_state

func _ready():
	character_path = get_node(character_path)
	current_state
	pass

func _process(delta):
	print(character_path)

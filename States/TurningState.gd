extends "res://States/StateBase.gd"

var idle_state_path = preload("res://States/IdleState.gd")
var idle_state_class = null

var character_node = null

func enter(character_node):
	print("Enter function TURNING")
	self.character_node = 	character_node
	
func update(delta):
	if Input.is_action_just_released("a"):
		print("Dentro de TURNING, a IDLE")
		idle_state_class = idle_state_path.new()
		emit_signal("changing_state", idle_state_class ) 
#	
func exit():
	print("Exit function Idle")
	
extends "res://States/StateBase.gd"

var idle_state_path = preload("res://States/IdleState.gd")
var idle_state_class = null

var character_node = null

func enter(character_node):
	print("Enter function DoubleJump")
	self.character_node = character_node
	
func update(delta):
	if ( (Input.is_action_just_released("ui_jump")) && (character_node.get_transform().origin.z > 3.10) && (character_node.get_transform().origin.z < 3.20) ):
		idle_state_class = idle_state_path.new()
		emit_signal("changing_state", idle_state_class ) 
		print("Dentro de DoubleJump, a IDLE")
	
func exit():
	print("Exit function DoubleJump")
	idle_state_class.queue_free()
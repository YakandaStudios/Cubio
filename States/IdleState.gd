extends "res://States/StateBase.gd"

var jump_state_path = preload("res://States/JumpState.gd")
var jump_state_class = null
#var turning_state_path = preload("res://TurningState.gd")
#var turning_state_class = null

var character_node = null

func enter(character_node):
	print("Enter function Idle")
	self.character_node = 	character_node
	
func update(delta):
	if Input.is_action_pressed("ui_jump"):
		character_node.jump(delta)
		jump_state_class = jump_state_path.new()
		emit_signal("changing_state", jump_state_class ) 
	
	if Input.is_action_pressed("ui_left"):
		character_node.turn_left()
#		turning_state_class = turning_state_path.new()
#		emit_signal("changing_state", turning_state_class ) 
	
func exit():
	print("Exit function Idle")
	
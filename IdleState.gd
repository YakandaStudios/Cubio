extends "StateBase.gd"
const jump_state_path = preload("res://States/JumpState.gd")
const moving_state_path = preload("res://States/MovingState.gd")
var jump_state_instance = null

func enter():
	print("Enter function Idle")
	pass
	
func update():
	print("Update function Idle")
	
	if Input.is_action_pressed("ui_jump"):
#		return jump_state_instance.instance()
#		emit("jumpstate", - , jump_state_instance.instance() ) 
	
	
func exit():
	print("Exit function Idle")
	pass
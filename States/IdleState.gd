extends "res://States/StateBase.gd"


var character_node = null

func enter(character_node):
	print("Enter function Idle")
	self.character_node = 	character_node
#	character_node.move_and_slside(Vector3(0,0,0), Vector3(0,1,0))
	
func update(delta):
#Jump State
	if Input.is_action_just_pressed("ui_jump"):
		character_node.jump()
		emit_signal("changing_state",  character_node.jump_state_path.new() ) 

#Turning state
	if Input.is_action_just_pressed("a"):
		character_node.turn_left()
		emit_signal("changing_state", character_node.turning_state_path.new() ) 
	if Input.is_action_just_pressed("d"):
		character_node.turn_right()
		emit_signal("changing_state", character_node.turning_state_path.new()) 

#Do moving again, call it itself
	if Input.is_action_just_pressed("w"):
		character_node.move_front(delta)
		emit_signal("changing_state", character_node.moving_state_path.new() ) 
		
	if Input.is_action_just_pressed("s"):
		character_node.move_back(delta)
		emit_signal("changing_state", character_node.moving_state_path.new() ) 
#	
func exit():
	print("Exit function Idle")
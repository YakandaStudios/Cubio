extends "res://States/StateBase.gd"

var character_node = null

func enter(character_node):
	print("Enter function TURNING")
	self.character_node = 	character_node
	
func update(delta):
#If still tuirning itself, change to move
	if Input.is_action_pressed("a"):
		character_node.move_front(delta)
		emit_signal("changing_state", character_node.moving_state_path.new() ) 
	if Input.is_action_just_released("a"):
		character_node.move_front(delta)
		emit_signal("changing_state", character_node.moving_state_path.new() ) 
		
		
#Jump State
	if Input.is_action_pressed("ui_jump"):
		character_node.jump()
		emit_signal("changing_state",  character_node.jump_state_path.new() ) 

#Do moving again, call it itself
	if Input.is_action_pressed("w"):
		character_node.move_front(delta)
		emit_signal("changing_state", character_node.moving_state_path.new() ) 
	if Input.is_action_pressed("s"):
		character_node.move_back(delta)
		emit_signal("changing_state", character_node.moving_state_path.new() ) 
		
#Idle state: When you release the moving buttons
	if Input.is_action_just_released("a"):
		emit_signal("changing_state", character_node.idle_state_path.new() ) 
	if Input.is_action_just_released("d"):
		emit_signal("changing_state", character_node.idle_state_path.new() ) 
#	
func exit():
	print("Exit function TURNING")
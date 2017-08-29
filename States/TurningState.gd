extends "res://States/StateBase.gd"

var character_node = null

func enter(character_node):
#	print("Enter function TURNING")
	self.character_node = 	character_node
	if Input.is_action_pressed("a"):
		character_node.turn_left()
	if Input.is_action_pressed("d"):
		character_node.turn_right()
	
func update(delta):
#If still tuirning itself, change to move
	if Input.is_action_pressed("a"):
		character_node.move_front(delta)
		emit_signal("changing_state", character_node.moving_state_path.new() ) 
	if Input.is_action_pressed("d"):
		character_node.move_front(delta)
		emit_signal("changing_state", character_node.moving_state_path.new() ) 
		
		
#Jump State
	if Input.is_action_pressed("ui_jump"):
		emit_signal("changing_state",  character_node.jump_state_path.new() ) 

#Do moving again, call it itself
	if Input.is_action_pressed("w"):
		emit_signal("changing_state", character_node.moving_state_path.new() ) 
	if Input.is_action_pressed("s"):
		emit_signal("changing_state", character_node.moving_state_path.new() ) 
		
#Idle state: When you release the moving buttons
	if Input.is_action_just_released("a"):
		emit_signal("changing_state", character_node.idle_state_path.new() ) 
	if Input.is_action_just_released("d"):
		emit_signal("changing_state", character_node.idle_state_path.new() ) 
#	
func exit():
	pass
#	print("Exit function TURNING")
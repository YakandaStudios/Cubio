extends "res://States/StateBase.gd"

var character_node = null

func enter(character_node):
#	print("Enter function MOVING")
	self.character_node = character_node
	
func update(delta):
#Do moving again, call it itself without emit signal
	if Input.is_action_pressed("w"):
		character_node.move_front(delta)
		
	if Input.is_action_pressed("s"):
		character_node.move_back(delta)

#Turning state
	if Input.is_action_just_pressed("a"):
		emit_signal("changing_state", character_node.turning_state_path.new() ) 
	if Input.is_action_just_pressed("d"):
		emit_signal("changing_state", character_node.turning_state_path.new() ) 
		
#Jump State
	if Input.is_action_pressed("ui_jump"):
		character_node.jump()
		emit_signal("changing_state",  character_node.jump_state_path.new() ) 

#Idle state: When you release the moving buttons
	if Input.is_action_just_released("w"):
		emit_signal("changing_state", character_node.jump_state_path.new() ) 
	if Input.is_action_just_released("s"):
		emit_signal("changing_state", character_node.jump_state_path.new() ) 

func exit():
	pass
#	print("Exit function MOVING")
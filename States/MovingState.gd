extends "res://States/StateBase.gd"

var character_node = null

func enter(character_node):
#	print("Enter function MOVING")
	self.character_node = character_node
	
func update(delta):
#Do moving again, call it itself without emit signal
	if Input.is_action_pressed("w"):
		character_node.move_forwards(delta)
		
	if Input.is_action_pressed("s"):
		character_node.half_turn()
		character_node.move_forwards(delta)

#Turning state
	if Input.is_action_just_pressed("a"):
		character_node.move_forwards(delta)
		emit_signal("changing_state", character_node.turning_state_path.new() ) 
	if Input.is_action_just_pressed("d"):
		character_node.move_forwards(delta)
		emit_signal("changing_state", character_node.turning_state_path.new() ) 
		
#Jump State
	if Input.is_action_pressed("ui_jump"):
		emit_signal("changing_state",  character_node.jump_state_path.new() ) 

#Idle state: When you release the moving buttons
	if Input.is_action_just_released("w"):
		emit_signal("changing_state", character_node.idle_state_path.new() ) 
	if Input.is_action_just_released("s"):
		emit_signal("changing_state", character_node.idle_state_path.new() ) 

func exit():
	pass
#	print("Exit function MOVING")
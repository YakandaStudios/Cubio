extends "res://States/StateBase.gd"

var idle_state_path = preload("res://States/IdleState.gd")
var idle_state_class = null
var double_state_path = preload("res://States/DoubleJumpState.gd")
var double_state_class = null

var character_node = null

func enter(character_node):
	print("Enter function Jump")
	self.character_node = character_node
#	$scenario
	
func update(delta):
	print ("Jump_State:" + str(character_node.touch_floor))
#	if ((character_node.get_transform().origin.y < 3.20) && (Input.is_action_just_released("ui_jump")) ):
#	if ( (Input.is_action_just_released("ui_jump") ) && ( character_node.is_on_floor() )):
	if (character_node.touch_floor):
		print("Dentro de JUMP, a IDLE")
		idle_state_class = idle_state_path.new()
		emit_signal("changing_state", idle_state_class ) 

	
#	elif Input.is_action_just_pressed("ui_jump"):
#		double_state_class = double_state_path.new()
#		emit_signal("changing_state", double_state_class ) 
#		print("Dentro de JUMP, a IDLE")

func exit():
	print("Exit function Idle")
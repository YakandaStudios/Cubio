extends "res://States/StateBase.gd"

var character_node = null
var t = Timer.new()

func enter(character_node):
	print("Enter function JUMP")
	self.character_node = character_node
	character_node.jump()

	t.set_wait_time(10)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	
func update(delta):
##########################
#HardCode in order to make the function of the double Jump, need to change the way of detect the floor
##########################
#DoubleJump State
	if Input.is_action_just_pressed("ui_jump"):
		emit_signal("changing_state",  character_node.double_jump_state_path.new() ) 
#Touch floor
	if (character_node.touch_floor == true):
		emit_signal("changing_state", character_node.idle_state_path.new()) 
func exit():
#	pass
	t.queue_free()
	print("Exit function JUMP")
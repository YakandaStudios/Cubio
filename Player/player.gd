	#Copyright (c) 2017 Yakanda Studios | Mantra: Going to next level

#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.
extends KinematicBody

var jump_state_path = preload("res://States/JumpState.gd")
var turning_state_path = preload("res://States/TurningState.gd")
var moving_state_path = preload("res://States/MovingState.gd")
var idle_state_path = preload("res://States/IdleState.gd")
var double_jump_state_path = preload("res://States/DoubleJumpState.gd")

var speed = 0.1
var gravity = -2
var jump_speed = 5
var current_position = Vector3()
var dir = Vector3(0,0,0)
var current_rotation = Vector3()

var touch_floor = false

func _ready():
	current_position = get_node(".").get_translation()
	move_and_slide(dir, Vector3(0,1,0))
	set_process(true)
	
#Set free the character object and pause the game
func die():
	queue_free()
	get_tree().set_pause(true)

#Press A	
func move_front(delta):
	print("MoveFront")
	dir = dir * (delta * speed)
	move_and_slide(dir)
	#Press S	
func move_back(delta):
	dir = dir * (-(delta * speed)) 
	move_and_slide(dir)
	
#Press D
func turn_right():
	dir.z = -1
	
#Press A
func turn_left():
	rotate_y(PI/2)
	dir.x = -10
	move_and_slide(dir)
	pass
	
func half_turn():
	rotate_y(PI/2)
	pass
	
func jump():
	dir.y = jump_speed
	pass
	
#It has the functionality about the gravitiy and movement of the character
func _process(delta):	
#	current_position = get_transform().origin
	current_position = get_translation()
	current_rotation = get_rotation()
	
	print(dir)
	dir.y += delta*gravity
	move(dir)
#	print(current_position)
#	print(current_rotation)
#	print(is_on_floor())

	#set_floor_properties(normal,slope)
	#move(speed*delta)
	#if(is_on_floor()):
#	
#

func _on_Area_body_entered( body ):
	if(body.is_in_group("floor")):
		touch_floor = true

func _on_Area_body_exited( body ):
	if(body.is_in_group("floor")):
		touch_floor = false
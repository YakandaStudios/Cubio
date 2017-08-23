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

var speed = 0.1
var gravity = -2
var jump_speed = 0.5
var current_position = Vector3()
var dir = Vector3()
var current_rotation = Vector3()

func _ready():
	current_position = get_node(".").get_translation()
	set_process(true)
	
#Set free the character object and pause the game
func die():
	queue_free()
	get_tree().set_pause(true)
	
func move_front(current_position, delta):
	current_position.z += 10 * delta
	get_node(".").set_translation(current_position)

func move_back(current_position, delta):
	current_position.z -= 10 * delta
	get_node(".").set_translation(current_position)

func turn_right():
#	rotate_y(PI/2)
	set_rotation(Vector3(-PI/2,0,0))
	pass

func turn_left():
	rotate_y(-PI/2)
	pass
	
func half_turn():
	rotate_y(PI)
	pass
	
func jump(delta):
	dir.y = jump_speed
	pass
	
#It has the functionality about the gravitiy and movement of the character
func _process(delta):	
#	current_position = get_transform().origin
	current_position = get_translation()
	current_rotation = get_rotation()
	
	print(current_rotation)
	
	dir.y += delta*gravity
	move(dir)
#	print(current_position)
	
	if Input.is_action_pressed("w"):
		move_front(current_position, delta)
		
	if Input.is_action_pressed("s"):
		move_back(current_position, delta)
		
	if Input.is_action_just_pressed("a"):
		turn_right()
		
	if Input.is_action_just_pressed("d"):
		turn_left()
#		
#	if Input.is_action_just_pressed("ui_jump"):
#		jump(delta)
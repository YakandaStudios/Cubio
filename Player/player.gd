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

export(float) var speed = 0.2
export(float) var gravity = -2
export(float) var jump_speed = 0.5
var dir = Vector3()

func _ready():
	set_process(true)
	
#Set free the character object and pause the game
func die():
	queue_free()
	get_tree().set_pause(true)

func move_front():
	#dir.z = horizontal_speed
	#	move(dir)
	pass

func move_back():
		#dir.z = horizontal_speed
	#	move(dir)
	pass

func turn_right():
		#dir.z = horizontal_speed
	#	move(dir)
	pass

func turn_left():
		#dir.z = horizontal_speed
	#	move(dir)
	pass
	
func jump():
		#dir.z = horizontal_speed
	#	move(dir)
	pass
	
#It has the functionality about the gravitiy and movement of the character
func _process(delta):	
#	dir.y += delta*gravity
	
	if Input.is_action_just_pressed("ui_up"):
		move_front()
		
	if Input.is_action_just_pressed("ui_down"):
		move_back()
		
	if Input.is_action_just_pressed("ui_right"):
		turn_right()
		
	if Input.is_action_just_pressed("ui_left"):
		turn_left()
		
	if Input.is_action_just_pressed("ui_jump"):
		jump()
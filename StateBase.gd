extends Node

func _init():
	pass
	
func _process(delta):
	pass

func handleInput(player, input) {
    if (input == RELEASE_DOWN)
    {
      // Change to standing state...
      heroine.setGraphics(IMAGE_STAND);
    }
  }

func exit():
	pass
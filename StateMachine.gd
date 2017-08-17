extends Node

enum state_{
	STATE_STANDING,
	STATE_JUMPING,
	STATE_DOUBLEJUMP,
	STATE_TURNING,
	STATE_MOVING,
}

#handleStates
export(NodePath) var character_target = null

func _process(delta):
	if(state_)

pass

func handleInput(Input input)
{
  HeroineState* state = state_->handleInput(*this, input);
  if (state != NULL)
  {
    delete state_;
    state_ = state;
  }
}
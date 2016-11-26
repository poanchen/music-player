void mousePressed()
{
  if(mouseButton == LEFT)
  {
    if(!show)
    {
      isLeftPlayButtonPressed();
      isLeftStopButtonPressed();
    }
    else
    {
      isRightPauseButtonPressed();
      isRightStopButtonPressed();
    } 
  }
}

void isLeftPlayButtonPressed()
{
  if(
      mouseX >= left_play_btn_x &&
      mouseX <= left_play_btn_x+sizeOfButton &&
      mouseY >= left_play_btn_y &&
      mouseY <= left_play_btn_y+sizeOfButton &&
      !show
    )
    {
      print("left play button has been pressed\n");
      show = true;
    }
}

void isLeftStopButtonPressed()
{
  if(
      mouseX >= left_stop_btn_x &&
      mouseX <= left_stop_btn_x+sizeOfButton &&
      mouseY >= left_stop_btn_y &&
      mouseY <= left_stop_btn_y+sizeOfButton &&
      !show
    )
    {
      print("left stop button has been pressed\n");
    }
}

void isRightPauseButtonPressed()
{
  if(
      mouseX >= right_pause_btn_x &&
      mouseX <= right_pause_btn_x+sizeOfButton &&
      mouseY >= right_pause_btn_y &&
      mouseY <= right_pause_btn_y+sizeOfButton &&
      show
    )
    {
      print("right pause button has been pressed\n");
    }
}

void isRightStopButtonPressed()
{
  if(
      mouseX >= right_stop_btn_x &&
      mouseX <= right_stop_btn_x+sizeOfButton &&
      mouseY >= right_stop_btn_y &&
      mouseY <= right_stop_btn_y+sizeOfButton &&
      show
    )
    {
      print("right stop button has been pressed\n");
    }
}
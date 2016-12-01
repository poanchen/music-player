//global variables
boolean left_play_btn_pressed = false;
boolean right_play_btn_pressed = false;
boolean right_pause_btn_pressed = false;
boolean right_stop_btn_pressed = false;

void mousePressed()
{
  if(mouseButton == LEFT)
  {
    //show left side
    if(!show)
    {
      isLeftPlayButtonPressed();
      isLeftStopButtonPressed();
    }
    //show right side
    else
    {
      isRightPauseButtonPressed();
      isRightStopButtonPressed();
      isRightPlayButtonPressed();
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
      left_play_btn_pressed = true;
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
      reset = true;
    }
}

void isRightPauseButtonPressed()
{
  if(
      mouseX >= right_pause_btn_x &&
      mouseX <= right_pause_btn_x+sizeOfButton &&
      mouseY >= right_pause_btn_y &&
      mouseY <= right_pause_btn_y+sizeOfButton &&
      show &&
      !showPlayButton
    )
    {
      print("right pause button has been pressed\n");
      right_pause_btn_pressed = true;
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
      right_stop_btn_pressed = true;
      reset = true;
    }
}

void isRightPlayButtonPressed()
{
  if(
      mouseX >= right_play_btn_x &&
      mouseX <= right_play_btn_x+sizeOfButton &&
      mouseY >= right_play_btn_y &&
      mouseY <= right_play_btn_y+sizeOfButton &&
      show &&
      showPlayButton
    )
    {
      print("right play button has been pressed\n");
      right_play_btn_pressed = true;
    }
}
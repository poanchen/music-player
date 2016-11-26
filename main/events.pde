void mousePressed()
{
  if(mouseButton == LEFT)
  {
    isPlayButtonPressed();
    isStopButtonPressed();
  }
}

void isPlayButtonPressed()
{
  if(
      mouseX >= left_play_btn_x &&
      mouseX <= left_play_btn_x+sizeOfButton &&
      mouseY >= left_play_btn_y &&
      mouseY <= left_play_btn_y+sizeOfButton
    )
    {
      print("left play button has been pressed\n");
    }
}

void isStopButtonPressed()
{
  if(
      mouseX >= left_stop_btn_x &&
      mouseX <= left_stop_btn_x+sizeOfButton &&
      mouseY >= left_stop_btn_y &&
      mouseY <= left_stop_btn_y+sizeOfButton
    )
    {
      print("left stop button has been pressed\n");
    }
}
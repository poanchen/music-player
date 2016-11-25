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
      mouseX >= play_btn_x &&
      mouseX <= play_btn_x+sizeOfButton &&
      mouseY >= play_btn_y &&
      mouseY <= play_btn_y+sizeOfButton
    )
    {
      print("test1\n");
    }
}

void isStopButtonPressed()
{
  if(
      mouseX >= stop_btn_x &&
      mouseX <= stop_btn_x+sizeOfButton &&
      mouseY >= stop_btn_y &&
      mouseY <= stop_btn_y+sizeOfButton
    )
    {
      print("test2\n");
    }
}
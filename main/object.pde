//size of button
int sizeOfButton = 55;

//pos for play button
int play_btn_x = 0;
int play_btn_y = 0;

//pos for stop button
int stop_btn_x = 0;
int stop_btn_y = sizeOfButton;

//play button on the left
void drawLeftPlayButton()
{
  rect(play_btn_x, play_btn_y, sizeOfButton, sizeOfButton);
}

//play button on the right
void drawRightPlayButton()
{
  rect(play_btn_x, play_btn_y, sizeOfButton, sizeOfButton);
}

//stop button
void drawLeftStopButton()
{
  rect(stop_btn_x, stop_btn_y, sizeOfButton, sizeOfButton);
}

//stop button
void drawRightStopButton()
{
  rect(stop_btn_x, stop_btn_y, sizeOfButton, sizeOfButton);
}
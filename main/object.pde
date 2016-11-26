//pos for left play button
int left_play_btn_x;
int left_play_btn_y;

//pos for right pause button
int pause_play_btn_x;
int pause_play_btn_y;

//pos for left stop button
int left_stop_btn_x;
int left_stop_btn_y;

//pos for right stop button
int right_stop_btn_x;
int right_stop_btn_y;

//size of button
int sizeOfButton = 55;

//play button on the left
void drawLeftPlayButton()
{
  left_play_btn_x = 0;
  left_play_btn_y = 0;
  rect(left_play_btn_x, left_play_btn_y, sizeOfButton, sizeOfButton);
}

//pause button on the right
void drawRightPauseButton()
{
  pause_play_btn_x = width-sizeOfButton;
  pause_play_btn_y = 0;
  rect(pause_play_btn_x, pause_play_btn_y, sizeOfButton, sizeOfButton);
}

//stop button on the left
void drawLeftStopButton()
{
  left_stop_btn_x = 0;
  left_stop_btn_y = sizeOfButton;
  rect(left_stop_btn_x, left_stop_btn_y, sizeOfButton, sizeOfButton);
}

//stop button on the right
void drawRightStopButton()
{
  right_stop_btn_x = width-sizeOfButton;
  right_stop_btn_y = sizeOfButton;
  rect(right_stop_btn_x, right_stop_btn_y, sizeOfButton, sizeOfButton);
}
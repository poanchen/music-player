//pos for left play button
int left_play_btn_x;
int left_play_btn_y;

//pos for right pause button
int right_pause_btn_x;
int right_pause_btn_y;

//pos for left stop button
int left_stop_btn_x;
int left_stop_btn_y;

//pos for right stop button
int right_stop_btn_x;
int right_stop_btn_y;

//pos for right play button
int right_play_btn_x;
int right_play_btn_y;

//size of button
int sizeOfButton = 55;

// pos of x and y for the background image
int imgW = 600, imgH = 450;
int extraOuterSpace = 32;
float bg_px = 0;
float bg_py = 0;
float bg_px_v = random(-2, 2);
float bg_py_v = random(-2, 2);

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
  right_pause_btn_x = width-sizeOfButton;
  right_pause_btn_y = 0;
  rect(right_pause_btn_x, right_pause_btn_y, sizeOfButton, sizeOfButton);
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

//play button on the right
void drawRightPlayButton()
{
  right_play_btn_x = width-sizeOfButton;
  right_play_btn_y = 0;
  rect(right_play_btn_x, right_play_btn_y, sizeOfButton, sizeOfButton);
}

void drawBackgroundImage()
{
  image(img, bg_px, bg_py);
}

void moveBackgroundImage()
{
  bg_px += bg_px_v;
  bg_py += bg_py_v;
  
  float [] top_left_array = {bg_px, bg_px_v, bg_py, bg_py_v};
  top_left_array = checkForBounce(top_left_array);
  bg_px = int(top_left_array[0]);
  bg_px_v = top_left_array[1];
  bg_py = int(top_left_array[2]);
  bg_py_v = top_left_array[3];
  float [] top_left_v_array = {bg_px_v, bg_py_v};
  top_left_v_array = limitSpeed(top_left_v_array);//ensure speed is reasonable
  bg_px_v = top_left_v_array[0];
  bg_py_v = top_left_v_array[1];
}

float [] checkForBounce(float [] enemy_pos_array)
{
  int enemy_x = int(enemy_pos_array[0]);
  float enemy_x_v = enemy_pos_array[1];
  int enemy_y = int(enemy_pos_array[2]);
  float enemy_y_v = enemy_pos_array[3];

  if(
    enemy_x > width + extraOuterSpace ||
    enemy_x < 0 - extraOuterSpace ||
    enemy_x + imgW > width + extraOuterSpace
    )
  {
    enemy_x -= enemy_x_v;//move it back in bounds
    enemy_x_v *= -1;//turn it around
    enemy_x_v *= random(0.5, 1);//make it a bit faster or slower
    enemy_y_v *= random(0.5, 2);
  }
  
  if(
    enemy_y > height + extraOuterSpace || 
    enemy_y < 0 - extraOuterSpace ||
    enemy_y + imgH > height + extraOuterSpace
    )
  {
    enemy_y -= enemy_y_v;//move it back in bounds
    enemy_y_v *= -1;//reverse
    enemy_x_v *= random(0.5, 2);//make it a bit faster or slower
    enemy_y_v *= random(0.5, 1);
  }
  
  enemy_pos_array[0] = enemy_x;
  enemy_pos_array[1] = enemy_x_v;
  enemy_pos_array[2] = enemy_y;
  enemy_pos_array[3] = enemy_y_v;

  return enemy_pos_array;
}

float [] limitSpeed(float [] enemy_v_array)
{
  float enemy_x_v = enemy_v_array[0];
  float enemy_y_v = enemy_v_array[1];
  
  //ensure speed isn't too fast
  while(dist(0,0, enemy_x_v, enemy_y_v) > 3)
  {
    //reduce speed equally for vx and vy
    //so the direction is preserved
    enemy_x_v *= 0.9;
    enemy_y_v *= 0.9;
  }
  
  //ensure speed isn't too slow
  while(dist(0,0, enemy_x_v, enemy_y_v) < 1)
  {
    //increase speed equally for vx and vy
    //so the direction is preserved
    enemy_x_v *= 1.1;
    enemy_y_v *= 1.1;
  }
  
  enemy_v_array[0] = enemy_x_v;
  enemy_v_array[1] = enemy_y_v;
  
  return enemy_v_array;
}
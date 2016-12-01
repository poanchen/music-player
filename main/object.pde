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

//maximum number of leaves in one row
int maxTotalLeaves = 12;
int rightPaddleForLeaves = 50;
//pos of each leaves
int i = 0;
//switch to different look of leaves
int j = 0;
//speed for next leaves
int speedForNextLeaves = 100;

// pos of x and y for the background image
int imgW = 600, imgH = 450;
int extraOuterSpace = 32;
float bg_px = 0;
float bg_py = 0;
float bg_px_v = random(-2, 2);
float bg_py_v = random(-2, 2);

//pos of x and y for leave
int leaves_x;
int leaves_y;

//play button on the left
void drawLeftPlayButton()
{
  left_play_btn_x = 0;
  left_play_btn_y = 0;
  rect(left_play_btn_x, left_play_btn_y, sizeOfButton, sizeOfButton);
  image(play_btn_img, left_play_btn_x, left_play_btn_y);
}

//pause button on the right
void drawRightPauseButton()
{
  right_pause_btn_x = width-sizeOfButton;
  right_pause_btn_y = 0;
  rect(right_pause_btn_x, right_pause_btn_y, sizeOfButton, sizeOfButton);
  image(pause_btn_img, right_pause_btn_x, right_pause_btn_y);
}

//stop button on the left
void drawLeftStopButton()
{
  left_stop_btn_x = 0;
  left_stop_btn_y = sizeOfButton;
  rect(left_stop_btn_x, left_stop_btn_y, sizeOfButton, sizeOfButton);
  image(reset_btn_img, left_stop_btn_x, left_stop_btn_y);
}

//stop button on the right
void drawRightStopButton()
{
  right_stop_btn_x = width-sizeOfButton;
  right_stop_btn_y = sizeOfButton;
  rect(right_stop_btn_x, right_stop_btn_y, sizeOfButton, sizeOfButton);
  image(reset_btn_img, right_stop_btn_x, right_stop_btn_y);
}

//play button on the right
void drawRightPlayButton()
{
  right_play_btn_x = width-sizeOfButton;
  right_play_btn_y = 0;
  rect(right_play_btn_x, right_play_btn_y, sizeOfButton, sizeOfButton);
  image(play_btn_img, right_play_btn_x, right_play_btn_y);
}

//draw activity leaves down below
void drawActivityLeaves()
{
  int a = 0;
  int b = 0;
  int c = 0;
  PImage [] leaves = {leaves1_img, leaves2_img, leaves3_img};

  //make sure it only plays when the audio is running
  if(fc % speedForNextLeaves == 0 && startedTime > 0)
  {
    //make sure it stays in width of the window
    if(i < maxTotalLeaves)
    {
      drawBackgroundImage();
      if(j < 3)
      {
        //show the leaves
        image(leaves[j], leaves_x, leaves_y);
        //add some space between the leaves
        leaves_x += rightPaddleForLeaves;
        //prepare for next leave
        j += 1;
        if(j == 3)
        {
          //back to display the leaves1
          j = 0;
        }
      }
      //prepare for next leaves
      i += 1;
      //say we have 0, 1, 2
      //then instead of having 0, 1, 2, 0
      //we decided to remove the first node to become
      //1, 2, 0 from 0, 1, 2, 0
      if(i > 3)
      {
        drawBackgroundImage();
        //make sure each leaf follow by one another
        if(j == 1)
        {
          a = 0;
          b = 1;
          c = 2;
        }
        else if(j == 2)
        {
          a = 1;
          b = 2;
          c = 0;
        }
        else if(j == 0)
        {
          a = 2;
          b = 0;
          c = 1;
        }
        //show the past three leaves
        image(leaves[a], leaves_x - rightPaddleForLeaves * 4, leaves_y);
        image(leaves[b], leaves_x - rightPaddleForLeaves * 3, leaves_y);
        image(leaves[c], leaves_x - rightPaddleForLeaves * 2, leaves_y);
      }
      else
      {
        //this will only run the first time
        if(i == 2)
        {
          image(leaves[0], leaves_x - rightPaddleForLeaves * 2, leaves_y);
        }
        else if(i == 3)
        {
          image(leaves[0], leaves_x - rightPaddleForLeaves * 3, leaves_y);
          image(leaves[1], leaves_x - rightPaddleForLeaves * 2, leaves_y);
        }
      }
    }
    else
    {
      drawBackgroundImage();
      //making sure that the leaves are sync
      if(j == 1)
      {
       a = 2;
       b = 1;
       c = 0;
      }
      else if(j == 2)
      {
       a = 0;
       b = 2;
       c = 1;
      }
      else if(j == 0)
      {
       a = 1;
       b = 0;
       c = 2;
      }
      
      //here i - maxTotalLeaves could have value of 0, 1, 2
      //this is for fixing the edge case where all the leaves are at the far right like
      //0, 1, 2
      //when i - maxTotalLeaves = 0
      //1, 2 will show
      //when i - maxTotalLeaves = 1
      //1 will show
      //when i - maxTotalLeaves = 2
      //nothing will show
      for(int s = 2; s < 3 - (i - maxTotalLeaves) + 1; s++)
      {
        if(s == 2)
        {
          image(leaves[a], leaves_x - rightPaddleForLeaves * s, leaves_y);
        }
        else if(s == 3)
        {
          image(leaves[b], leaves_x - rightPaddleForLeaves * s, leaves_y);
        }
      }
      
      //this is for re-merge when the audio is still playing in the background
      if(show)
      {
        //when far right became 1, 2 from 0, 1, 2
        //the 0 should be moved to the far left
        if((i - maxTotalLeaves) == 0)
        {
          image(leaves[c], leaves_x - rightPaddleForLeaves * maxTotalLeaves, leaves_y);
        }
        //when far right became 2 from 1, 2
        //the 0, 1 should be moved to the far left
        else if((i - maxTotalLeaves) == 1)
        {
          image(leaves[c], leaves_x - rightPaddleForLeaves * maxTotalLeaves, leaves_y);
          image(leaves[b], leaves_x - rightPaddleForLeaves * (maxTotalLeaves - 1), leaves_y);
        }
        //when far right became nothing from 2
        //the 0, 1, 2 should be moved to the far left
        else if((i - maxTotalLeaves) == 2)
        {
          image(leaves[c], leaves_x - rightPaddleForLeaves * maxTotalLeaves, leaves_y);
          image(leaves[b], leaves_x - rightPaddleForLeaves * (maxTotalLeaves - 1), leaves_y);
          image(leaves[a], leaves_x - rightPaddleForLeaves * (maxTotalLeaves - 2), leaves_y);
          //making sure that we have the correct value of j so that on the top,
          //it will continue to sync without messing the leaves order
          if(j == 0)
          {
            j = 2;
          }
          else if(j == 2)
          {
            j = 1;
          }
          else if(j == 1)
          {
            j = 0;
          }
          //so that we can continue on on the top
          i = 2;
          leaves_x = 0;
          //set the leaves_x to be at the forth position to carry on from here for the top
          leaves_x += rightPaddleForLeaves * 3;
        }
      }
      i += 1;
    }
  }
}

void drawBackgroundImage()
{
  image(bg_img, bg_px, bg_py);
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
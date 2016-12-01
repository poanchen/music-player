import processing.sound.*;

//for all images
PImage bg_img, play_btn_img, pause_btn_img, reset_btn_img, leaves1_img, leaves2_img, leaves3_img;
SoundFile file;
int fc = 0;//frame counter, 60x per sec
String bgImgName = "the bridge.jpg";
String playBtnImgName = "play.png";
String pauseBtnImgName = "pause.png";
String resetBtnImgName = "reset.png";
//all the leaves image
String leaves1 = "leaves1.png";
String leaves2 = "leaves2.png";
String leaves3 = "leaves3.png";
String songName = "sample.mp3";
int numberOfSecsInSong = 29;
float startedTime = 0.0;
float dur = 0.0;
//false means show left buttons
//true means show right buttons
boolean show = false;
boolean reset = false;
boolean showPlayButton = false;

void setup()
{
  //load all the images
  bg_img = loadImage(bgImgName);
  leaves1_img = loadImage(leaves1);
  leaves2_img = loadImage(leaves2);
  leaves3_img = loadImage(leaves3);
  play_btn_img = loadImage(playBtnImgName);
  pause_btn_img = loadImage(pauseBtnImgName);
  reset_btn_img = loadImage(resetBtnImgName);
  size(560,410);//set window size
  drawBackgroundImage();
  drawLeftPlayButton();
  drawLeftStopButton();
  file = new SoundFile(this, sketchPath(songName));
  //starting point for leaves
  //bottom left
  leaves_x = 0;
  leaves_y = 360;
}

void draw()
{  
  if(!reset)
  {
    if(show)
    {
      //let's show all the buttons on the right side
      //as it seems that the play button has been pressed
      showRightButtons(showPlayButton);
    }
    else
    {
      //let's show all the buttons on the left side
      showLeftButtons();
    }
      
    if(left_play_btn_pressed)
    {
      //start playing the audio
      file.play();
      startedTime = millis();
      left_play_btn_pressed = false;
    }
    else if(right_play_btn_pressed)
    {
      //let's continue play the audio
      if(dur/1000 < numberOfSecsInSong)
      {
        //carry on where we left of
        file.jump(dur/1000);
      }
      else
      {
        //start from the beginning
        file.jump(0);
        dur = 0.0;
      }
      startedTime = millis();
      showPlayButton = false;
      right_play_btn_pressed = false;
      showRightButtons(showPlayButton);
    }
    else if(right_pause_btn_pressed)
    {
      //let's puase the audio
      file.stop();
      dur += millis() - startedTime;
      showPlayButton = true;
      right_pause_btn_pressed = false;
    }
  }
  else
  {
    //back to what it looked like in the beginning
    resetAll();
  }
  
  drawActivityLeaves();
  fc++;
}

void resetAll()
{
  show = false;
  
  if(right_stop_btn_pressed)
  {
    file.jump(0);
    file.stop();
  }
  dur = 0.0;
  reset = false;
  drawBackgroundImage();
  drawLeftPlayButton();
  drawLeftStopButton();
}

void showRightButtons(boolean playOrPause)
{
  if(playOrPause)
  {
    drawRightPlayButton();
  }
  else
  {
    drawRightPauseButton();
  }
  drawRightStopButton();
}

void showLeftButtons()
{
  drawLeftPlayButton();
  drawLeftStopButton();
}
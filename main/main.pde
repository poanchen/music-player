import processing.sound.*;

PImage img;
SoundFile file;
String bgImgName = "the bridge.jpg";
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
  img = loadImage(bgImgName);
  size(600, 450);//set window size
  background(img);
  drawLeftPlayButton();
  drawLeftStopButton();
  file = new SoundFile(this, sketchPath(songName));
}

void draw()
{  
  if(!reset)
  {
    if(show)
    {
      showRightButtons(showPlayButton);
    }
    
    if(left_play_btn_pressed)
    {
      file.play();
      startedTime = millis();
      left_play_btn_pressed = false;
    }
    else if(right_play_btn_pressed)
    {
      if(dur/1000 < numberOfSecsInSong)
      {
        file.jump(dur/1000);
      }
      else
      {
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
      file.stop();
      dur += millis() - startedTime;
      showPlayButton = true;
      right_pause_btn_pressed = false;
    }
  }
  else
  {
    resetAll();
  }
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
  background(img);
  drawLeftPlayButton();
  drawLeftStopButton();
}

void showRightButtons(boolean playOrPause)
{
  background(img);
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
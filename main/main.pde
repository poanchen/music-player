import processing.sound.*;

PImage img;
SoundFile file;
String bgImgName = "the bridge.jpg";
String songName = "sample.mp3";
int numberOfSecsInSong = 29;
float startedTime = 0;
float dur = 0;
//false means show left buttons
//true means show right buttons
boolean show = false;

void setup()
{
  img = loadImage(bgImgName);
  size(600, 450);//set window size
  background(img);
  drawLeftPlayButton();
  drawLeftStopButton();
  //file = new SoundFile(this, sketchPath(songName));
}

void draw()
{
  if(show)
  {
    showRightButtons();
  }
}

void resetAll()
{
  show = false;
  dur = 0.0;
  startedTime = 0.0;
  background(img);
  drawLeftPlayButton();
  drawLeftStopButton();
}

void showRightButtons()
{
  background(img);
  drawRightPauseButton();
  drawRightStopButton();
}
import processing.sound.*;

PImage img;
SoundFile file;
String bgImgName = "the bridge.jpg";
String songName = "sample.mp3";
int numberOfSecsInSong = 29;
float startedTime = 0;
float dur = 0;

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
}

void showRightButtons()
{
  background(img);
  drawRightPauseButton();
  drawRightStopButton();
}
PImage img;
String bgImgName = "the bridge.jpg";

void setup()
{
  img = loadImage(bgImgName);
  size(600, 450);//set window size
  background(img);
  drawLeftPlayButton();
  drawLeftStopButton();
}

void draw()
{
}
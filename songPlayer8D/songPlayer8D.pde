import processing.sound.*;

SoundFile file;
float frequency;
float angle = 0;
SinOsc sine;


void setup() {
  size(640, 360);
  background(255);
  file = new SoundFile(this, "sample.mp3");
  file.loop();
  file.rate(0.8);
}


void draw() {
  
}

 

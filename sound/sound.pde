import processing.sound.*;

float frequency;
float angle = 0;
SinOsc sine;


void setup() {
  size(640, 360);
  background(255);
    d
  // Create the sine oscillator.
  sine = new SinOsc(this);
  sine.play();
}


void draw() {
  sine.freq(frequency);
  sine.pan(map(sin(degrees(angle)), 0, 1, -1, 1));
  angle+=0.001;
  if(angle>90){ angle = 0; }
}


void keyPressed(){
  if(key == 'a'){ frequency = 1*5000/8; }
  if(key == 's'){ frequency = 2*5000/8; }
  if(key == 'd'){ frequency = 3*5000/8; }
  if(key == 'f'){ frequency = 4*5000/8; }
  if(key == 'j'){ frequency = 5*5000/8; }
  if(key == 'k'){ frequency = 6*5000/8; }
  if(key == 'l'){ frequency = 7*5000/8; }
  if(key == ';'){ frequency = 8*5000/8; }

}
 
 

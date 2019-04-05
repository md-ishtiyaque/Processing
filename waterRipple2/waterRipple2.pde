//import processing.sound.*;

//SoundFile file;
int rippleCount;
int maxRippleCount = 200;
Ripple[] r = new Ripple[maxRippleCount];


void setup(){
  fullScreen();
  background(0);
  colorMode(HSB, 360, 100, 100);
  noFill();
  //file = new SoundFile(this, "sample.mp3");
  //file.rate(1.2);
  for(int i=0;i<maxRippleCount;i++){
    r[i] = new Ripple(0, 0, false);
  }
}


void draw(){
  background(0); 
  for(int i=0;i<maxRippleCount;i++){
    r[i].update();
    r[i].display();
  }
}


void mouseDragged(){
  r[rippleCount].centerX = mouseX;
  r[rippleCount].centerY = mouseY;
  r[rippleCount].exists = true;
  r[rippleCount].size = 0;  
  rippleCount = (rippleCount+1)%maxRippleCount;
  //file.play();
}


void mousePressed(){
  r[rippleCount].centerX = mouseX;
  r[rippleCount].centerY = mouseY;
  r[rippleCount].exists = true;
  r[rippleCount].size = 0;  
  rippleCount = (rippleCount+1)%maxRippleCount;
}

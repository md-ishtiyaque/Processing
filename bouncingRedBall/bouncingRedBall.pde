float radius = 50;
PVector loc, vel;
int maxRippleCount = 4, rippleCount;
Ripple[] r = new Ripple[maxRippleCount];

void setup(){
  fullScreen();
  background(0);
  frameRate(100);
  colorMode(HSB, 360, 100, 100);
  loc = new PVector(random(radius, width - radius),random(radius, height - radius));
  vel = new PVector(5, 5); 
  for(int i = 0; i < maxRippleCount; i++)
    r[i] = new Ripple(0, 0, 0, false);
}


void draw(){
  drawBall();
  drawRipple();
}


void drawBall(){
  background(0);
  noStroke();
  fill(frameCount/2, 100, 100);
  ellipse(loc.x, loc.y, 2*radius, 2*radius);
  loc.x += vel.y;
  loc.y += vel.x;
  if(loc.y>height-radius || loc.y<radius){
    vel.x *= -1;
    r[rippleCount] = new Ripple(loc.x, loc.y, frameCount/2, true);
    rippleCount = (rippleCount+1)%maxRippleCount;
  }
  if(loc.x>width-radius|| loc.x<radius){
    vel.y *= -1;
    r[rippleCount] = new Ripple(loc.x, loc.y, frameCount/2, true);
    rippleCount = (rippleCount+1)%maxRippleCount;
  }
}


void drawRipple(){
  for(int i = 0; i < maxRippleCount; i++){
    r[i].update();
    r[i].display();
  }
}

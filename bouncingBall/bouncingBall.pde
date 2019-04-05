float radius = 70;
PVector loc, vel, noiz;
int maxRippleCount = 4, rippleCount;
Ripple[] r = new Ripple[maxRippleCount];
int hue;
int expandX, expandY;


void setup(){
  fullScreen();
  background(0);
  frameRate(100);
  colorMode(HSB, 360, 100, 100);
  
  loc = new PVector(random(radius, width - radius),random(radius, height - radius));
  vel = new PVector(7, 7); 
  noiz = new PVector(0, 0);
  
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
  hue = (hue + 1) % 360;
  fill(hue, 100, 100);
  
   beginShape();
  for(int i = 0; i < 50; i++){
    float theta = i *TWO_PI/50;
    vertex(loc.x + (radius + expandX) * cos(theta) + noise(noiz.x)*20 - 10,
    loc.y + (radius + expandY) * sin(theta) + noise(noiz.y)*20 - 10);
    noiz.x += 0.2;
    noiz.y += 0.19;
  }
  endShape();
  
  noiz.x = frameCount/10;
  noiz.y = frameCount/10.2;
  loc.x += vel.y;
  loc.y += vel.x;
  if (expandX>0){ expandX--;}
  if (expandY>0){ expandY--;}
  if (expandX<0){ expandX++;}
  if (expandY<0){ expandY++;}
  
  if(loc.y > height - radius || loc.y < radius){
    vel.x *= -1;
    float value;
    if(loc.y > height - radius) value = radius;
    else value = - radius;
    r[rippleCount] = new Ripple(loc.x, loc.y + value, hue, true);
    rippleCount = (rippleCount+1)%maxRippleCount;
    expandX = 30;
    expandY = -30;
  }
  
  if(loc.x > width - radius || loc.x < radius){
    vel.y *= -1;
    float value;
    if(loc.x > width - radius) value = radius;
    else value = - radius;
    r[rippleCount] = new Ripple(loc.x + value, loc.y, hue, true);
    rippleCount = (rippleCount+1)%maxRippleCount;
    expandY = 30;
    expandX = -30;
  }
}


void drawRipple(){
  for(int i = 0; i < maxRippleCount; i++){
    r[i].update();
    r[i].display();
  }
}

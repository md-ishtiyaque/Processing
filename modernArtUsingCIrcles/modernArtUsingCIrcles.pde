float x, y;
void setup(){
  fullScreen();background(0);noFill();
  colorMode(HSB, 360, 100, 100);
}

void draw(){
  fill(0, 5);
  rectMode(CENTER);noStroke();
  rect(width/2, height/2,width,height); 
  stroke((frameCount)%360, 100, 100);
  ellipse(noise(x+=0.007)*width, noise(y+=0.008)*height, 100, 100);
}

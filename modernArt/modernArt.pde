int flag = 1;
int shapeSize=100;
boolean button;
void setup(){
  background(0);
  size(displayWidth, displayHeight);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  frameRate(1000);
}
void draw(){
  translate(width/2, height/2);
  translate(random(-width/2-50, width/2), random(-height/2-50, height/2));
  fill(random(0, 360), 100, 100 );
  beginShape();
  float sideCount = random(5, 15);
  for(int i=0;i<sideCount;i++){
    vertex(random(-shapeSize, shapeSize), random(-shapeSize, shapeSize));
  }
  endShape();
}

void mousePressed(){
  save("modernArt.png");
  button = !button;
  if(button){ noLoop(); }
  else loop();
}

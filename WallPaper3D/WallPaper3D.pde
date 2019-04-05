PShape ball;
PImage surfaceTexture;
PVector loc, vel;
float radius = 50;
float temp;

void setup(){
  fullScreen(P3D);
  noStroke();
  loc = new PVector(width/2, height/2, 500);
  vel = new PVector(10, 10, 10); 
  ball = createShape(SPHERE, 2*radius);
  colorMode(HSB, 360, 100, 100);
  surfaceTexture = loadImage("surfaceTexture.jpg");
  ball.setTexture(surfaceTexture);
}

void draw(){
  drawBox();
  drawBall();
  
}


void drawBox(){
  
  //Back
  pushMatrix();
  rectMode(CENTER);
  translate(width/2, height/2, -1000);
  fill(30);
  rect(0, 0, width, height);
  popMatrix();
  
  //Left
  pushMatrix();
  rectMode(CENTER);
  translate(0 , height/2, -500);
  rotateY(PI/2);
  fill(40);
  rect(0, 0, width, height);
  popMatrix();
  
  //Right
  pushMatrix();
  rectMode(CENTER);
  translate(width , height/2, -500);
  rotateY(PI/2);
  fill(40);
  rect(0, 0, width, height);
  popMatrix();
  
  //Up
  pushMatrix();
  rectMode(CENTER);
  translate(width/2 , 0, -500);
  rotateX(PI/2);
  fill(50);
  rect(0, 0, width, width);
  popMatrix();
  
  //Down
  pushMatrix();
  rectMode(CENTER);
  translate(width/2 , height, -500);
  rotateX(PI/2);
  fill(50);
  rect(0, 0, width, width);
  popMatrix();
}


void drawBall(){
  loc.add(vel);
  if(loc.x > width - radius|| loc.x < radius){ vel.x = -vel.x; }
  if(loc.y > height - radius|| loc.y < radius){ vel.y = -vel.y; }
  if(loc.z > 1000 - radius|| loc.z < radius){ vel.z = -vel.z; }
  ambientLight(0, 0, map(loc.z, 0, 1000, 100, 30));
  
  pushMatrix();
  translate(loc.x, loc.y, -loc.z);
  shape(ball);
  popMatrix();
}

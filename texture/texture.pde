PImage earthImg, stars, sunImg, moonImg; 
PShape earth, sun, moon, observableUniverse;
float earthSpeed,moonSpeed;
float sunX, sunY, earthX, earthY, moonX, moonY;
float zoom = 500, prevX;
float valueX, valueY;
boolean firstTime = true;
void setup(){
  size(displayWidth, displayHeight, P3D);
  noStroke();
  
  stars = loadImage("stars.jpg");
  sunImg = loadImage("sun.jpg");
  earthImg = loadImage("earth.jpg");
  moonImg = loadImage("moon.jpg");
  
  observableUniverse = createShape(SPHERE, 1000); 
  sun = createShape(SPHERE, 100);
  earth = createShape(SPHERE, 50); 
  moon = createShape(SPHERE, 15);
  
  observableUniverse.setTexture(stars);
  sun.setTexture(sunImg);
  earth.setTexture(earthImg);
  moon.setTexture(moonImg);
  colorMode(HSB, 360, 100, 100);
}


void draw(){
  ambientLight( 0, 0, 80);
  camera(width/2 + zoom , height/2  ,  0, width/2, height/2, 0, 0, 0, -1.0);
  renderCelestialBodies();
  
}


void drawAxis(){
  stroke(0, 100, 100);
  line(width/2, 0, width/2, height);
  stroke(120, 100, 100);
  line(0, height/2, width, height/2);
  stroke(240, 100, 100);
  line(width/2, height/2, -500, width/2, height/2, 500);
}


void renderCelestialBodies(){
    rotateY(valueY);
  
  pushMatrix();
  sunX = width/2;
  sunY = height/2;
  translate(sunX, sunY, 600*valueY);
  pointLight(60, 100, 100, 0, 0, 0);
  rotateX(PI/2);
  rotateY(earthSpeed/15);
  shape(observableUniverse);
  rotateY(earthSpeed);
  shape(sun);
  popMatrix();
  
  pushMatrix();
  earthX = sunX + 350 * cos(earthSpeed);
  earthY = sunY + 350 * sin(earthSpeed);
  translate(earthX, earthY, 600*valueY);earthSpeed+=PI/(360*2);
  rotateX(-PI/2);
  rotateY(earthSpeed*10);
  shape(earth);
  popMatrix();
  
  pushMatrix();
  moonX = earthX + 100 * cos(moonSpeed);
  moonY = earthY + 100 * sin(moonSpeed);
  translate(moonX, moonY, 600*valueY);moonSpeed+=PI/(100);
  rotateX(-PI/2);
  rotateY(moonSpeed);
  shape(moon);
  popMatrix();
}


void mouseDragged(){
   if(firstTime){ 
    prevX = mouseX;
     firstTime = false;
  }
  if(mouseX>3*width/4){ valueY = map(mouseY, 0, height, -PI/5, PI/5);}
  valueX = -(mouseX - prevX);
  rotateZ(map(mouseX, 0, width, 0, 2*PI));
  if(mouseY>height/4){
    earthSpeed += valueX/100;
  }
  if(mouseY<height/4){
    zoom += valueX;
    if(zoom<0) zoom =10;
    if(zoom>1000) zoom = 1000;
  }
  prevX = mouseX;
}


void mouseReleased(){
  firstTime = true;
}

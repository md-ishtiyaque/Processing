PShape Ish;
PImage IshImg;
void setup(){
  size(600, 600, P3D);
  colorMode(HSB, 360, 100, 100);
  Ish = createShape(SPHERE, 150);
  IshImg = loadImage("ISHTIYAQUE.jpg");
  Ish.setTexture(IshImg);
}


void draw(){
  ambientLight( 0, 0, 100);
  background(255);
  translate(width/2, height/2);
  shape(Ish);
}

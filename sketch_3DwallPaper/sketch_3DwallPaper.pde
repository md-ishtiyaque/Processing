//PShape[] p = new Planet[5];
PShape planets;
float x, y;

void setup(){
  fullScreen(P3D);
  planets = createShape(SPHERE, 100);
}

void draw(){
  background(0);
  translate(width/2+ x++, height/2 + y++);
  lights();
  shape(planets);
}

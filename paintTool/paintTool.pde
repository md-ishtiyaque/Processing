int i, x=300, y=200, precision=1;
void setup(){
  size(600, 400);
  strokeWeight(1);
  stroke(255);
  background(0);
}
void draw(){
}
void keyPressed(){
  if(key == '2'){ y+=precision; }
  if(key == '8'){ y-=precision; }
  if(key == '4'){ x-=precision; }
  if(key == '6'){ x+=precision; }
  if(key == '7'){ x-=precision;y-=precision; }
  if(key == '9'){ x+=precision;y-=precision; }
  if(key == '1'){ x-=precision;y+=precision; }
  if(key == '3'){ x+=precision;y+=precision; }
  point(x, y);
}
void mousePressed(){
  x = mouseX;
  y = mouseY;
}

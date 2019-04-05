float theta;
void setup(){
  size(650, 650);
  stroke(180, 180, 0);
  frameRate(100);
}

void draw(){
  background(0, 255, 255);
  theta = map(mouseX, 0, width, 0, TWO_PI);  
  if(theta>=TWO_PI){ exit(); }
   fill(255, 255, 0);
  for(int i=0;i<300;i++){
    ellipse(width/2  + 0.75 *i* cos(i*theta), height/2 + 40 + 0.75*i*sin(i*theta), 20, 20);
  }
  fill(150);
  textSize(100);
  text(theta/TWO_PI*100 , 70, 80);
  text("%", 520, 80);
  saveFrame("frame/#####.png");
  //theta+=TWO_PI/1000;

}

void setup(){
  size(400, 400);
}


void draw(){
  background(0);
  stroke(255);
  textSize(90);
  text("TIME", 80, 170);
  text("TABLE", 60, 270);
  save("timeTable.jpg");
  noLoop();
}

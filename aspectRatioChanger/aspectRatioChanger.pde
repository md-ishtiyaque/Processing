PImage img;
void setup(){
  size(5171, 5171);
  img = loadImage("img.jpg");
  noLoop();
}


void draw(){
  background(255);
  image(img, width/4, 0, width/2, height);
  save("output.png");
}

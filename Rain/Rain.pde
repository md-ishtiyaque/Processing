int i;
int dropCount = 300;
Drop[] d = new Drop[dropCount];
void setup(){
  fullScreen(); 
  background(0);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  fill(210, 50, 100);
  for(i=0;i<dropCount;i++)
  {
    d[i] =new Drop();
  }
}
void draw(){
  background(0);
  for(i=0;i<dropCount;i++){
    d[i].update();
    d[i].display();
  }
}

int i, starCount = 1000;
Star[] s = new Star[1000];
void setup()
{
  fullScreen();
  background(0);
  frameRate(25);
  strokeWeight(1);
  for(i=0;i<1000;i++)
  {
    s[i] =new Star();
  }
}
void draw()
{
  background(0);
  for(i=0;i<1000;i++)
  {
    s[i].update();
    s[i].display();
  }
}

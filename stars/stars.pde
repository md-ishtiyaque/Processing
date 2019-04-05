int x,y;
void setup()
{
  size(600, 600);
}
void draw()
{
  background(51);
  loadPixels();
  for(x=0;x<width;x++)
  {
      for(y=0;y<height;y++)
      {
        int index = x + y* width;
        float d =10000/ dist(x, y, width/2, height/2);
        pixels[index] = color(d);
      }
  }
  updatePixels();
}
  

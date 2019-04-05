Star[] star = new Star[500];
int i;
void setup()
{
  size(600, 600);
  background(0);
  stroke(255);
  strokeWeight(4);
  for(i=0;i<500;i++) { star[i] = new Star(); } //star[i].update(); }
}
void draw()
{
  background(0);
  for(i=0;i<500;i++) { star[i].update(); }
}

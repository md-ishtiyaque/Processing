int[] a = new int[500];
int i;
void setup()
{
  background(0);
  size(600, 600);
  for(i=0;i<500;i++)
  {
    a[i] = round(random(1, height));
  }  
}


  

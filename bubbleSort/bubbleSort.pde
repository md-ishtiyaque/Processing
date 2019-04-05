int array_size = 120;
int[] a = new int[array_size];
int i, k, temp;
void setup()
{
  background(0);
  fullScreen();
  frameRate(10000);
  stroke(255);
  strokeWeight(displayWidth/array_size);
  for(i=0;i<array_size;i++)
  {
    a[i] = round(random(1, height));
  }  
  display(k);
}


void draw()
{
  update(); 
} 


void display(int k)
{
  for(i=1;i<array_size;i++)
  {
    stroke(255);
    if(i == k)
    {
     stroke(255, 0, 0); 
    }
    line(displayWidth/array_size*i, height, displayWidth/array_size*i, a[i]);
  }
}


void update()
{
  for(i=-0;i<array_size-1;i++)
  {
    for(k=0;k<array_size-i-1;k++)
    {
      if(a[k]>a[k+1])
      {
        temp = a[k+1];
        a[k+1] = a[k];
        a[k] = temp;
        background(0);
        display(k);
      }
    }
  } 
}  
  


  

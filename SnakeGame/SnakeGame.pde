int count, dirx, diry;
int i, j, cs=16,snake_len = 2, temp, time;
int[] headx = new int[100];
int[] heady = new int[100];

int applex, appley;
void setup()
{
  size(480, 530);
  frameRate(5);
  background(255);
  headx[2] = 240;
  heady[2] = 240;
  fill(255);
  stroke(127);
   /*for(i=0;i<480;i+=cs)
  {
    for(j=0;j<480;j+=cs)
    {
      rect(i, j, cs, cs);
    }
  }*/
  rect(0, 480, 480, 50);
}
void draw()
{ 
  time++;
  check_food();
  if(time%40>38)
  {
    noStroke();
    fill(255);
    rect(applex, appley, cs, cs);
    applex = cs*round(random(1, 24));
    appley = cs*round(random(1,24));
    fill(255, 0, 0);
    rect(applex, appley, cs, cs);
    wrong_spawn();
  }
  check_dead();
  draw_snake(); 
  
}  
void check_food()
{
  if(count == 0 || (headx[snake_len]==applex && heady[snake_len]==appley))
  {
    time = 0;
    count++;
    snake_len++;
    score();
    fill(255, 0, 0);
    noStroke();
    applex = cs*round(random(1, 24));
    appley = cs*round(random(1,24));
    rect(applex, appley, cs, cs);
    wrong_spawn();
  }  
}
void check_dead()
{  
  if(headx[snake_len]>480 || heady[snake_len]>480 || headx[snake_len]<0 || heady[snake_len]<0)
  {
    fill(255);
    noStroke();
    rect(0, 0, 480, 530);
    fill(0);
    text("GAME OVER!",130, 250);
    text("SCORE:", 150, 285);
    text(count-1, 270, 285);
  }  
}
void draw_snake()
{ 
  noStroke();
  fill(0);
  headx[snake_len] = headx[snake_len-1] + dirx;
  heady[snake_len] = heady[snake_len-1] + diry;
  rect(headx[snake_len], heady[snake_len], cs, cs);
  for(i=0;i<snake_len;i++)
  {
    headx[i] = headx[i+1];
    heady[i] = heady[i+1];
  }
  if(temp != 0)
  {
    noStroke();
    fill(255);
    rect(headx[0], heady[0], cs, cs);
    fill(0);
  }  
}
void keyPressed()
{ temp = 1;
  if(keyCode == UP && diry==0){ diry = -cs;dirx = 0; }
  if(keyCode == DOWN && diry==0){ diry = cs;dirx = 0; }
  if(keyCode == LEFT && dirx==0){ dirx = -cs;diry = 0; }
  if(keyCode == RIGHT && dirx==0){ dirx = cs;diry = 0; }
  
  /*if(mouseX<width/2 && diry==0 && dirx>0){ diry = -cs;dirx = 0; }
  if(mouseX>width/2 && diry==0 && dirx<0){ diry = -cs;dirx = 0; }
  if(mouseX<width/2 && diry==0 && dirx<0){ diry = cs;dirx = 0; }
  if(mouseX>width/2 && diry==0 && dirx>0){ diry = cs;dirx = 0; }
  if(mouseX<width/2 && dirx==0 && diry>0){ dirx = -cs;diry = 0; }
  if(mouseX>width/2 && dirx==0 && diry<0){ dirx = -cs;diry = 0; }
  if(mouseX<width/2 && dirx==0 && diry>0){ dirx = cs;diry = 0; }
  if(mouseX>width/2 && dirx==0 && diry>0){ dirx = cs;diry = 0; }*/
  
}   
void score()
{
  fill(255);
  noStroke();
  rect(270, 490, 190, 32);
  fill(0);
  textSize(32);
  text("SCORE:", 150, 515);
  text(count-1, 270, 515);
}    
void wrong_spawn()
{
  for(i=0;i<snake_len;i++)
    {
      if(headx[i]==applex && heady[i]==appley)
      {
       applex = cs*round(random(1, 24));
       appley = cs*round(random(1,24));
       wrong_spawn();
      } 
    }  
}    

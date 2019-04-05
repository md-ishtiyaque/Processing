float   dirx = 1,diry = 1, k = -height/2, j =-198;
Slab[] s = new Slab[100];
int index, i, count, count2;
void setup(){
  size(600, 600);
  drawBackground();
  frameRate(50);
  for(count=0;count<50;count++){
     s[count] = new Slab();
  }
  count=0;
}


void draw(){
  drawBackground();
  for(count2=0;count2<50;count2++){
    s[count2].drawSlab();
    s[count2].updatetop();
  }
  count=0;
  //
}


void drawBackground(){
  loadPixels();
  for(i=0,index=i*width;i<600;i++) { 
    for(;index<(i+1)*width;index++){
      pixels[index] = color(255, 255, 200-i/3);
    }
  }
  updatePixels();
}  
void drawTop(){
   noStroke();
  fill(255, 0, 0);
  beginShape();
  vertex(200 + j, height/2 + k);
  vertex(width/2 + j, 350 + k);
  vertex(400 + j, height/2 + k);
  vertex(width/2 + j, 250 + k);
  endShape(CLOSE);
  fill(230, 0, 0);
  beginShape();
  vertex(200 + j, height/2 + k);
  vertex(width/2 + j, 350 + k);
  vertex(width/2 + j, 360 + k);
  vertex(200 + j, height/2+10 + k);
  endShape();
  fill(180, 0, 0);
  beginShape();
  vertex(width/2 + j, 350 + k);
  vertex(400 + j, height/2 + k);
  vertex(400 + j, height/2+10 + k);
  vertex(width/2 + j, 350+10 + k);
  endShape();  
} 
void updateTop(){
  if(j + 400>width || j + 200<0 ) { dirx*=-1;diry*=-1; }
  j+=2*dirx;
  k+=diry;
}
void keyPressed(){
  if(keyCode == ' '){
     s[count].endTop();
     count++;
  }
}

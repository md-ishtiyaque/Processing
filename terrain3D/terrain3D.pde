int columns, rows;
int scl = 20;
int w = 3000, h = 3000;
float[][] terrain;
float flying;
float terrainColor =120;


void setup(){
  colorMode(HSB, 360, 100, 100);
  size(displayWidth, displayHeight, P3D);
  columns = w/scl;
  rows = h/scl;
  terrain = new float[rows][columns];
}


void draw(){
  setEnvironment(); 
  generateTerrian();
  renderTerrain();
}


void setEnvironment(){
  background(0);
  translate(width/2 , height/2);
  rotateX(radians(60));
  translate(-w/2 , -h/2); 
  stroke(terrainColor%360, 100, 60);
  fill(terrainColor%360, 100, 40); 
  
}


void   generateTerrian(){
  flying-=0.02;
  float ynoise = flying;
  for(int y=0;y<columns;y++){
    float xnoise = 0;
    for(int x=0;x<rows;x++){
      terrain[x][y] = map(noise(xnoise, ynoise), 0, 1, -150, 150);
      xnoise+=0.1;
    }
    ynoise+=0.1;
  }
}


void renderTerrain(){
  for(int y=0;y<rows-1;y++){
    beginShape(TRIANGLE_STRIP);
    for(int x=0;x<columns;x++){
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);      
    }
    endShape();
  }
}

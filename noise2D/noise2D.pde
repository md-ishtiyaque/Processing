float offset;
void setup(){
  fullScreen();
  strokeWeight(2);
  colorMode(HSB, 360, 100, 100);
}


void draw(){
  loadPixels();
  for(int y=0; y<height;y+=2){
    for(int x=0; x<width; x+=2){
      int index = x + y*width;
      pixels[index] = color(noise(x*0.01 + offset, y*0.01 + offset)*360 - 50, 100, 100);
      pixels[index+1] = color(noise(x*0.01 + offset, y*0.01 + offset)*360 - 50, 100, 100);
      pixels[index+width] = color(noise(x*0.01 + offset, y*0.01 + offset)*360 - 50, 100, 100);
      pixels[index+width+1] = color(noise(x*0.01 + offset, y*0.01 + offset)*360 - 50, 100, 100);
    }
  }
  offset+=0.05;
  updatePixels();
}

int Hue;
int Saturation;
int Brightness;
int factor = height;


void setup(){
  background(0);
  fullScreen();
  orientation(LANDSCAPE);
  colorMode(HSB, height, height, height);
  noLoop();
}


void draw(){
   displayHSPicker();
}

void mousePressed(){
  if(mouseX < height){
    displayBPicker();
  }
   else if(mouseX < height + ( width -  height) / 2){
     displayPickedColour();
   }
   
}


void displayHSPicker(){
  noStroke();
  for(int Hue = 0; Hue < height; Hue += factor){
    for(int Saturation = 0; Saturation < height; Saturation += factor){
      stroke(Hue, Saturation, height);
      fill(Hue, Saturation, height);
      rect(Hue, Saturation, factor, factor);
    }
  }
}


void displayBPicker(){
  Hue = mouseX;
  Saturation = mouseY;
  for(int Brightness = 0; Brightness < height; Brightness++){
    stroke(Hue, Saturation, Brightness);
    line(height , Brightness,  height + ( width -  height) / 2, Brightness);
   }
}


void displayPickedColour(){
   Brightness = mouseY;
   noStroke();
   fill(Hue, Saturation, Brightness);
   rect(height + ( width -  height) / 2, 0, width, height);
}

int Hue;
int Saturation;
int Brightness;



void setup(){
  background(0);
  size(600, 600);
  colorMode(HSB, 400, 600, 600);
  for(Hue=0;Hue<400;Hue++){
    for(Saturation=0;Saturation<600;Saturation++){
      stroke(Hue, Saturation, 600);
      point(Hue, Saturation);
    }
  }
}


void draw(){
 
}

void mousePressed(){
  if(mouseX<400)
    Hue = mouseX;
  Saturation = mouseY;
  for(Brightness = 0; Brightness< 600; Brightness++){
    stroke(Hue, Saturation, Brightness);
    line(450, Brightness, 550, Brightness);
   }
}

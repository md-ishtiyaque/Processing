float  newa, newb, a, b, x, y, consta, constb;
float  magnification=1.5;
int n, index;
void setup(){
 size(800, 800); 
 background(0);
 mandelbrotSetFunction();
}



void draw(){
  
}



void mandelbrotSetFunction(){
 loadPixels();
  for(int y=0;y<height;y++){
    for(int x=0;x<width;x++){
      index = y*(width)+x;
      a = map(x, 0, width, -magnification, magnification);
      b = map(y, 0, height, -magnification, magnification);
      consta = a;
      constb = b;
      for(n=0;n<50;n++){
        newa = a*a - b*b +consta;
        newb = 2*a*b + constb;
        a = newa;
        b = newb;
        if(abs(a+b)>100){break;}
      }
      pixels[index] = color(map(n, 3, 50, 255, 0));      
    }
  }
  //arrayCopy(pixels, 0, pixels, 300, (height-1)*width);
  updatePixels(); 
}

String[] time = new String[8];
String[] monday = new String[8];
String[] tuesday = new String[8];
String[] wednesday = new String[8];
String[] thursday = new String[8];
String[] friday = new String[8];
String[] saturday = new String[8];
int col, row;

void setup(){
  fullScreen();
  background(0);
  
  //time
  time[0] = "           -";time[1] =  "  8:30-9:30";time[2] =  "  9:30-10:30";time[3] =  "10:45-11:45";
  time[4] = "11:45-12:30";time[5] =  " 12:30-1:30";time[6] =  "  1:30-2:30";time[7] =  "  2:30-3:30";
  
  //Monday
  monday[0] = "   MONDAY";monday[1] = "       OOC";monday[2] = "        DC" ;monday[3] = "        M4";
  monday[4] = "    LUNCH" ;monday[5] ="        SE" ;monday[6] = "        MP";monday[7] = "       DAA";
  
  //Tuesday
  tuesday[0] = "  TUESDAY";tuesday[1] = "       OOC";tuesday[2] = "        MP";tuesday[3] = "      CLUB";
  tuesday[4] = "    LUNCH";tuesday[5] = "        SE";tuesday[6] = "        DC";tuesday[7] = "        M4";
  
  //Wednesday
  wednesday[0] = "  WENSDAY";wednesday[1] = "        MP";wednesday[2] = "       DAA";wednesday[3] = "        KK";
  wednesday[4] = "    LUNCH";wednesday[5] = "   MP LAB";wednesday[6] = "   MP LAB";wednesday[7] = "   MP LAB";
  
  //Thursday
  thursday[0] = " THURSDAY";thursday[1] = "       DAA";thursday[2] = "        DC";thursday[3] = "        M4";
  thursday[4] = "    LUNCH";thursday[5] = "   DAA LAB";thursday[6] = "   DAA LAB";thursday[7] = "   DAA LAB";
  
  //Friday
  friday[0] = "   FRIDAY";friday[1] = "       JVG";friday[2] = "       JVG";friday[3] = "       DAA";
  friday[4] = "    LUNCH";friday[5] = "        M4";friday[6] = "        SE";friday[7] = "       OOC";
  
  //Saturday
  saturday[0] = " SATURDAY";saturday[1] = "        DC";saturday[2] = "        SE";saturday[3] = "        DC";
  saturday[4] = "    LUNCH";saturday[5] = "       OOC";saturday[6] = "        MP";saturday[7] = "       OOC";
}

void draw(){
  renderTable();
  renderText();
}

void renderTable(){
  stroke(255);
  strokeWeight(5);
  smooth();
  col = width/8;
  row = height/7;
  for(int i = 0; i <= 8; i++)
      line(col * i - i/2, 0, col * i - i/2, height);
  for(int i = 0; i <= 7; i++)
      line(0, row * i - i/2, width, row * i - i/2);    
}


void renderText(){
  textSize(map(width, 0, 2160, 0, 50));
  for(int i = 0; i < 8; i++){
    text(time[i],      i * col, 0 * row + row/2 + 20);
    text(monday[i],    i * col, 1 * row + row/2 + 20);
    text(tuesday[i],   i * col, 2 * row + row/2 + 20);
    text(wednesday[i], i * col, 3 * row + row/2 + 20);
    text(thursday[i],  i * col, 4 * row + row/2 + 20);
    text(friday[i],    i * col, 5 * row + row/2 + 20);
    text(saturday[i],  i * col, 6 * row + row/2 + 20);
  }
  noLoop();
}

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
  orientation(LANDSCAPE);
  background(0);
  
  //time
  time[0] = "";time[1] =  "  8:45-9:45";time[2] =  " 9:45-10:45";time[3] =  "11:00-12:00";
  time[4] = "12:00-12:45";time[5] =  " 12:45-1:45";time[6] =  "  1:45-2:45";time[7] =  "  2:45-3:45";
  
  //Monday
  monday[0] = "   MONDAY";monday[1] = "    CN LAB";monday[2] = "    CN LAB" ;monday[3] = "    CN LAB";
  monday[4] = "    LUNCH" ;monday[5] ="     DBMS" ;monday[6] = "      M&E";monday[7] = "     AT&C";
  
  //Tuesday
  tuesday[0] = "  TUESDAY";tuesday[1] = "        C#";tuesday[2] = "        CN";tuesday[3] = "        CA";
  tuesday[4] = "    LUNCH";tuesday[5] = "        AJ";tuesday[6] = "     AT&C";tuesday[7] = "        AJ";
  
  //Wednesday
  wednesday[0] = "  WENSDAY";wednesday[1] = "        CN";wednesday[2] = "      M&E";wednesday[3] = "        C#";
  wednesday[4] = "    LUNCH";wednesday[5] = "     DBMS";wednesday[6] = "        C#";wednesday[7] = "        CN";
  
  //Thursday
  thursday[0] = " THURSDAY";thursday[1] = "     DBMS";thursday[2] = "     AT&C";thursday[3] = "        C#";
  thursday[4] = "    LUNCH";thursday[5] = " DBMS LAB";thursday[6] = " DBMS LAB";thursday[7] = " DBMS LAB";
  
  //Friday
  friday[0] = "   FRIDAY";friday[1] = "        AJ";friday[2] = "     DBMS";friday[3] = "     AT&C";
  friday[4] = "    LUNCH";friday[5] = "      M&E";friday[6] = "      JGC";friday[7] = "      JGC";
  
  //Saturday
  saturday[0] = " SATURDAY";saturday[1] = "      M&E";saturday[2] = "        CN";saturday[3] = "        AJ";
  saturday[4] = "    LUNCH";saturday[5] = "      M&E";saturday[6] = "        CN";saturday[7] = "        AJ";
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
  textSize(map(width, 0, 2160, 0, 50)/1.25);
  text("Ishtiyaque's", height / 50, height / 15.428);
  text("app", height /12, height / 9);
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

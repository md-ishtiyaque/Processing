int n = 200;
int col, iter;
int[] a = new int[n];
int[] arrayOfMids = new int[floor(log(n)/log(2)) + 1];
int count, elem;

void setup(){
  background(0);
  frameRate(1);
  size(800, 800);
  col = width/n;
  for(int i = 0; i < n; i++){
    a[i] = i*height/n;
    println(a[i]);
  }
  elem = floor(random(200))*col;println(elem);
  binSearch(elem);
}


void draw(){
  render();
}


void binSearch(int search){
   int first = 0;
   int last = n - 1;
   int middle = (first+last)/2;
   store(middle);
 
   while (first <= last) {
      if (a[middle] < search)
         first = middle + 1;    
      else if (a[middle] == search) {
         return;
      }
      else
         last = middle - 1;
 
      middle = (first + last)/2;
      store(middle);
   }
 }
 
 
 void store(int middle){
   arrayOfMids[count++] = middle;
 }
 
 
 void render(){
   for(int i = 0; i < n; i++){
     fill(255);
     if(a[i] == elem) fill(0, 0, 255);
     if(i == arrayOfMids[iter]) fill(255, 0, 0);
     rect(col * i, height, col, -a[i]);
   }
   iter = (iter+1)%(floor(log(n)/log(2)) + 1);
 }

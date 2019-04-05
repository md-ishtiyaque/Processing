int maxSize = 40;
int[] a;
int[][] b = new int[200][maxSize];
int storeCounter, iter, pivotCounter = 0, count;
int[][]c = new int[3][200];
void setup(){
  frameRate(1);
  a = new int[maxSize];;
  for(int i =0; i < maxSize; i++)
    a[i] = floor(random(100, height));
  fullScreen();
  background(0);
  qSort(0, maxSize - 1);
}


void draw(){
  render();
}

void render(){
    background(0);
    for(int i =0; i < maxSize; i++){
      fill(255);
      if(c[0][count] == i){ fill(0, 0, 255); }
      if(c[1][count] == i || c[2][count] == i){ fill(255, 0, 0); }
      //if(c[0][count] == i && c[1][count] == i || c[0][count] == i && c[2][count] == i){ fill(0, 255, 0); }
    rect(width /  maxSize * i, height, width / maxSize, -b[iter][i]);
  }
  iter++;count++;
}



void qSort(int first,int last){
   int i, j, pivot, temp;
   if(first<last){
      pivot=first;
      i=first;
      j=last;
      while(i<j){
         while(a[i]<=a[pivot]&&i<last)
            i++;
         while(a[j]>a[pivot])
            j--;
         if(i<j){
            temp=a[i];
            a[i]=a[j];
            a[j]=temp;
            c[0][pivotCounter] = pivot;
            c[1][pivotCounter] = i;
            c[2][pivotCounter] = j;
            pivotCounter++;
            for(int k = 0; k< maxSize; k++){ b[storeCounter][k] = a[k]; }storeCounter++;
         }
         else{
           c[0][pivotCounter] = pivot;
           c[1][pivotCounter] = -1;
           c[2][pivotCounter] = -1;
           pivotCounter++;
         }
      }

      temp=a[pivot];
      a[pivot]=a[j];
      a[j]=temp;
      c[0][pivotCounter] = pivot;
      c[1][pivotCounter] = pivot;
      c[2][pivotCounter] = j;
      pivotCounter++;
      for(int k = 0; k< maxSize; k++){ b[storeCounter][k] = a[k]; }storeCounter++;
      qSort(first,j-1);
      qSort(j+1,last);

   }
}

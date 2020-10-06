void setup() 
{
int n=20;
int[] array=new int[n];
for (int i=0;i<n;i++)
array[i] = (int)random(0,100);
print_array(array);
heap_sort(array);
print_array(array);
}
void heap_sort(int[] array) 
{
int n=array.length;
//Inserción
for(int i=1;i<n;i++)
{
 int j=i;
 while(array[j]>array[j/2] && j>1)
 {
   swap(array,j,j/2);
   j=j/2;
 }
}
//Elimnación
for(int i=n-1;i>=2;i--)
{
  swap(array, i, 1);
  int j=1;
  while((j*2<i && array[j*2]>array[j]) || (j*2+1<i && array[j*2+1]>array[j]))
  {
    if(j*2+1>=i || array[j*2]>array[j*2+1])
    {
     swap(array, j, j*2); 
     j=j*2;
    }
    else
    {
     swap(array, j, j*2+1); 
     j=j*2+1;
    }
  }
}
}

void swap(int[] array, int i, int j) 
{
int aux=array[i];
array[i]=array[j];
array[j]=aux;
}

void print_array(int[] array) 
{
print("[");
int n = array.length;
for (int i=1;i<n;i++)
{
print(array[i]); print(",");
}
println("]");
}

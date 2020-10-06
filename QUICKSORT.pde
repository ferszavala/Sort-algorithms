void setup() 
{
  int[] array = new int[20];
  for (int i=0;i<array.length;i++)
  array[i] = (int)random(0, 100);
  print_array(array);
  quicksort(array);
  print_array(array);
}
void quicksort(int[] array) {
quicksortR(array,0,array.length-1);
}
void quicksortR(int[] arr,int inicio,int fin)
{
  int p = inicio;
  int i = inicio+1;
  int d = fin;
  do
  {
    while((arr[i]<=arr[p])&&(i<d))
    {
      i++;
    }
    while(arr[d]>arr[p])
    {
      d--;
    }
    if(i<d)
    {
      swap(arr,i,d);
    } 
  }while(i<d);
  
  swap(arr,p,d);
  
  if(inicio<d-1)
  {
    quicksortR(arr,inicio,d-1);
  }
  if(d+1<fin)
  {
    quicksortR(arr,d+1,fin);
  }
}

void swap(int[] array, int i, int j) 
{
  int aux = array[i];
  array[i] = array[j];
  array[j] = aux;
}

void print_array(int[] array) 
{
print("[");
  for (int i=1; i<array.length; i++) 
  {
  print(array[i]);print(",");
  }
println("]");
}

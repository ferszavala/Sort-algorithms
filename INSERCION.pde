void setup()
{
  int n=8; 
  int array[]= new int[n];
  for (int i=0; i<n; i++)
  {
    array[i]=(int)random(0, 100);
  }
  print_array(array);
  insertion(array);
  print_array(array);
}

void insertion(int[] array)
{ 
  int n=array.length;
  int j;
  int aux;
  for (int i=1;i<n;i++)
  {
    aux = array[i]; 
    j=i-1; 
    while((j>=0)&&(aux<array[j]))
    {                                                 
      array[j+1] = array[j];    
      j--;                
    }
    array[j+1]=aux; 
  }
}
void print_array(int[] array)
   {
      print("[");
      int n=array.length;
      for (int i=0; i<n; i++)
      {
        print(array[i]);
        print(",");
      }
      println("]");
   }

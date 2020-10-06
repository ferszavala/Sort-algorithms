void setup()
{
   int n=9;
   int[] array = new int [n];
   for(int i=0;i<n;i++)
   {
      array[i]=(int)random(0,100);
   }
      print_array(array);
      bubble_sort(array);
      print_array(array);
}
   void bubble_sort(int[] array)
   {
      int n=array.length;
      for(int i=n-1;i>0;i--)
      {
         for(int j=0;j<i;j++)
         {
            if(array[j]>array[j+1])
            {
               swap(array,j,j+1);
            }
         }  
      }
   }
   void swap(int[] array, int i, int j)
   {
    int aux = array[i];
    array[i] =array[j];
    array[j]=aux;
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

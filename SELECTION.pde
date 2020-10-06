void setup()
{
   int n=9;
   int[] array = new int [n];
   for(int i=0;i<n;i++)
   {
      array[i]=(int)random(0,100);
   }
      print_array(array);
      selection(array);
      print_array(array);
}
   void selection(int[] array)
   {
      int n=array.length;
      for(int i=0;i<n;i++)
      {
         for(int j=i;j<n;j++)
         {
            if(array[i]>array[j])
            {
               swap(array,i,j);
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

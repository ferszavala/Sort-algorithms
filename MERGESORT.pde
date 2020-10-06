void setup()
{
  int n = 20;
  int[] arr = new int[n];
  for (int i=0; i<arr.length; i++)
  {
    arr[i] = (int)random(0, 100);
  }
  print_array(arr);
  mergesort(arr);
  print_array(arr);
}

void mergesort(int[] arr)
{
  int[] arr_copia = new int[arr.length];
  mergesortR(arr, arr_copia, 0, arr.length-1);
}

void mergesortR(int[] arr, int[] arr_copia, int ini, int fin)
{
  // Casos base, cuando tengo 1 o 2 elementos
  if ( ini>=fin) return;
  if (fin-ini==1) 
  {   
    if ( arr[ini]>arr[fin] )
      swap(arr, ini, fin);
    return;
  }
  // Calcular el punto medio de la lista
  int pm = ini+(fin-ini)/2;
  // Llamada recursiva

  // 1ra recursiva - del inicio al punto medio
  mergesortR(arr, arr_copia, ini, pm);
  // 2da recursiva - del punto medio +1 al fin
  mergesortR(arr, arr_copia, pm+1, fin);
  // Merge:   i, j, k
  int i= ini;
  int j=pm+1;

  for (int k=ini; k <= fin; k++) 
  {
    if (i <= pm && j<=fin && arr[i] <= arr[j]) 
    {  
      arr_copia[k] = arr[i];  
      i++;
    } 
    else if (j > fin) 
    {
      arr_copia[k] = arr[i];
      i++;
    } 
    else 
    {
      arr_copia[k] = arr[j];
      j++;
    }
  }

  for (int k=ini; k<=fin; k++) 
  {
    arr[k] = arr_copia[k];
  }
}


void swap(int[] array, int i, int j) 
{
  int aux = array[i];
  array[i] = array[j];
  array[j] = aux;
}

void print_array(int[] arr) {
  for (int i=0; i<arr.length; i++) {
    print(arr[i]);
    print(",");
  }
  println();
}
